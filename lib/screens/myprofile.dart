import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:talentserve/screens/login.dart';

class MyProfileScreen extends StatelessWidget {
   MyProfileScreen({Key? key}) : super(key: key);

  FirebaseAuth _auth =FirebaseAuth.instance;

  Logout(){
    _auth.signOut().then((res){
      Get.offAll(LoginScreen());

    }).catchError((e){
      print(e);
    });


  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leadingWidth: 0,
        title: Center(
          child: Text(
            "Profile",
            style: TextStyle(
              color: Colors.indigo,
              fontFamily: 'Playfair Display',
              fontSize: 24,
              letterSpacing: 1,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.30,
              margin: EdgeInsets.symmetric(horizontal: 22.0, vertical: 10.0),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.indigo.shade700, Colors.blueGrey],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
                borderRadius: BorderRadius.circular(16.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.3),
                    offset: Offset(0, 4),
                    blurRadius: 12.0,
                  ),
                ],
                border: Border.all(
                  color: Colors.black,
                  width: 2.0,
                ),
              ),
              padding: EdgeInsets.all(15.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    flex: 3,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Center(
                          child: Column(
                            children: [
                              RichText(
                                textAlign: TextAlign.center,
                                text: TextSpan(
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: 1.5,
                                    shadows: [
                                      Shadow(
                                        color: Colors.indigoAccent,
                                        offset: Offset(2, 2),
                                        blurRadius: 6,
                                      ),
                                    ],
                                  ),
                                  children: [
                                    TextSpan(
                                      text: "Tharun Rachabanti\n",
                                      style: TextStyle(
                                        color: Colors.redAccent,
                                        fontSize: 20,
                                        fontFamily: 'YourPreferredFont',
                                      ),
                                    ),
                                    TextSpan(
                                      text: "\n",
                                    ),
                                    TextSpan(
                                      text: "\n",
                                    ),
                                    TextSpan(
                                      text: "tharunrachabanti@gmail\n",
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: Colors.redAccent,
                                        fontFamily: 'Arial',
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: 15),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 15),
                  Expanded(
                    flex: 2,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8.0),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black12,
                            offset: Offset(0, 2),
                            blurRadius: 4.0,
                          ),
                        ],
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.star, color: Colors.orange),
                              Icon(Icons.star, color: Colors.orange),
                              Icon(Icons.star, color: Colors.orange),
                            ],
                          ),
                          SizedBox(height: 12),
                          Container(
                            width: 100,
                            height: 160,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage('assets/images/avatar.png'),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 25.0),
              child: Column(
                children: [
                  _buildListViewItem("Badges", Icons.star, () {
                    // Handle item click here
                    // This will be called when the "Badges" item is tapped
                  }),
                  _buildListViewItem("Certificates", Icons.school, () {
                    // Handle item click here
                    // This will be called when the "Certificates" item is tapped
                  }),
                  _buildListViewItem("Leaderboard", Icons.leaderboard, () {
                    // Handle item click here
                    // This will be called when the "Leaderboard" item is tapped
                  }),
                  _buildListViewItem("Help", Icons.help, () {
                    // Handle item click here
                    // This will be called when the "Help" item is tapped
                  }),
                  _buildListViewItem("Logout", Icons.logout, () {
                    Logout();
                    // Handle item click here
                    // This will be called when the "Logout" item is tapped
                  }),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildListViewItem(String title, IconData icon, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 10.0),
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.indigo,
            width: 2.0,
          ),
          borderRadius: BorderRadius.circular(8.0),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              offset: Offset(0, 2),
              blurRadius: 4.0,
            ),
          ],
        ),
        child: ListTile(
          leading: Icon(
            icon,
            color: Colors.redAccent,
          ),
          title: Text(
            title,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          trailing: Icon(Icons.arrow_forward_ios),
        ),
      ),
    );
  }
}
