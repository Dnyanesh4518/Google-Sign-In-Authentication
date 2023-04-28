import 'package:flutter/material.dart';
import 'package:sign_in_with_google/Authentication/AuthServices.dart';
import 'package:sign_in_with_google/Models/loginUser.dart';
import 'package:sign_in_with_google/Screens/login.dart';

import 'GoogleSignIn.dart';

class register extends StatefulWidget {
  const register({Key? key}) : super(key: key);

  @override
  State<register> createState() => _registerState();
}

class _registerState extends State<register> {
  final authServices _auth = authServices();
  bool _obsecureText = true;
  final _email = TextEditingController();
  final _password = TextEditingController();
  GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final emailField = TextFormField(
      controller: _email,
      autofocus: false,
      validator: (value)
      {
        if(value!=null)
        {
          if(value.contains('@')&&value.endsWith('.com'))
          {
            return null;
          }
          return 'Enter a valid Email Address';
        }
      },
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0,15.0,20.0,15.0),
          hintText: "Email",
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0))
      ),
    );
    final passwordField = TextFormField(
      obscureText: _obsecureText,
      controller: _password,
      autofocus: false,
      validator: (value)
      {
        if(value==null || value.trim().isEmpty)
        {
          return 'This Field is required';
        }
        if(value.trim().length<8)
        {
          return 'Password must be at least 8 characters in length';
        }
        return null;
      },
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0,15.0,20.0,15.0),
          hintText: "Password",
          filled: true,
          fillColor: Colors.white,
          suffixIcon: IconButton(
            icon: Icon(_obsecureText ? Icons.visibility:Icons.visibility_off),
            onPressed: (){
              setState(() {
                _obsecureText = !_obsecureText;
              });
            },

          ),

          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0))
      ),
    );
    return Scaffold(
      appBar:  AppBar(
        title:Text("Register"),
      ),
      body: ListView(
      children: [
        Form(
          key: _formkey,
            child:Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 65.0),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: emailField,
                ),
                SizedBox(height: 15.0),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: passwordField,
                ),
                SizedBox(height: 12.0,),
                SizedBox(height:40,
                child: TextButton(
                  child:Text("Login....."),
                  onPressed: (){
                    Navigator.push(context,MaterialPageRoute(builder:(context)=>GoogleSignIn()));
                  },
                    )),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 110),
                  child: ElevatedButton(
                    onPressed: () async {
                      // Navigator.pushReplacement(context,MaterialPageRoute(builder:(context)=>Login()));
                      if(_formkey.currentState!.validate())
                      {
                        await _auth.registerEmailPassword(context: context, login:loginUser(email: _email.text,password: _password.text));
                      }
                    },
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: const Text("Register",style: TextStyle(fontSize:19),),
                    ),
                  ),
                )
              ],
            ))
      ],
      ),

    );
  }
}
