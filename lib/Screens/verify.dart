import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:sign_in_with_google/Screens/GoogleSignIn.dart';
import 'package:sign_in_with_google/Screens/Home.dart';
import 'package:sign_in_with_google/Screens/PhoneNumberLoginScreen.dart';
class OTPVerify extends StatefulWidget {
  const OTPVerify({Key? key}) : super(key: key);

  @override
  State<OTPVerify> createState() => _OTPVerifyState();
}

class _OTPVerifyState extends State<OTPVerify> {
  final _auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    final defalutPinTheme = PinTheme(
      width: 56,
      height: 56,
      textStyle: TextStyle(
        fontSize: 20,
        color: Colors.purple,
        fontWeight: FontWeight.w600),
        decoration: BoxDecoration(
        border: Border.all(color: Colors.purple),
          borderRadius: BorderRadius.circular(20))
    );
    
    final focusedPinTheme = defalutPinTheme.copyDecorationWith(
      border: Border.all(color: Colors.yellowAccent),
      borderRadius: BorderRadius.circular(20));
    
    final submittedPinTheme = defalutPinTheme.copyWith(
      decoration: defalutPinTheme.decoration?.copyWith(
        color:Colors.redAccent));
    var code ="";
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed:(){
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios_new_rounded),
          color:Colors.black,
        ),
        elevation: 0,
      ),
      body: Container(
        margin: const EdgeInsets.only(left: 25,right: 25),
        alignment: Alignment.center,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Image.asset("assets/otpverificationimg.jpg",
              width: 150,
              height: 150,
              ),
              SizedBox(
                height: 25,
              ),
              Text(
                "Phone Verification",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 22
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "We need to register your phone without getting started!",
                style: TextStyle(
                  fontSize: 16,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 30,
              ),
              Pinput(
                length: 6,
                showCursor: true,
                onCompleted:(value){
                       code = value;
                },
              ),
              SizedBox(
                height: 20,
              ),
              SizedBox(
                width: double.infinity,
                height: 45,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green.shade600,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10))),
                    onPressed: () async {
                      try
                      {
                        PhoneAuthCredential credential = PhoneAuthProvider.credential(verificationId:PhoneAuth.verify, smsCode:code);
                        await _auth.signInWithCredential(credential);
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content:Text("verified successfully")));
                        Navigator.pushReplacement(context,MaterialPageRoute(builder:(context)=>GoogleSignIn()));
                      }
                      catch(e)
                      {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content:Text("wrong OTP entered")));
                      }

                    },
                    child: Text("Verify Phone Number")),
              ),
              // Row(
              //   children: [
              //     TextButton(
              //         onPressed:(){
              //           Navigator.pushAndRemoveUntil(context,'OTPVerify', (route) => false);
              //         },
              //         child:Text("Edit Phone Number ?",style: TextStyle(color: Colors.black),))
              //   ],
              // )

            ],
          ),
        ),
        
      ),
    );
  }
 }
