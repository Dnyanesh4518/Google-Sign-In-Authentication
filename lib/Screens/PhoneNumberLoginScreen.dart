import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sign_in_with_google/Screens/verify.dart';
class PhoneAuth extends StatefulWidget {
  const PhoneAuth({Key? key}) : super(key: key);
  static String verify = "";
  static String authStatus ="";
  @override
  State<PhoneAuth> createState() => _PhoneAuthState();
}
class _PhoneAuthState extends State<PhoneAuth> {
  final _auth = FirebaseAuth.instance;
  var phone = "";
  TextEditingController countryController = TextEditingController();

  @override
  void initState() {
    countryController.text ="+91";
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            Center(
            child: Column(
              children: [
                const SizedBox(
                  height: 60,
                ),
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 60,bottom: 20),
                      child: Card(
                         elevation: 0,
                        child: Center(child: Image(image: AssetImage("assets/phoneverifyimg.png"),fit: BoxFit.cover,),),),
                    ),
                     Row(
                       mainAxisAlignment: MainAxisAlignment.center,
                       children: const [
                       Text("Verify Your Number",style: TextStyle(fontSize: 23,fontWeight: FontWeight.bold,color:Colors.purple),)
                     ],),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Text("Please Enter Your Phone Number to verify",style:TextStyle(color:Colors.grey),)
                        ],),
                    )
                  ],
                ),
                const SizedBox(height: 40,),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius:BorderRadius.circular(10),
                      border: Border.all(color: Colors.black)
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 45,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 13),
                            child: TextFormField(
                              controller: countryController,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                        ),
                        Text(
                          "|",
                          style: TextStyle(fontSize: 33, color: Colors.grey),
                        ),
                        Expanded(
                          child: TextFormField(
                            cursorColor: Colors.purple,
                            keyboardType: TextInputType.phone,
                            autofocus: false,
                            validator: (value){
                              if(value==null || value.trim().isEmpty)
                              {
                                return 'This Field is required';
                              }
                              if(value.trim().length<10 || value.trim().length>10)
                              {
                                return 'Enter valid Phone number';
                              }
                            },
                            onChanged: (value){
                            phone = value;
                            },
                            decoration: InputDecoration(
                                contentPadding: const EdgeInsets.fromLTRB(15.0,15.0,20.0,15.0),
                              hintText:"Phone Number",
                              fillColor: Colors.black,
                                border: InputBorder.none
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 100,vertical: 10),
                  child: ElevatedButton(
                    onPressed: () {
                      _auth.verifyPhoneNumber(
                          phoneNumber: '${countryController.text+phone}',
                          verificationCompleted:
                              (PhoneAuthCredential credential){},
                          verificationFailed:(FirebaseAuthException e){},
                          codeSent:(String verificationId , int? resendToken){
                            PhoneAuth.verify=verificationId;
                            setState(() {
                              PhoneAuth.authStatus="OTP has been sent successfully";
                            });
                            },
                          codeAutoRetrievalTimeout:(String verificationId){}
                      );
                      Navigator.pushReplacement(context,MaterialPageRoute(builder:(context)=>OTPVerify()));
                    },
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                        backgroundColor: Colors.purple
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: const Text("Send OTP",style: TextStyle(fontSize: 19),),
                    ),
                  ),
                )
              ],
            ),
          ),
    ]
        ),
      ),
    );
  }
}
