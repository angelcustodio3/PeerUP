import 'package:flutter/material.dart';
//import 'package:peerup_draft1/flashcard/flashcard_pages.dart';
import 'package:peerup_draft1/homepage/history.dart';
//import 'package:peerup_draft1/homepage/history.dart';
import 'package:peerup_draft1/homepage/homepage.dart';
import 'package:peerup_draft1/homepage/peer.dart';
import 'package:peerup_draft1/homepage/settings.dart';
import 'package:peerup_draft1/homepage/technique.dart';
//import 'package:peerup_draft1/homepage/technique.dart';
//import 'package:peerup_draft1/pomodoro/pomodoro_page1.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  List pages = [homepage(), Techniques(), history(), peer(), settings()];

  int currentIndex = 0;
  void onTap(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(238, 247, 255, 1),
      body: pages[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: const Color.fromRGBO(238, 247, 255, 1),
        onTap: onTap,
        currentIndex: currentIndex,
        selectedItemColor: Colors.teal,
        unselectedItemColor: Colors.blueGrey.withOpacity(0.5),
        showSelectedLabels: false,
        showUnselectedLabels: false,
        elevation: 0,
        items: [
          BottomNavigationBarItem(label: 'Home', icon: Icon(Icons.home)),
          BottomNavigationBarItem(label: 'Pomodoro', icon: Icon(Icons.book)),
          BottomNavigationBarItem(
              label: 'History', icon: Icon(Icons.calendar_month)),
          BottomNavigationBarItem(label: 'My Peers', icon: Icon(Icons.groups)),
          BottomNavigationBarItem(
              label: 'Settings', icon: Icon(Icons.menu_outlined)),
        ],
      ),
    );
  }
}