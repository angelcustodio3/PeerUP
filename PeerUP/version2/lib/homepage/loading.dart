import 'package:flutter/material.dart';
import 'package:peerup/homepage/LogIn.dart';
import 'package:peerup/homepage/mainpage.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(100, 147, 165, 100),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color.fromRGBO(28, 104, 157, 69.27), // Top color
              Color.fromRGBO(100, 147, 165, 100), // Middle color
              Color.fromRGBO(255, 255, 255, 100), // Bottom color
            ],
          ),
        ),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              // Stroked text as border.
              Text(
                'PEERUP',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 48,
                  fontWeight: FontWeight.bold,
                  foreground: Paint()
                    ..style = PaintingStyle.stroke
                    ..strokeWidth = 2
                    ..color = const Color(0x9C6493A5),
                ),
              ),
              // Solid text as fill.
              const Text(
                'PEERUP',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  color: Color.fromARGB(255, 255, 255, 255),
                  fontSize: 48,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 45),
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.asset(
                  'assets/graphics/book.gif',
                  width: 300,
                  height: 200,
                  fit: BoxFit.cover,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
