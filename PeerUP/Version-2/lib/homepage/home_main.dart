import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'HOMEPAGE',
          style: TextStyle(
            color: Colors.black,
            fontFamily: 'Poppins',
            fontSize: 15,
            fontWeight: FontWeight.bold
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0.0,
        centerTitle: true,
        leading: Container(
          margin: const EdgeInsets.all(10),
          alignment: Alignment.center,
          decoration: const BoxDecoration(
            color: Colors.white,
          ),
          child: SvgPicture.asset(
            'assets/icons/left-arrow-svgrepo-com.svg',
            height: 20,
            width: 20,
          ),
        ),

        actions: [
          Container(
            margin: const EdgeInsets.all(10),
            alignment: Alignment.center,
            width: 37,
            decoration: const BoxDecoration(
              color: Colors.white,
            ),
            child: SvgPicture.asset(
              'assets/icons/settings-04-svgrepo-com.svg',
              height: 20,
              width: 20,
            ),
          ),
        ],
      ),
    );
  }
}
