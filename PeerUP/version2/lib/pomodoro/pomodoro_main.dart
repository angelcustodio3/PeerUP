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

class CountDownTimer {
  //final int duration;
  //final Color fillColor;
  final Function onComplete;

  CountDownTimer({
    //required this.duration,
    //@required this.fillColor,
    required this.onComplete,
  });
}


class _PomodoroState extends State<Pomodoro> {

  final CountDownController _controller = CountDownController();
  bool _isStarted = false;
  bool _isOnging = false;
  bool _focus = true;
  bool _short = false;
  int _focusTimer = 15;
  final int _shortBreak = 5;
  final int _longBreak = 7;
  final int _session = 4;
  int _timerDuration = 10;

  @override
  Widget build(BuildContext context) {

    // CountDownTimer _countDownTimer = CountDownTimer(
    //   onComplete: (){
    //     setState(() async {
    //       await NDialog(
    //         dialogStyle: DialogStyle(titleDivider: true),
    //         title: Text("Timer Completed"),
    //         //content: Text("Time to break."),
            
    //       ).show(context);
          
          
    //     });
    //   }, 
    // );

    return Scaffold(
      backgroundColor: const Color(0xFFFAEBD2),
      
      // Appbar Header of Pomodoro Page
      appBar: AppBar(
        toolbarHeight: 70.0,
        title: const Text(
          'POMODORO',
          style: TextStyle(
            color: Color(0xFF3D405B),
            fontFamily: 'Poppins',
            fontSize: 17,
            fontWeight: FontWeight.bold
          ),
        ),
        backgroundColor: const Color(0xFFFAEBD2),
        centerTitle: true,
        elevation: 1.5,
        
        // Arrow back icon in pomodoro header
        leading: GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const Techniques()),
          );},
          child: Container(
            margin: const EdgeInsets.all(15),
            alignment: Alignment.center,
            decoration: const BoxDecoration(color: Color(0xFFF9F7F3)),
            child:  const Icon(Icons.arrow_back_rounded, color: Color(0xFF333232), size: 32.0,)
          ),
        ),
        
        // Pomodoro settings icon in pomodoro header
        actions: [
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const PomodoroSettings()),
            );},
            child: Container(
              width: 37,
              alignment: Alignment.center,
              margin: const EdgeInsets.all(15),
              decoration: const BoxDecoration(color: Color(0xFFF9F7F3),),
              child: SvgPicture.asset('assets/icons/settings-2.svg', height: 27.0, width: 27.0,),
            ),
          )
        ],
      ),

      // Circular countdown timer
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
            textStyle: const TextStyle(
              fontFamily: 'Poppins',
              fontSize: 50.0,
              fontWeight: FontWeight.bold,
              color: Color(0xFF333232)),
            onComplete: () {
              if (_isOnging){
                showDialog(
                context: context,
                builder: (BuildContext dialogContext) {
                  return const Dialog(
                    //insetAnimationDuration: const Duration(seconds: 3.0),
                    
                    insetPadding: EdgeInsets.all(20.0),
                    backgroundColor: Color(0xFFF9F7F3),
                    shadowColor: Color(0xFF333232),
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text("Congrats! You finished your session!",
                        style: TextStyle( fontFamily: 'Poppins', fontSize: 15.0),
                      ),
                    ),
                  );
                },
              );
              }
              // _focusTimer = _shortBreak;
              // _controller.reset();
              // _controller.start();
            },
            onStart: () {
              debugPrint('Countdown Started');
            },
            // onChange: (String timeStamp){
            //   // if ($timeStamp = ''){

            //   // }
            //   debugPrint('Countdown Changed $timeStamp');
            // },
            // onComplete: () {
            //   Container(
            //     margin: EdgeInsets.only(left: 0.0,top: 60.0, bottom: 50.0, right:0.0),    
            //     child: Text('denifniefre', style: new 
            //       TextStyle( color: Colors.black, fontWeight: FontWeight.bold, fontSize: 100.0 ))
            //   , );
            //   //debugPrint('Countdown Changed $timeStamp');
            // }
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
                _isOnging = true;
                _controller.start();
              }else if (_isStarted == true && _isOnging == true){
                _isStarted = false;
                _isOnging = false;
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


