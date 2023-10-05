import 'package:flutter/material.dart';

class MyCoursesScreen extends StatelessWidget {
  const MyCoursesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          leadingWidth: 0,
          title: Center(
            child: Text(
              "My Courses",
              style: TextStyle(
                color: Colors.indigo[900],
                fontFamily: 'Playfair Display',
                letterSpacing: 1,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          centerTitle: true,
          elevation: 0,
          backgroundColor: Colors.transparent,
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(64),
            child: Align(
              alignment: Alignment.center,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 48),
                child: TabBar(
                  indicatorColor: Colors.pink,
                  labelColor: Colors.pink,
                  unselectedLabelColor: Colors.grey,
                  labelStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  tabs: [
                    Tab(text: "In Progress"),
                    Tab(text: "Completed"),
                  ],
                ),
              ),
            ),
          ),
        ),
        body: TabBarView(
          children: [
            _buildCourseListView(inProgressCourses),
            _buildCourseListView(completedCourses, isCompleted: true),
          ],
        ),
      ),
    );
  }

  Widget _buildCourseListView(List<Course> courses, {bool isCompleted = false}) {
    return ListView.builder(
      itemCount: courses.length,
      itemBuilder: (context, index) {
        return CourseCard(course: courses[index], isCompleted: isCompleted);
      },
    );
  }
}

class Course {
  final String name;
  final double progressPercentage;
  final bool isCompleted;
  final String imageAsset;

  Course({
    required this.name,
    required this.progressPercentage,
    this.isCompleted = false,
    required this.imageAsset,
  });
}

class CourseCard extends StatelessWidget {
  final Course course;
  final bool isCompleted;

  CourseCard({required this.course, this.isCompleted = false});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Card(
        elevation: 12,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        child: Stack(
          children: [
            Container(
              height: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(24),
                border: Border.all(color: Colors.indigo, width: 2), // Added indigo border
                image: DecorationImage(
                  image: AssetImage(course.imageAsset),
                  fit: BoxFit.cover, // Fit image inside the border
                  colorFilter: ColorFilter.mode(
                    Colors.black.withOpacity(0.4),
                    BlendMode.darken,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
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
                            text: course.name,
                            style: TextStyle(
                              color: Colors.redAccent,
                              fontFamily: 'YourPreferredFont', // Add your preferred font
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Container(
                    height: 8,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Colors.indigo, Colors.redAccent],
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: FractionallySizedBox(
                      alignment: Alignment.centerLeft,
                      widthFactor: course.progressPercentage,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 2),
                  Row(
                    children: [
                      Text(
                        '${(course.progressPercentage * 100).toInt()}%',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          shadows: [
                            Shadow(color: Colors.black, offset: Offset(2, 2), blurRadius: 4),
                          ],
                        ),
                      ),
                      Spacer(),
                      if (isCompleted) Icon(Icons.star, color: Colors.yellow, size: 30),
                    ],
                  ),
                  SizedBox(height: 18),
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
                        'Continue Learning',
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

final List<Course> inProgressCourses = [
  Course(name: 'Web Development', progressPercentage: 0.6, imageAsset: 'assets/images/webdevelopment.jpg'),
  Course(name: 'Data Science', progressPercentage: 0.8, imageAsset: 'assets/images/datascience2.jpeg'),
  Course(name: 'Entrepreneurship', progressPercentage: 0.5, imageAsset: 'assets/images/Entrepreneurship.jpg'),
  Course(name: 'Health and Wellness', progressPercentage: 0.5, imageAsset: 'assets/images/womenshealth.jpg'),
  Course(name: 'Mathematical Logic', progressPercentage: 0.5, imageAsset: 'assets/images/Mathematical.png'),
  Course(name: 'Entrepreneurship', progressPercentage: 0.5, imageAsset: 'assets/images/Entrepreneurship.jpg'),

  // Add more in-progress courses here
];

final List<Course> completedCourses = [
  Course(name: 'Visual Photography', progressPercentage: 1.0, isCompleted: true, imageAsset: 'assets/images/Photography.jpg'),
  Course(name: 'Mythology & Folklore', progressPercentage: 1.0, isCompleted: true, imageAsset: 'assets/images/Mythology.jpg'),

];
