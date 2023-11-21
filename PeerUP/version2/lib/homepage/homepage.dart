import 'package:flutter/material.dart';
import 'dart:math';
import 'package:peerup/homepage/drawer.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key, required String title}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  List<String> subjects = [
    'CMSC 128',
    'CMSC 129',
    'CMSC 134',
    'CMSC 137',
    'CMSC 11',
    'CMSC 10',
  ];

  List<String> filteredSubjects = [];
  Map<String, Color> subjectColors = {};
  String selectedBackground = 'default'; // For default background

  @override
  void initState() {
    super.initState();
    _generateSubjectColors();
  }

  void _generateSubjectColors() {
    // Generate colors for each subject and store them in the map
    final random = Random();
    for (String subject in subjects) {
      final color = Color.fromRGBO(
        random.nextInt(156),
        random.nextInt(156),
        random.nextInt(256),
        1.0,
      );
      subjectColors[subject] = color;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(249, 247, 243, 1),
      drawer: MyDrawer(),
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(249, 247, 243, 1),
        elevation: 0,
        leading: Builder(
          builder: (context) {
            return IconButton(
              onPressed: () => Scaffold.of(context).openDrawer(),
              icon: Icon(
                Icons.person,
                color: Colors.black,
              ),
            );
          },
        ),
        title: Text(
          'Welcome, Peer!',
          style: TextStyle(
            fontFamily: 'Poppins',
            color: Colors.black,
            fontSize: 32,
            fontWeight: FontWeight.w500,
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.insert_photo),
            color: Colors.black,
            onPressed: () => _showBackgroundMenu(context),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: _getImage(selectedBackground),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            children: [
              // Quote
              Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Color(0xFF6493A5),
                  borderRadius: BorderRadius.circular(20),
                ),
                margin: const EdgeInsets.symmetric(horizontal: 25),
                padding: const EdgeInsets.all(25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        Text('QUOTE OF THE DAY'),
                        Text(
                          '❝ It is during our darkest moments \nthat we must focus to see the light ❞',
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 16,
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              // Search Bar
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextField(
                  onChanged: (query) {
                    setState(() {
                      filteredSubjects = subjects
                          .where((subject) => subject
                              .toLowerCase()
                              .contains(query.toLowerCase()))
                          .toList();
                    });
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Search',
                    prefixIcon: Icon(Icons.search),
                  ),
                ),
              ),

              // Subject Grid View
              GridView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                padding: const EdgeInsets.all(30.0),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 8,
                ),
                itemCount: filteredSubjects.isEmpty
                    ? subjects.length
                    : filteredSubjects.length,
                itemBuilder: (BuildContext context, int index) {
                  final subject = filteredSubjects.isEmpty
                      ? subjects[index]
                      : filteredSubjects[index];

                  // Retrieve color from the map
                  final color = subjectColors[subject] ?? Colors.blue;

                  return SubjectCard(subject: subject, color: color);
                },
              ),
            ],
          ),
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
      position: RelativeRect.fromLTRB(10, 50, 0, 0),
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

class SubjectCard extends StatelessWidget {
  final String subject;
  final Color color;

  const SubjectCard({required this.subject, required this.color});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: color,
      child: Center(
        child: Text(
          subject,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
