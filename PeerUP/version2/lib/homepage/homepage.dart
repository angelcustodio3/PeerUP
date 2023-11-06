import 'package:flutter/material.dart';
import 'package:peerup/homepage/drawer.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key, required String title});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    //final user = ref.watch(userProvider)
    return Scaffold(
      backgroundColor: Color.fromRGBO(249, 247, 243, 1),
      drawer: MyDrawer(),
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(249, 247, 243, 1),
        elevation: 0,
        leading: Builder(builder: (context) {
          return IconButton(
              onPressed: () => Scaffold.of(context).openDrawer(),
              icon: Icon(
                Icons.person,
                color: Colors.black,
              ));
        }),
        title: Text(
          'Welcome, Peer!',
          style: TextStyle(
            fontFamily: 'Poppins',
            color: Colors.black,
            fontSize: 32,
            fontWeight: FontWeight.w500,
          ),
        ),
        // actions: [
        //   IconButton(
        //     onPressed: () {
        //       Scaffold.of(context).openDrawer();
        //     },
        //      icon: Icon(Icons.person),
        //     padding: EdgeInsets.all(2),
        //      color: Colors.black,
      ),
      //CircleAvatar(backgroundImage: NetworkImage())
      //  ],
    );
  }
}
