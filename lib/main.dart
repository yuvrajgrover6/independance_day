import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:independance_day/firebase_options.dart';
import 'package:independance_day/pages/name_input.dart';

void main() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Independance Day',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const NameInput());
  }
}
