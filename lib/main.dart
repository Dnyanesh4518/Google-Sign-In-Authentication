import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:sign_in_with_google/Authentication/AuthServices.dart';
import 'package:sign_in_with_google/Screens/GoogleSignIn.dart';
import 'package:sign_in_with_google/Screens/Home.dart';
import 'package:sign_in_with_google/Screens/UI/MyPlaylist.dart';

import 'Screens/demo.dart';
import 'Screens/register.dart';
void main() async
{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp( MyApp());
}
class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // home:GMaps(),
      home: GoogleSignIn(),
    );
  }
}
