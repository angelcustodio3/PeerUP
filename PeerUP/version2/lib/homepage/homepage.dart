import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
//import 'dart:math';
//import 'package:peerup/homepage/drawer.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});
  @override
  State<Homepage> createState() => _HomepageState();
}

class CustomFloatingActionButtonLocation extends FloatingActionButtonLocation {
  @override
  Offset getOffset(ScaffoldPrelayoutGeometry scaffoldGeometry) {
    // Adjust the X and Y coordinates to customize the position
    return Offset(335.0, 25.0);
  }

  @override
  String toString() => 'CustomFloatingActionButtonLocation';
}

class _HomepageState extends State<Homepage> {
  String selectedBackground = 'default'; // For default background
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0x10FAEBD2),
      // appBar: AppBar(
      //   //backgroundColor: Colors.transparent,
      //   elevation: 0,
      //   toolbarHeight: 70.0,
      //   actions: [
      //     IconButton(
      //       padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      //       icon: SvgPicture.asset('assets/icons/photo.svg', height: 30.0, width: 30.0,),
      //       color: Color(0xFF3D405B),
      //       onPressed: () => _showBackgroundMenu(context),
      //     ),
      //   ],
      // ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        onPressed: () => _showBackgroundMenu(context),
        child: SvgPicture.asset(
          'assets/icons/photo.svg',
          height: 30.0,
          width: 30.0,
          color: Color(0xFFFDFCF8)
        ),
      ),
      floatingActionButtonLocation: CustomFloatingActionButtonLocation(),

      // Body of Homepage
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF0FA3B1), // Top color with 50% transparency
              Color(0x800FA3B1), // Middle color fully opaque
              Color(0x30F2CC8F), // Bottom color fully opaque
            ],
          ),
          image: DecorationImage(
            image: _getImage(selectedBackground),
            fit: BoxFit.fill,
          ),
        ),
        child: Column(
          children: [
            Container(
              //width: double.infinity,
              alignment: Alignment.topLeft,
              //  decoration: BoxDecoration(
              //   color: Color(0xFF6493A5),
              // ),
              //margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
              padding: const EdgeInsets.only(left: 30, top: 95),
              child: Text('Hello, peer!',
                  //textAlign: TextAlign.left,
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    color: Color(0xFFFDFCF8),
                    fontSize: 30,
                    fontWeight: FontWeight.w600,
                  )),
            ),

            Container(
              alignment: Alignment.topLeft,
              // decoration: BoxDecoration(
              //   color: Color(0xFF6493A5),
              // ),
              //margin: const EdgeInsets.symmetric(horizontal: 0, vertical: 15),
              padding: const EdgeInsets.only(left: 30),
              child: Text(
                'How are you doing today?',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  color: Color(0xFFFDFCF8),
                  fontSize: 15,
                  fontWeight: FontWeight.w200,
                ),
              ),
            ),

            // Quote of the Day Section
            Container(
              // width: 250,
              height: 200,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Color(0x500FA3B1),
                borderRadius: BorderRadius.circular(15),
              ),
              margin: const EdgeInsets.symmetric(horizontal: 35, vertical: 30),
              padding: const EdgeInsets.all(15),
              child: Text(
                '❝ It is during our darkest moments \nthat we must focus to see the light ❞\n\n\t\t-Anonymous',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 16,
                  fontStyle: FontStyle.italic,
                ),
              ),
            ),

            // // SEARCH BAR SECTION ------------------------------------------------------------
            // Padding(
            //   padding: const EdgeInsets.all(16.0),
            //   child: TextField(
            //     onChanged: (query) {
            //       setState(() {
            //         filteredSubjects = subjects
            //             .where((subject) => subject
            //                 .toLowerCase()
            //                 .contains(query.toLowerCase()))
            //             .toList();
            //       });
            //     },
            //     decoration: InputDecoration(
            //       border: OutlineInputBorder(),
            //       hintText: 'Search',
            //       prefixIcon: Icon(Icons.search),
            //     ),
            //   ),
            // ),

            // Subject Grid View
            // GridView.builder(
            //   shrinkWrap: true,
            //   physics: NeverScrollableScrollPhysics(),
            //   padding: const EdgeInsets.all(30.0),
            //   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            //     crossAxisCount: 2,
            //     crossAxisSpacing: 8,
            //     mainAxisSpacing: 8,
            //   ),
            //   itemCount: filteredSubjects.isEmpty
            //       ? subjects.length
            //       : filteredSubjects.length,
            //   itemBuilder: (BuildContext context, int index) {
            //     final subject = filteredSubjects.isEmpty
            //         ? subjects[index]
            //         : filteredSubjects[index];

            //     // Retrieve color from the map
            //     final color = subjectColors[subject] ?? Colors.blue;

            //     return SubjectCard(subject: subject, color: color);
            //   },
            // ),
          ],
        ),
      ),
    );
  }

  AssetImage _getImage(String imageName) {
    switch (imageName) {
      case 'Sunset':
        return AssetImage('assets/graphics/sunset.jpg');
      case 'Road':
        return AssetImage('assets/graphics/road.jpg');
      case 'Lofi':
        return AssetImage('assets/graphics/lofi.jpeg');
      case 'Town':
        return AssetImage('assets/graphics/town.jpg');
      default:
        return AssetImage('assets/graphics/white.jpeg');
    }
  }

  void _showBackgroundMenu(BuildContext context) {
    showMenu(
      context: context,
      position: RelativeRect.fromLTRB(25, 75, 0, 0),
      items: [
        PopupMenuItem<String>(
          value: 'Sunset',
          child: Text('Sunset'),
        ),
        PopupMenuItem<String>(
          value: 'Road',
          child: Text('Road'),
        ),
        PopupMenuItem<String>(
          value: 'Lofi',
          child: Text('Lofi'),
        ),
        PopupMenuItem<String>(
          value: 'Town',
          child: Text('Town'),
        ),
        PopupMenuItem<String>(
          value: 'Default',
          child: Text('Default'),
        ),
      ],
    ).then((value) {
      if (value != null) {
        setState(() {
          selectedBackground = value;
        });
      }
    });
  }
}

// SUBJECT CARD CLASS
// class SubjectCard extends StatelessWidget {
//   final String subject;
//   final Color color;

//   const SubjectCard({required this.subject, required this.color});

//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       color: color,
//       child: Center(
//         child: Text(
//           subject,
//           style: TextStyle(
//             fontSize: 20,
//             fontWeight: FontWeight.bold,
//             color: Colors.white,
//           ),
//         ),
//       ),
//     );
//   }
// }

