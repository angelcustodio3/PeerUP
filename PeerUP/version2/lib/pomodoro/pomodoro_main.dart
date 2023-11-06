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
  bool _isPause = true;

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      backgroundColor: const Color(0xFFF9F7F3),
      appBar: AppBar(
        title: const Text(
          'POMODORO',
          style: TextStyle(
            color: Color(0xFF333232),
            fontFamily: 'Poppins',
            fontSize: 15,
            fontWeight: FontWeight.bold
          ),
        ),
        backgroundColor: const Color(0xFF0FA3B1),
        centerTitle: true,
        elevation: 0.0,
        leading: GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const Techniques()),
            );
          },
          child: Container(
            margin: const EdgeInsets.all(10),
            alignment: Alignment.center,
            decoration: const BoxDecoration(
              color: Color(0xFF0FA3B1),
            ),
            child:  const Icon(Icons.arrow_back_rounded, color: Color(0xFF333232), size: 30.0,)
          ),
        ),

        actions: [
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const PomodoroSettings()),
              );
            },
            child: Container(
              margin: const EdgeInsets.all(10),
              alignment: Alignment.center,
              width: 37,
              decoration: const BoxDecoration(
                color: Color(0xFF0FA3B1),
              ),
              child: 
                SvgPicture.asset('assets/icons/settings-2.svg',
                height: 25.5,
                width: 25.5,
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
            
            width: MediaQuery.of(context).size.width / 2.0,
            height: MediaQuery.of(context).size.height / 2.0,
            duration: 150,
            fillColor: const Color(0xFF0FA3B1),
            ringColor: Color(_isStarted ? 0xFFF4F1DE : 0xFF0FA3B1),
            //ringColor: const Color(0xFFF9F7F3),
            controller: _controller,
            backgroundColor: const Color(0xFFF9F7F3),
            strokeWidth: 15.0,
            strokeCap: StrokeCap.round,
            isTimerTextShown: true,
            isReverseAnimation: true,
            isReverse: true,
            autoStart: false,
            textFormat: CountdownTextFormat.MM_SS,
            textStyle: const TextStyle(
              fontFamily: 'Poppins',
              fontSize: 50.0,
              fontWeight: FontWeight.w600,
              color: Color(0xFF333232)),
          ),
        ),
      ),
      
      floatingActionButton: Container(
        margin: const EdgeInsets.only(bottom: 70.0),
        child: FloatingActionButton(
          backgroundColor: const Color(0xFF0FA3B1),
          onPressed: (){
            setState(() {
              if(_isStarted == false && _isPause == true){
                _isStarted = true;
                _isPause = false;
                _controller.restart();
              }else if (_isStarted == true && _isPause == false){
                _isPause = true;
                _controller.pause();
              }else if (_isStarted && _isPause){
                _isPause = false;
                _controller.resume();
              }
            });
          }, 
          child: Icon(_isPause ? Icons.play_arrow_rounded : Icons.pause_rounded, size: 40.0, color: const Color(0xFFF9F7F3)),
        ),
      ),
      
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
