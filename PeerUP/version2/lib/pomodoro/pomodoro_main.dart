import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/material.dart';
import 'package:peerup/homepage/technique.dart';
import 'package:peerup/pomodoro/pomodoro_settings.dart';

class Pomodoro extends StatefulWidget {
  const Pomodoro({super.key});
  @override
  State<Pomodoro> createState() => _PomodoroState();
}

class _PomodoroState extends State<Pomodoro> {

  final CountDownController _controller = CountDownController();
  bool _isStarted = false;
  int _focusTimer = 150;
  int _shortBreak = 30;
  int _longBreak = 60;
  

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      backgroundColor: const Color(0xFFF9F7F3),
      // Header of Pomodoro Page
      appBar: AppBar(
        
        toolbarHeight: 70.0,
        title: const Text(
          'POMODORO',
          style: TextStyle(
            color: Color(0xFF333232),
            fontFamily: 'Poppins',
            fontSize: 17,
            fontWeight: FontWeight.bold
          ),
        ),
        backgroundColor: const Color(0xFFF9F7F3),
        centerTitle: true,
        elevation: 1.5,
        // Arrow back icon
        leading: GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const Techniques()),
            );
          },
          child: Container(
            margin: const EdgeInsets.all(15),
            alignment: Alignment.center,
            decoration: const BoxDecoration(
              color: Color(0xFFF9F7F3),
            ),
            child:  const Icon(Icons.arrow_back_rounded, color: Color(0xFF333232), size: 32.0,)
          ),
        ),
        // Pomodoro settings icon
        actions: [
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const PomodoroSettings()),
              );
            },
            child: Container(
              margin: const EdgeInsets.all(15),
              alignment: Alignment.center,
              width: 37,
              decoration: const BoxDecoration(
                color: Color(0xFFF9F7F3),
                
              ),
              child: 
                SvgPicture.asset('assets/icons/settings-2.svg',
                height: 27.0,
                width: 27.0,
              ),
            ),
          )
        ],
      ),
      body: Container(
        padding: const EdgeInsets.only(bottom: 200.0),
        margin: const EdgeInsets.all(50.0),
        //color: Colors.black,
        child: Center(
          child: CircularCountDownTimer(
            width: MediaQuery.of(context).size.width / 1.75,
            height: MediaQuery.of(context).size.height / 1.75,
            duration: _focusTimer,
            fillColor: const Color(0xFF0FA3B1),
            ringColor: Color(_isStarted ? 0xFFF4F1DE : 0xFF0FA3B1),
            controller: _controller,
            backgroundColor: const Color(0xFFF9F7F3),
            strokeWidth: 15.0,
            strokeCap: StrokeCap.round,
            isTimerTextShown: true,
            isReverseAnimation: true,
            isReverse: true,
            autoStart: false,
            textFormat: CountdownTextFormat.MM_SS,
            //onComplete: () => ,
            textStyle: const TextStyle(
              fontFamily: 'Poppins',
              fontSize: 50.0,
              fontWeight: FontWeight.bold,
              color: Color(0xFF333232)),
          ),
        ),
      ),
      
      floatingActionButton: Container(
        margin: const EdgeInsets.only(bottom: 70.0),
        height: 50.0,
        width: 120.0,
        child: FloatingActionButton.extended(
          backgroundColor: const Color(0xFF0FA3B1),
          onPressed: (){
            setState(() {
              if(_isStarted == false){
                _isStarted = true;
                _controller.restart();
              }else if (_isStarted == true){
                _isStarted = false;
                _controller.reset();
            }});
          }, 
          label: 
            //extStyle(),
            Text(_isStarted ? 'RESET' : 'START',
              style: const TextStyle(
                color: Color(0xFFF7F9F3),
                fontFamily: 'Poppins',
                fontSize: 19.0,
                fontWeight: FontWeight.bold,
              ),
            ),
        ),
      ),
      
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
