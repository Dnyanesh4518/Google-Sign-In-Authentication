import 'dart:convert';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:sign_in_with_google/Models/loginUser.dart';
import 'package:sign_in_with_google/Screens/Home.dart';
import 'package:sign_in_with_google/src/locations.dart' as locations;

import '../Models/firebaseUser.dart';
 class authServices
{
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn();
   Future signInWithEmailPassword(BuildContext context,loginUser _login) async
  {

     try
         {
           UserCredential userCredential  = await FirebaseAuth.instance.signInWithEmailAndPassword(email:_login.email.toString(), password:_login.password.toString());
           User? user = userCredential.user;
           return _firebaseUser(user);
         } on FirebaseAuthException catch(e)
        {
          return firebaseUser(code: e.code,uid: null);
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content:Text(e.message.toString())));
        }

  }
   Future<User?> signInWithGoogle({required BuildContext context}) async
  {
    User? user;
    final GoogleSignInAccount? googleSignInAccount = await googleSignIn.signIn();
    if(googleSignInAccount!=null)
      {
        final GoogleSignInAuthentication googleSignInAuthentication = await googleSignInAccount.authentication;

        final AuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googleSignInAuthentication.accessToken,
          idToken: googleSignInAuthentication.idToken
        );

        try
            {
              final UserCredential userCredential = await _auth.signInWithCredential(credential);

              user = userCredential.user;
            }
            on FirebaseAuthException catch(e)
           {
               ScaffoldMessenger.of(context).showSnackBar(SnackBar(content:Text(e.message.toString())));
           }
      }
    return user;
  }
  Future registerEmailPassword({required BuildContext context,required loginUser login}) async
  {
    User? user;
    try
        {
          UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
              email:login.email.toString(),
              password:login.password.toString());
              user = userCredential.user;
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content:Text("Registered successfully")));

        }
    on FirebaseAuthException catch(e)
        {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content:Text(e.message.toString())));
        }
        return user;
  }

  Future verifyPhoneNumber(String mobile,BuildContext context,PhoneAuthCredential credential) async
  {
      _auth.verifyPhoneNumber(
          phoneNumber:mobile,
          timeout:const Duration(seconds:60),
          verificationCompleted:(PhoneAuthCredential credential){},
          verificationFailed: (FirebaseAuthException e){},
          codeSent: (String verificationId, int? resendToken){},
          codeAutoRetrievalTimeout: (String verificationId){}
      );
  }
  Future signOut() async
  {
    try
    {
      await _auth.signOut();
      await googleSignIn.signOut();
    }
    catch(e)
    {
      return null;
    }
  }
  firebaseUser? _firebaseUser(User? user)
  {
    return user !=null ? firebaseUser(uid: user.uid): null;
  }
  Stream<firebaseUser?> get user
  {
    return _auth.authStateChanges().map(_firebaseUser);

  }

}



