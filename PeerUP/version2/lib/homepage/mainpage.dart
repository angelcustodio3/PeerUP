import 'package:flutter/material.dart';
import 'package:peerup/progress/progress_page.dart';
import 'package:peerup/homepage/homepage.dart';
import 'package:peerup/homepage/peer.dart';
import 'package:peerup/homepage/technique.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {

  List<Widget> pages = [
    Homepage(),
    Techniques(),
    ProgressPage(),
    Peer(),
  ];

  int currentIndex = 0;
  void onTap(int index) {
    setState(() {
      currentIndex = index;
    });
  }

// main page
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor:Color(0xFFFDFCF8),
        onTap: onTap,
        currentIndex: currentIndex,
        selectedItemColor:Color(0xFF0FA3B1),
        unselectedItemColor: Color(0xFFB1B3BD),
        showSelectedLabels: false,
        showUnselectedLabels: false,
        elevation: 0,
        items: const [
          BottomNavigationBarItem(label: 'Home', icon: Icon(Icons.home_rounded)),
          BottomNavigationBarItem(label: 'Technique', icon: Icon(Icons.book_rounded)),
          BottomNavigationBarItem(label: 'Tasks', icon: Icon(Icons.checklist_rounded)),
          BottomNavigationBarItem(label: 'Profile', icon: Icon(Icons.person_rounded)),
        ],
      ),
    );
  }
}
