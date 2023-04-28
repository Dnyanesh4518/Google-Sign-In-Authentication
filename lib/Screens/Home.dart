import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sign_in_with_google/Screens/GoogleSignIn.dart';
import 'package:sign_in_with_google/Screens/login.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import '../Authentication/AuthServices.dart';
class Home extends StatefulWidget {

   Home({Key? key,required User user}) : _user = user, super(key: key);
  final User _user;

  @override
  State<Home> createState() => _HomeState();
}
class _HomeState extends State<Home> {
  final authServices _auth = authServices();
  late User _user;
  @override
  void initState() {
    _user = widget._user;
    super.initState();
  }
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
      ),
      drawer: ListView(
        children: [
          AppBar(
            actions: [
              IconButton(onPressed:(){
                _auth.signOut();
                Navigator.pushReplacement(context,MaterialPageRoute(builder: (context)=>GoogleSignIn()));
                },
                icon:const Icon(Icons.exit_to_app),
              )
            ],
          ),
          DrawerHeader(
            decoration: const BoxDecoration(
              color: Colors.white,
            ),
              child:Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipOval(
                child: Material(
                  child: Image.network(
                    _user.photoURL!,
                    fit: BoxFit.fitHeight,
                  ),
                ),
              ),
              Text(_user.displayName!,style: TextStyle(fontSize: 18),),
              Text(_user.email!,style: TextStyle(fontSize: 12),),
            ],
          )),
          Container(
            color: Colors.white,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ListTile(
                  title:Text("Home"),
                  onTap: () => Login(),
                )
              ],
            ),
          )
        ],
      ),
      body: Container(
        child: Column(
          children: [
            // Center(child: Text(_user.email!),)
          ],
        ),
      ),
    );

  }

}
