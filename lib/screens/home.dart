import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class HomeScreen extends StatelessWidget {
  final List<String> images = [
    'assets/images/1.png',
    'assets/images/2.png',
    // Add more image paths
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        leadingWidth: 50,
        leading: Center(
          child: Container(
            margin: EdgeInsets.only(left: 15),
            child: Image.asset('assets/images/logo.png'),
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.message),
            color: Colors.indigo[900],
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.view_list),
            color: Colors.indigo[900],
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.notifications),
            color: Colors.indigo[900],
            onPressed: () {},
          ),
        ],
        title: Container(
          child: Text(
            "Talent Serve",
            style: TextStyle(
              color: Colors.indigo[900],
              fontFamily: 'Anton',
              fontSize: 22,
              fontWeight: FontWeight.bold,
              letterSpacing: 1,
              shadows: [
                Shadow(
                  offset: Offset(1, 1),
                  blurRadius: 2,
                  color: Colors.black.withOpacity(0.5),
                ),
              ],
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Center(
              child: Text(
                "TODAY'S LIVE SESSIONS",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.indigo[900],
                ),
              ),
            ),
            SizedBox(height: 16),
            CarouselSlider(
              options: CarouselOptions(
                height: 200.0,
                enlargeCenterPage: true,
                autoPlay: true,
                aspectRatio: 20 / 15,
                autoPlayCurve: Curves.fastOutSlowIn,
                enableInfiniteScroll: true,
                autoPlayAnimationDuration: Duration(milliseconds: 800),
                viewportFraction: 0.8,
              ),
              items: images.map((item) => _buildCarouselItem(item)).toList(),
            ),
            SizedBox(height: 25),
            Center(
              child: Text(
                "TOPICS",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.indigo[900],
                ),
              ),
            ),
            SizedBox(height: 26),
            Expanded(
              child: AttractiveGridView(items: [
                AttractiveGridItem(
                  image: "assets/images/9.jpg",
                  title: "Computer Science",
                  onTap: () {},
                ),
                AttractiveGridItem(
                  image: "assets/images/10.PNG",
                  title: 'Data Science',
                  onTap: () {},
                ),
                AttractiveGridItem(
                  image: "assets/images/11.jpg",
                  title: "Business",
                  onTap: () {},
                ),
                AttractiveGridItem(
                  image: "assets/images/12.jpg",
                  title: "Health",
                  onTap: () {},
                ),
                AttractiveGridItem(
                  image: "assets/images/13.jpg",
                  title: "Arts & Humanities",
                  onTap: () {},
                ),
                AttractiveGridItem(
                  image: "assets/images/14.jpg",
                  title: "Math and Logic",
                  onTap: () {},
                ),
              ]),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCarouselItem(String item) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 6,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Image.asset(
          item,
          fit: BoxFit.cover,
          height: 200.0,
        ),
      ),
    );
  }
}

class AttractiveGridItem extends StatelessWidget {
  final String image;
  final String title;
  final VoidCallback onTap;

  const AttractiveGridItem({
    required this.image,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              spreadRadius: 2,
              blurRadius: 6,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Stack(
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                image,
                fit: BoxFit.cover,
                height: double.infinity,
                width: double.infinity,
              ),
            ),
            Positioned.fill(
              bottom: 0,
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Colors.transparent, Colors.black87],
                  ),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(12),
                    bottomRight: Radius.circular(12),
                  ),
                ),
                padding: EdgeInsets.symmetric(vertical: 20, horizontal: 26),
                child: Center(
                  child: Text(
                    title,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'Georgia',
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      letterSpacing: 1.2,
                      shadows: [
                        Shadow(
                          offset: Offset(1, 1),
                          blurRadius: 2,
                          color: Colors.grey.withOpacity(0.7),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AttractiveGridView extends StatelessWidget {
  final List<AttractiveGridItem> items;

  const AttractiveGridView({required this.items});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: items.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 25,
        mainAxisSpacing: 25,
      ),
      itemBuilder: (context, index) => items[index],
    );
  }
}
