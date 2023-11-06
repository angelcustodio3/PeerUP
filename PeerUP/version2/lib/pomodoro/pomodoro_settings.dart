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
        backgroundColor: const Color(0xFF0FA3B1),
        elevation: 0.0,
        centerTitle: true,
        leading: GestureDetector(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: Container(
            width: 25.5,
            height: 25.5,
            alignment: Alignment.center,
            margin: const EdgeInsets.all(10),
            decoration: const BoxDecoration(color: Color(0xFF0FA3B1)),
            child: const Icon(Icons.arrow_back_rounded, color: Color(0xFF333232), size: 30.0,)
          ),
        ),
      ),
      body: const Center(
        child: Text('Pomodoro Settings Page'),
      ),
    );
  }
}