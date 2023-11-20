import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return const Drawer(
      backgroundColor: Color.fromRGBO(15, 163, 177, 1),
      child: Column(
        children: [
          //header
          DrawerHeader(
            child: Icon(
              Icons.person,
              color: Colors.white,
              size: 60,
            ),
          ),
          //account
          ListTile(
            leading: Icon(
              Icons.person_2,
              color: Colors.white,
            ),
            title: Text(
              'P R O F I L E',
              style: TextStyle(fontFamily: 'Poppins', color: Colors.white),
            ),
          )

          //faq

          //logout
        ],
      ),
    );
  }
}
