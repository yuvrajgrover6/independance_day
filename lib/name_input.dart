import 'package:flutter/material.dart';
import 'package:animated_background/animated_background.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:share_plus/share_plus.dart';

class NameInput extends StatefulWidget {
  String? name;
  NameInput({Key? key, this.name}) : super(key: key);

  @override
  State<NameInput> createState() => _NameInputState();
}

class _NameInputState extends State<NameInput> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    final TextEditingController nameController = TextEditingController();
    String? name = widget.name;
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
                    condition
                        ? Column(
                            children: [
                              SizedBox(
                                height: 200,
                                child: OverflowBox(
                                  minHeight: 500,
                                  maxHeight: 500,
                                  child: Lottie.network(
                                      'https://assets5.lottiefiles.com/packages/lf20_kkxevalq.json',
                                      fit: BoxFit.fill),
                                ),
                              ),
                              const SizedBox(height: 120),
                              SizedBox(
                                height: 200,
                                child: OverflowBox(
                                  minHeight: 450,
                                  maxHeight: 450,
                                  child: Lottie.network(
                                      'https://assets5.lottiefiles.com/packages/lf20_go5dsuyi.json',
                                      fit: BoxFit.fill),
                                ),
                              ),
                              const SizedBox(height: 120),
                            ],
                          )
                        : Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Lottie.network(
                                'https://assets5.lottiefiles.com/packages/lf20_kkxevalq.json',
                              ),
                              const SizedBox(width: 50),
                              Lottie.network(
                                  'https://assets5.lottiefiles.com/packages/lf20_go5dsuyi.json',
                                  height: width * 0.4),
                            ],
                          ),
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
                                      onPressed: () => Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => NameInput(
                                                    name: nameController.text,
                                                  ))),
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
                                        'https://play.google.com/store/apps/details?id=com.yuvraj.shareplus'),
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
                                  onPressed: () => Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => NameInput(
                                                name: nameController.text,
                                              ))),
                                  child: const Text('Submit')),
                            ),
                            SizedBox(width: width * 0.01),
                            SizedBox(
                              height: height * 0.05,
                              child: ElevatedButton(
                                style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty.all(
                                        Colors.green)),
                                onPressed: () => Share.share(
                                    subject:
                                        'Happy Independance Day wish By $name',
                                    'crm'),
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
