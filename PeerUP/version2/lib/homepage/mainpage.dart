import 'package:flutter/material.dart';
import 'package:peerup/homepage/history.dart';
import 'package:peerup/homepage/homepage.dart';
import 'package:peerup/homepage/peer.dart';
//import 'package:peerup/homepage/settings.dart';
import 'package:peerup/homepage/technique.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  List pages = [
    const Homepage(
      title: '',
    ),
    const Techniques(),
    const History(),
    const Peer(),
    //Settings()
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
        backgroundColor: const Color.fromRGBO(249, 247, 243, 1),
        onTap: onTap,
        currentIndex: currentIndex,
        selectedItemColor: const Color.fromRGBO(15, 163, 177, 1),
        unselectedItemColor: Colors.blueGrey.withOpacity(0.5),
        showSelectedLabels: false,
        showUnselectedLabels: false,
        elevation: 0,
        items: const [
          BottomNavigationBarItem(label: 'Home', icon: Icon(Icons.home)),
          BottomNavigationBarItem(label: 'Technique', icon: Icon(Icons.book)),
          BottomNavigationBarItem(
              label: 'History', icon: Icon(Icons.calendar_month)),
          BottomNavigationBarItem(label: 'My Peers', icon: Icon(Icons.groups)),
          //BottomNavigationBarItem(
          //label: 'Settings', icon: Icon(Icons.menu_outlined)),
        ],
      ),
    );
  }
}
