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

  CountDownController _controller = CountDownController();
  bool _isPause = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
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
          margin: EdgeInsets.all(10),
          alignment: Alignment.center,
          child: SvgPicture.asset(
            'assets/icons/left-arrow-svgrepo-com.svg',
            height: 20,
            width: 20,
          ),
          decoration: BoxDecoration(
            color: Colors.white,
          ),
        ),

        actions: [
          Container(
            margin: EdgeInsets.all(10),
            alignment: Alignment.center,
            width: 37,
            child: SvgPicture.asset(
              'assets/icons/settings-04-svgrepo-com.svg',
              height: 20,
              width: 20,
            ),
            decoration: BoxDecoration(
              color: Colors.white,
            ),
          ),
        ],
      ),

      body: Center(
        child: CircularCountDownTimer(
          width: MediaQuery.of(context).size.width / 2,
          height: MediaQuery.of(context).size.height / 2,
          duration: 150,
          fillColor: Color.fromARGB(255, 100, 147, 165),
          ringColor: Colors.white,
          controller: _controller,
          backgroundColor: Colors.white,
          strokeWidth: 15.0,
          strokeCap: StrokeCap.round,
          isTimerTextShown: true,
          isReverseAnimation: true,
          isReverse: true,
          textFormat: CountdownTextFormat.MM_SS,
          textStyle: TextStyle(
            fontFamily: 'Poppins',
            fontSize: 50.0,
            color: Colors.black),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Color.fromARGB(255, 100, 147, 165),
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
