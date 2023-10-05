import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:talentserve/screens/gaming.dart';
import 'package:talentserve/screens/home.dart';
import 'package:talentserve/screens/mycourses.dart';
import 'package:talentserve/screens/myprofile.dart';
import 'package:talentserve/screens/whishlist.dart';



class TabScreen extends StatefulWidget {
  const TabScreen({Key? key}) : super(key: key);

  @override
  _TabScreenState createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    HomeScreen(),
    MyCoursesScreen(),
    WishlistScreen(),
    CategoriesScreen(key: Key('gaming')),
    MyProfileScreen(),
  ];

  void _changeIndex(int selectedIndex) {
    setState(() {
      _currentIndex = selectedIndex;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 10,
              offset: const Offset(0, 0),
            ),
          ],
        ),
        child: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: _changeIndex,
          backgroundColor: Colors.white,
          elevation: 0,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Colors.red,
          unselectedItemColor: Colors.grey,
          selectedLabelStyle: const TextStyle(fontSize: 12),
          unselectedLabelStyle: const TextStyle(fontSize: 12),
          showUnselectedLabels: true,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.account_tree_outlined),
              label: "MyCourses",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite_border_outlined),
              label: "WhishLsit",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.games_outlined),
              label: "Gaming",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.account_circle_outlined),
              label: "MyProfile",
            ),
          ],
        ),
      ),
    );
  }
}
