import 'package:flutter/material.dart';

class NameInput extends StatelessWidget {
  const NameInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Center(
        child: Container(
          width: width * 0.7,
          color: Color.fromARGB(59, 76, 175, 79),
          child: TextFormField(
            decoration: InputDecoration(
              labelText: 'Enter Your Name',
            ),
          ),
        ),
      ),
    );
  }
}
