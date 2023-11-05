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
  bool _isPause = false;

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
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
        backgroundColor: const Color(0xFF6493A5),
        elevation: 0.0,
        centerTitle: true,
        
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
              color: Color(0xFF6493A5),
            ),
            child: 
              SvgPicture.asset('assets/icons/arrow-left.svg',
              height: 25,
              width: 25,
            ),
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
                color: Color(0xFF6493A5),
              ),
              child: 
                SvgPicture.asset('assets/icons/settings-2.svg',
                height: 25,
                width: 25,
              ),
            ),
          )
          
        ],
      ),

      body: Center(
        child: CircularCountDownTimer(
          width: MediaQuery.of(context).size.width / 2.5,
          height: MediaQuery.of(context).size.height / 2.5,
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
          autoStart: false,
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
