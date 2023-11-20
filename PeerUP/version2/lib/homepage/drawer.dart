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

          //account

          //faq

          //logout
        ],
      ),
    );
  }
}
