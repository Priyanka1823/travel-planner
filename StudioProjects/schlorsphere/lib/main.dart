

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:scholorsphere/signin.dart';
import 'package:scholorsphere/verification.dart';
import 'firebase_options.dart';

Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp( options: DefaultFirebaseOptions.currentPlatform,);

  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: '/',
    routes: {
      '/' : (context) => SignIn(),
      'otp' : (context) => MyOtp(),
    },
  ));
}


