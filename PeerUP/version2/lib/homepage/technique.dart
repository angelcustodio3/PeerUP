import 'package:flutter/material.dart';
import 'package:peerup/flashcard/flashcard_main.dart';
import 'package:peerup/pomodoro/pomodoro_main.dart';

class Techniques extends StatelessWidget {
  const Techniques({super.key});

  @override
  Widget build(BuildContext context) {
    // Get screen dimensions
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

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
                  'assets/graphics/GirlStudy.png',
                  width: screenWidth * 0.8, // Adjust the image width
                  height: screenHeight * 0.3, // Adjust the image height
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Align(
              alignment: const Alignment(0, -0.15),
              child: Text(
                'CHOOSE YOUR FOCUS',
                style: TextStyle(
                  fontFamily: 'Inter',
                  color: const Color(0xFF0D1238),
                  fontSize: screenWidth * 0.06, // Adjust the font size
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Align(
              alignment: const Alignment(-0.5, 0.25),
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
                    'assets/graphics/Rectangle28.png', // Fix asset path
                    width: screenWidth * 0.4, // Adjust the image width
                    height: screenHeight * 0.2, // Adjust the image height
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Align(
              alignment: const Alignment(0.5, 0.25),
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
                    'assets/graphics/Rectangle28.png', // Fix asset path
                    width: screenWidth * 0.4, // Adjust the image width
                    height: screenHeight * 0.2, // Adjust the image height
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
                  width: screenWidth * 0.3, // Adjust the image width
                  height: screenHeight * 0.15, // Adjust the image height
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Align(
              alignment: const Alignment(0.46, 0.24),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.asset(
                  'assets/graphics/RedCard.png', // Fix asset path
                  width: screenWidth * 0.3, // Adjust the image width
                  height: screenHeight * 0.15, // Adjust the image height
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
