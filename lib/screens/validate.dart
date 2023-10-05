import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:talentserve/screens/tabs.dart';
import 'package:talentserve/screens/welcome.dart';

class ValidateScreen extends StatefulWidget {
  const ValidateScreen({Key? key}) : super(key: key);

  @override
  State<ValidateScreen> createState() => _ValidateScreenState();
}

class _ValidateScreenState extends State<ValidateScreen> {
  @override

  FirebaseAuth _auth = FirebaseAuth.instance;
  bool isUserLogin = false;

  Validate(){
    _auth.authStateChanges().listen((user) {
      if(user!= null){
        setState(() {
          isUserLogin = true;
        });
      }
      else
      {
        setState(() {
          isUserLogin = false;
        });
      }
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    Validate();
  }

  @override
  Widget build(BuildContext context) {
    return isUserLogin? TabScreen() : WelcomeScreen();
  }
}
