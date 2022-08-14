import 'package:flutter/material.dart';
import 'package:animated_background/animated_background.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:share_plus/share_plus.dart';

class NameInput extends StatefulWidget {
  String? name;
  // retrieve the name from persistent storage

  NameInput({Key? key, this.name}) : super(key: key);

  @override
  State<NameInput> createState() => _NameInputState();
}

class _NameInputState extends State<NameInput> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    final TextEditingController nameController = TextEditingController();
    String? name = widget.name;
    String? urlName = name?.replaceAll(' ', '+');
    nameController.addListener(() {
      name = nameController.text;
      urlName = name?.replaceAll(' ', '+');
    });
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    final condition = (width < 800);
    return Scaffold(
      body: Center(
        child: AnimatedBackground(
          behaviour: RacingLinesBehaviour(
            direction: LineDirection.Ltr,
            numLines: 20,
          ),
          vsync: this,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    AnimatedTextKit(repeatForever: true, animatedTexts: [
                      WavyAnimatedText(
                        name ?? "Yuvraj",
                        textStyle: GoogleFonts.acme(
                            textStyle: TextStyle(
                                fontSize:
                                    condition ? width * 0.1 : width * 0.04,
                                color: Colors.orange)),
                      )
                    ]),
                    condition
                        ? Column(
                            children: [
                              Text('WISHES',
                                  style: GoogleFonts.acme(
                                    textStyle: TextStyle(
                                        fontSize: width * 0.2,
                                        color: Colors.green),
                                  )),
                              Text('YOU',
                                  style: GoogleFonts.acme(
                                    textStyle: TextStyle(
                                        fontSize: width * 0.2,
                                        color: Colors.orange),
                                  ))
                            ],
                          )
                        : Container(
                            width: width,
                            alignment: Alignment.center,
                            child: Text.rich(TextSpan(
                                text: 'WISHES ',
                                style: GoogleFonts.acme(
                                    textStyle: TextStyle(
                                        fontSize: width * 0.04,
                                        color: Colors.orange)),
                                children: [
                                  TextSpan(
                                    text: ' YOU',
                                    style: TextStyle(
                                        fontSize: width * 0.04,
                                        color: Colors.green),
                                  ),
                                ]))),
                    Image.network(
                        'https://firebasestorage.googleapis.com/v0/b/independanceday-56d4b.appspot.com/o/image.png?alt=media&token=408c840e-9ae4-4c76-aea0-54b56e82bef5'),
                  ],
                ),
                Center(
                  child: condition
                      ? Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: width * 0.02),
                              height: height * 0.07,
                              width: width * 0.7,
                              color: const Color.fromARGB(59, 76, 175, 79),
                              child: TextFormField(
                                controller: nameController,
                                decoration: const InputDecoration(
                                  border: InputBorder.none,
                                  focusedBorder: InputBorder.none,
                                  enabledBorder: InputBorder.none,
                                  hintText: 'Enter Your Name To Create Wish',
                                  hintStyle: TextStyle(
                                      color: Colors.green,
                                      fontWeight: FontWeight.bold),
                                ),
                                style: const TextStyle(
                                    color: Colors.green,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            SizedBox(height: height * 0.008),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(
                                  height: height * 0.05,
                                  child: ElevatedButton(
                                      style: ButtonStyle(
                                          backgroundColor:
                                              MaterialStateProperty.all(
                                                  Colors.orange)),
                                      onPressed: () => context
                                          .go('/?query=${nameController.text}'),
                                      child: const Text('Submit')),
                                ),
                                SizedBox(width: width * 0.01),
                                SizedBox(
                                  height: height * 0.05,
                                  child: ElevatedButton(
                                    style: ButtonStyle(
                                        backgroundColor:
                                            MaterialStateProperty.all(
                                                Colors.green)),
                                    onPressed: () => Share.share(
                                        subject:
                                            'Happy Independance Day wish By $name',
                                        'Happy Independance Day wish By $name         https://independanceday-56d4b.web.app/#/?query=$urlName'),
                                    child: const Text('Share '),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        )
                      : Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: width * 0.02),
                              height: height * 0.07,
                              width: width * 0.7,
                              color: const Color.fromARGB(59, 76, 175, 79),
                              child: TextFormField(
                                controller: nameController,
                                decoration: const InputDecoration(
                                  border: InputBorder.none,
                                  focusedBorder: InputBorder.none,
                                  enabledBorder: InputBorder.none,
                                  hintText: 'Enter Your Name To Create Wish',
                                  hintStyle: TextStyle(
                                      color: Colors.green,
                                      fontWeight: FontWeight.bold),
                                ),
                                style: const TextStyle(
                                    color: Colors.green,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            SizedBox(width: width * 0.05),
                            SizedBox(
                              height: height * 0.05,
                              child: ElevatedButton(
                                  style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all(
                                              Colors.orange)),
                                  onPressed: () => context
                                      .go('/?query=${nameController.text}'),
                                  child: const Text('Submit')),
                            ),
                            SizedBox(width: width * 0.01),
                            SizedBox(
                              height: height * 0.05,
                              child: ElevatedButton(
                                style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty.all(
                                        Colors.green)),
                                onPressed: () {
                                  print(
                                      "https://independanceday-56d4b.web.app/#/?query=$urlName");
                                  Share.share(
                                      subject:
                                          'Happy Independance Day wish By $name',
                                      'https://independanceday-56d4b.web.app/#/?query=$urlName');
                                },
                                child: const Text('Share '),
                              ),
                            ),
                          ],
                        ),
                ),
                SizedBox(height: height * 0.01),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
