// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:peerup/flashcard/flashcard_main.dart';
import 'package:peerup/homepage/homepage.dart';
import 'package:peerup/homepage/mainpage.dart';
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
        backgroundColor: const Color(0xFF0FA3B1),
        centerTitle: true,
        elevation: 2,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_rounded,
            color: Color(0xFF333232),
            size: 30,
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const MainPage()),
            );
          },
        ),
        actions: const [],
      ),
      body: SafeArea(
        top: true,
        child: Stack(
          children: [
            // Study girl illustration
            Container(
              alignment: const Alignment(-0.04, -0.80),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.asset(
                  'assets/graphics/GirlStudy.png',
                  width: screenWidth * 0.6,
                  height: screenHeight * 0.225,
                  fit: BoxFit.cover,
                ),
              ),
            ),

            // Choose your focus text space
            Container(
              alignment: const Alignment(0, -0.15),
              child: Text(
                'CHOOSE YOUR FOCUS',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  color: const Color(0xFF333232),
                  fontSize: 25.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),

            // Pomodoro button section
            Container(
              alignment: const Alignment(-0.5, 0.25),
              child: GestureDetector(
                onTap: () {
                  showPomodoroDialog(context);
                },
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(
                    'assets/graphics/Rectangle.png',
                    width: screenWidth * 0.3,
                    height: screenHeight * 0.15,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),

            // Flashcard button section
            Container(
              alignment: const Alignment(0.5, 0.25),
              child: GestureDetector(
                onTap: () {
                  showFlashcardDialog(context);
                },
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(
                    'assets/graphics/Rectangle.png',
                    width: screenWidth * 0.3,
                    height: screenHeight * 0.15,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),

            Container(
              alignment: const Alignment(-0.45, 0.24),
              child: GestureDetector(
                onTap: () {
                  showPomodoroDialog(context);
                },
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: SvgPicture.asset(
                    'assets/icons/timer.svg',
                    width: screenWidth * 0.225,
                    height: screenHeight * 0.1125,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),

            Container(
              alignment: const Alignment(0.46, 0.24),
              child: GestureDetector(
                onTap: () {
                  showFlashcardDialog(context);
                },
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: SvgPicture.asset(
                    'assets/icons/cards.svg',
                    width: screenWidth * 0.225,
                    height: screenHeight * 0.1125,
                    fit: BoxFit.cover,
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

void showPomodoroDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(
                    'assets/graphics/Clock.png',
                    width: 85,
                    height: 85,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(
                    width: 16), // Add some spacing between the image and text
                const Text(
                  'POMODORO',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    color: Color(0xFF333232),
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
            const Text(
              'Pomodoro is a time management study method based on 25-minute stretches of focused work broken by 5-minute breaks with 15-minute long breaks after consecutive Pomodoro sessions.',
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 15,
              ),
            ),
            SizedBox(
              width: 16,
            ), // Add some spacing between the image and text
            Container(
              padding: EdgeInsets.only(top: 5.0),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const Pomodoro(),
                    ),
                  );
                },
                child: const Text('Use Technique'),
              ),
            ),
          ],
        ),
      );
    },
  );
}

void showFlashcardDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(
                    'assets/graphics/RedCard.png',
                    width: 85,
                    height: 85,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(
                    width: 16), // Add some spacing between the image and text
                const Text(
                  'FLASHCARD',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    color: Color(0xFF333232),
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
            const Text(
              'The Flashcard study technique helps engage learners in an active learning exercises that simulates the memories.',
            ),
            const SizedBox(
                width: 16), // Add some spacing between the image and text
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Flashcard(),
                  ),
                );
              },
              child: const Text('Use Technique'),
            ),
          ],
        ),
      );
    },
  );
}

class PopUpPageWidget extends StatelessWidget {
  const PopUpPageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        backgroundColor:
            const Color(0xFFE1E1E1), // Change to your desired background color
        appBar: AppBar(
          backgroundColor: const Color(0xFF0FA3B1),
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back_rounded,
              color: Color(0xFFF9F7F3),
              size: 30,
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          title: const Text(
            'Page Title',
            style: TextStyle(
              fontFamily: 'Outfit',
              color: Color(0xFFF9F7F3),
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
          actions: const [],
          centerTitle: true,
          elevation: 2,
        ),
        body: Column(
          children: [
            Container(
              width: double.infinity,
              height: 439,
              decoration: BoxDecoration(
                color: const Color(0xFFE6F0F2), // Change to your desired color
                borderRadius: BorderRadius.circular(5),
              ),
              child: Column(
                children: [
                  const SizedBox(height: 25),
                  Container(
                    width: 230,
                    height: 287,
                    decoration: BoxDecoration(
                      color: const Color(
                          0xFFF9F7F3), // Change to your desired color
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Text(
                        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Iaculis at erat pellentesque adipiscing commodo elit at. Ac orci phasellus egestas tellus rutrum tellus.',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    child: const Text('Use Technique'),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(
                'assets/images/Clock.png',
                width: 85,
                height: 85,
                fit: BoxFit.cover,
              ),
            ),
            const Text(
              'POMODORO',
              style: TextStyle(
                fontFamily: 'Poppins',
                color: Color(0xFF333232),
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
