import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_app_check/firebase_app_check.dart';
import 'package:petapp/Screens/Dogs/InsertDogsDetails.dart';
import 'package:petapp/Screens/MainPages/SpashScreen.dart';

import 'Screens/Dogtrainig/InsertDogsTraingDetails.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
   await FirebaseAppCheck.instance.activate(
    webRecaptchaSiteKey: 'recaptcha-v3-site-key',
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
       debugShowCheckedModeBanner: false,
      title: 'Pet App',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple
      ),
      home: (InsertDogTraining()),
    );
  }
}

