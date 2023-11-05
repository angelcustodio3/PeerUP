import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class PomodoroSettings extends StatelessWidget {
  const PomodoroSettings({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'POMODORO Settings',
          style: TextStyle(
            color: Color(0xFF333232),
            fontFamily: 'Poppins',
            fontSize: 15,
            fontWeight: FontWeight.bold
          ),
        ),
        backgroundColor: const Color(0xFF6493A5),
        elevation: 0.0,
        centerTitle: true,
        
        leading: GestureDetector(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: Container(
            margin: const EdgeInsets.all(10),
            alignment: Alignment.center,
            decoration: const BoxDecoration(
              color: Color(0xFF6493A5),
            ),
            child: 
              SvgPicture.asset('assets/icons/arrow-left.svg',
              height: 25,
              width: 25,
            ),
        ),
        ),
      ),

      body: const Center(
        child: Text('Settings Page'),
      ),
    );
  }
}