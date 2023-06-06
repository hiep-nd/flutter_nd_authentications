import 'package:example/example_page.dart';
import 'package:flutter/material.dart';
import 'package:nd_authentications/nd_authentications.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:example/firebase_options.dart';

void main() async {
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ExamplePage(authentication: _authen),
    );
  }

  // Privates
  final _authen = NDAuthentication.create();
}
