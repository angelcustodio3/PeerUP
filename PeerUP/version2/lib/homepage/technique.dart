import 'package:flutter/material.dart';
import 'package:peerup/flashcard/flashcard_main.dart';
import 'package:peerup/pomodoro/pomodoro_main.dart';

class Techniques extends StatelessWidget {
  const Techniques({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF6493A5),
        centerTitle: true,
        elevation: 2,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_rounded,
            color: Colors.white,
            size: 30,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        actions: const [],
      ),
      body: SafeArea(
        top: true,
        child: Stack(
          children: [
            Align(
              alignment: const Alignment(-0.04, -0.80),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.asset(
                  'assets/graphics/Girl_study.png',
                  width: 300,
                  height: 200,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const Align(
              alignment: Alignment(0.00, -0.15),
              child: Text(
                'CHOOSE YOUR FOCUS',
                style: TextStyle(
                  fontFamily: 'Inter',
                  color: Color(0xFF0D1238),
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Align(
              alignment: const Alignment(-0.50, 0.25),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const Pomodoro(),
                    ),
                  );
                },
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(
                    'assets/graphics/Rectangle_28.png',
                    width: 115,
                    height: 110,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Align(
              alignment: const Alignment(0.50, 0.25),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const Flashcard(),
                    ),
                  );
                },
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(
                    'assets/graphics/Rectangle_28.png',
                    width: 115,
                    height: 110,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Align(
              alignment: const Alignment(-0.45, 0.24),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.asset(
                  'assets/graphics/Clock.png',
                  width: 90,
                  height: 91,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Align(
              alignment: const Alignment(0.46, 0.24),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.asset(
                  'assets/graphics/Red_Card.png',
                  width: 88,
                  height: 90,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Align(
              alignment: const Alignment(0.00, 0.00),
              child: ElevatedButton(
                onPressed: () {
                  // Handle the button press.
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF6493A5),
                  padding: const EdgeInsets.fromLTRB(24, 0, 24, 0),
                  minimumSize: const Size(88, 40),
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                  ),
                ),
                child: const Text(
                  'Button',
                  style: TextStyle(
                    fontFamily: 'Readex Pro',
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
