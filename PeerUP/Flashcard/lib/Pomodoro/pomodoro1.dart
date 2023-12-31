// ignore_for_file: unused_import

import 'dart:async';

import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/material.dart';

class Pomodoro extends StatefulWidget {
  const Pomodoro({super.key});
  @override
  State<Pomodoro> createState() => _PomodoroState();
}

class _PomodoroState extends State<Pomodoro> {

  final CountDownController _controller = CountDownController();
  bool _isPause = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'POMODORO',
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

      body: Center(
        child: CircularCountDownTimer(
          width: MediaQuery.of(context).size.width / 2,
          height: MediaQuery.of(context).size.height / 2,
          duration: 150,
          fillColor: const Color.fromARGB(255, 100, 147, 165),
          ringColor: Colors.white,
          controller: _controller,
          backgroundColor: Colors.white,
          strokeWidth: 15.0,
          strokeCap: StrokeCap.round,
          isTimerTextShown: true,
          isReverseAnimation: true,
          isReverse: true,
          textFormat: CountdownTextFormat.MM_SS,
          textStyle: const TextStyle(
            fontFamily: 'Poppins',
            fontSize: 50.0,
            color: Colors.black),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: const Color.fromARGB(255, 100, 147, 165),
        onPressed: (){
          setState(() {
            if(_isPause){
              _isPause = false;
              _controller.resume();
            }
            else{
              _isPause = true;
              _controller.pause();
            }
          });
        }, 
        icon: Icon(_isPause ? Icons.play_arrow : Icons.pause),
        label: Text(_isPause ? 'Resume' : 'Pause' ),
        
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
