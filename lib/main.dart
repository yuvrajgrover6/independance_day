import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:independance_day/firebase_options.dart';
import 'package:independance_day/name_input.dart';
import 'package:go_router/go_router.dart';

void main() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Independance Day',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routeInformationProvider: _router.routeInformationProvider,
      routeInformationParser: _router.routeInformationParser,
      routerDelegate: _router.routerDelegate,
    );
  }

  final GoRouter _router = GoRouter(routes: <GoRoute>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        final query = state.queryParams['query']; // may be null
        return NameInput(
          name: query,
        );
      },
    )
  ]);
}
