import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:talentserve/screens/validate.dart';
import 'package:talentserve/screens/welcome.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(
        primaryColor: Colors.red,
        primarySwatch: Colors.red,
        scaffoldBackgroundColor: Colors.white,
      ),
      home:ValidateScreen(),
    );
  }
}
