import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sign_in_with_google/Screens/GoogleSignIn.dart';
import '../Authentication/AuthServices.dart';
import '../Models/loginUser.dart';
import 'Home.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
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
      appBar: AppBar(
        title: Text("Login"),
      ),
      body: ListView(
        children: [
          Form(
            key: _formkey,
              child:Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.fromLTRB(25, 90,25,0),
                    child: Card(
                      child:Center(child: Text("Welcome",style: TextStyle(fontSize: 24,fontStyle: FontStyle.italic,fontWeight: FontWeight.w500,fontFamily:"Times New Roman"),),),elevation: 0,),),
                  const SizedBox(height: 45.0),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: emailField,
                  ),
                  const SizedBox(height: 25.0),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: passwordField,
                  ),
                  const SizedBox(height: 35.0,),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 120),
                    child: ElevatedButton(
                      onPressed: () async {
                        if(_formkey.currentState!.validate())
                        {
                          User? myuser = await _auth.signInWithEmailPassword(context,loginUser(email: _email.text,password: _password.text));
                          if(myuser!=null)
                          {
                            Navigator.pushReplacement(context,MaterialPageRoute(builder:(context)=>Home(user:myuser)));
                          }
                        }
                      },
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))
                      ),
                      child:const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text("Sign In",style: TextStyle(fontSize: 19),),
                      ),
                    ),
                  ),
                  SizedBox(height: 10,),
                  Padding(padding:EdgeInsets.symmetric(horizontal: 80),
                  child: ElevatedButton(
                    onPressed:(){
                      Navigator.pushReplacement(context,MaterialPageRoute(builder:(context)=>GoogleSignIn()));
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("Back to Home",style: TextStyle(fontSize: 19),),
                    ),
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))
                    ),

                  )
                    ,)
                ],
              ))
        ],
      )
    );
  }
}
