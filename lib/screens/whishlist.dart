import 'package:flutter/material.dart';

class WishlistScreen extends StatelessWidget {
  const WishlistScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leadingWidth: 0,
        title: Center(
          child: Text(
            "Wishlist",
            style: TextStyle(
              color: Colors.indigo[900],
              fontFamily: 'Playfair Display',
              fontSize: 20,
              letterSpacing: 1,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Padding(
        padding: EdgeInsets.all(5.0),
        child: _buildWishlistListView(wishlistItems),
      ),
    );
  }

  Widget _buildWishlistListView(List<WishlistItem> items) {
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        return WishlistCard(item: items[index]);
      },
    );
  }
}

class WishlistCard extends StatelessWidget {
  final WishlistItem item;

  WishlistCard({required this.item});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: Colors.indigo, width: 2), // Added indigo border
        ),
        child: Card(
          elevation: 12,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          child: Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.asset(
                  item.imagePath,
                  fit: BoxFit.cover,
                  height: 200,
                  width: double.infinity,
                ),
              ),
              Container(
                height: 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.black.withOpacity(0.4),
                      Colors.black.withOpacity(0.4),
                    ],
                  ),
                ),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Center(
                        child: RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                            style: TextStyle(
                              fontSize: 26,
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
                                text: item.courseName,
                                style: TextStyle(
                                  color: Colors.redAccent,
                                  fontFamily: 'YourPreferredFont',
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        item.isGoodCourse ? 'An Outstanding Course!' : 'A High-Quality Course',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                          fontStyle: item.isGoodCourse ? FontStyle.italic : FontStyle.normal,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 20),
                      Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [Colors.indigo, Colors.redAccent],
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                          ),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: ElevatedButton(
                          onPressed: () {
                            // Add your button action here
                          },
                          style: ElevatedButton.styleFrom(
                            primary: Colors.transparent,
                            elevation: 0,
                            padding: EdgeInsets.symmetric(vertical: 18),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                          ),
                          child: Text(
                            'Start Learning',
                            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                top: 20,
                left: 0,
                right: 0,
                child: buildStarRatingRow(item.isGoodCourse),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildStarRatingRow(bool isGoodCourse) {
    int starCount = isGoodCourse ? 5 : 3;
    return Container(
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(
          starCount,
              (index) => Icon(
            Icons.star,
            color: isGoodCourse ? Colors.yellow : Colors.white,
            size: 25,
          ),
        ),
      ),
    );
  }
}

class WishlistItem {
  final String courseName;
  final bool isGoodCourse;
  final String imagePath;

  WishlistItem({
    required this.courseName,
    this.isGoodCourse = true,
    required this.imagePath,
  });
}

final List<WishlistItem> wishlistItems = [

  WishlistItem(
    courseName: 'Philosophy',
    isGoodCourse: true,
    imagePath: 'assets/images/philosophy.jpg',
  ),
  WishlistItem(
    courseName: 'Problem Solving',
    isGoodCourse: false,
    imagePath: 'assets/images/problemsolving.jpeg',
  ),
  WishlistItem(
    courseName: 'Fitness',
    isGoodCourse: true,
    imagePath: 'assets/images/fitness.jpg',
  ),
  WishlistItem(
    courseName: 'Accounting',
    isGoodCourse: true,
    imagePath: 'assets/images/accounting.jpg',
  ),
  WishlistItem(
    courseName: 'Data Science',
    isGoodCourse: false,
    imagePath: 'assets/images/datascience2.jpg',
  ),
  WishlistItem(
    courseName: 'Machine Learning',
    isGoodCourse: true,
    imagePath: 'assets/images/machinelearning.PNG',
  ),
  WishlistItem(
    courseName: 'Big Data Analytics',
    isGoodCourse: true,
    imagePath: 'assets/images/dataanalytics.jpg',
  ),
  WishlistItem(
    courseName: 'Java',
    isGoodCourse: false,
    imagePath: 'assets/images/java.jpg',
  ),
  // Add more wishlist items here
];
