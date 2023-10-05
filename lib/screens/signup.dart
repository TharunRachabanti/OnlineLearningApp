import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:talentserve/screens/login.dart';

class SignupScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.teal),
        title: Text("Create an Account",style: TextStyle(color: Colors.teal),),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(29),
          child: Column(
            mainAxisAlignment:MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset("assets/images/logo.png",
                height: 120,
                width: 120,
              ),
              SizedBox(height: 20),
              Text("Fit-Genie",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),

              ),
              SizedBox(height: 40),
              TextField(
                decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.grey[200],
                    border: InputBorder.none,
                    labelText: "Fullname"
                ),
              ),
              TextField(
                decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.grey[200],
                    border: InputBorder.none,
                    labelText: "Email Address"
                ),
              ),
              TextField(
                decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.grey[200],
                    border: InputBorder.none,
                    labelText: "Password"
                ),
              ),
              SizedBox(height: 12),
              Container(height:40,width:double.infinity,child: ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.teal),
                child: Text("Register"),onPressed: () {
                Get.to(LoginScreen());
              },),),
              SizedBox(height: 12),
              Container(child: TextButton(child: Text("Already Have an account",
                style: TextStyle(color: Colors.teal),
              ), onPressed: () {
                Get.to(LoginScreen());
              },),),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(primary: Colors.transparent,elevation: 0),
                      onPressed: () {},
                      child: Image.asset("assets/images/facebooklogo.png",
                        height: 32,
                      ),
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(primary: Colors.transparent,elevation: 0),
                      onPressed: () {},
                      child: Image.asset("assets/images/googlelogo.png",
                        height: 32,
                      ),
                    ),
                  ],),),
            ],
          ),),
      ),
    );
  }
}
