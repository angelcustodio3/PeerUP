import 'package:flutter/material.dart';

class Techniques extends StatelessWidget {
  const Techniques({super.key});

  @override
  Widget build(BuildContext context) {
    // Get screen dimensions
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    void showTechniqueDialog(
        BuildContext context, String title, String imagePath, String description) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(title),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Align(
                  alignment: const AlignmentDirectional(-0.70, -0.97),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.asset(
                      imagePath,
                      width: screenWidth * 0.3,
                      height: screenWidth * 0.3, // Maintain aspect ratio
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Text(
                  description,
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text('Use Technique'),
                ),
              ],
            ),
          );
        },
      );
    }

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
                  width: screenWidth * 0.6,
                  height: screenHeight * 0.225,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Align(
              alignment: const Alignment(-0.45, 0.24),
              child: GestureDetector(
                onTap: () {
                  showTechniqueDialog(
                    context,
                    'POMODORO',
                    'assets/graphics/Clock.png',
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Iaculis at erat pellentesque adipiscing commodo elit at. Ac orci phasellus egestas tellus rutrum tellus.',
                  );
                },
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(
                    'assets/graphics/Clock.png',
                    width: screenWidth * 0.225,
                    height: screenHeight * 0.1125,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Align(
              alignment: const Alignment(0.46, 0.24),
              child: GestureDetector(
                onTap: () {
                  showTechniqueDialog(
                    context,
                    'FLASHCARD',
                    'assets/graphics/RedCard.png',
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Iaculis at erat pellentesque adipiscing commodo elit at. Ac orci phasellus egestas tellus rutrum tellus.',
                  );
                },
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(
                    'assets/graphics/RedCard.png',
                    width: screenWidth * 0.225,
                    height: screenHeight * 0.1125,
                    fit: BoxFit.cover,
                  ),
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
                  fontSize: screenWidth * 0.06,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Align(
              alignment: const Alignment(-0.5, 0.25),
              child: GestureDetector(
                onTap: () {
                  showTechniqueDialog(
                    context,
                    'POMODORO',
                    'assets/graphics/Clock.png',
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Iaculis at erat pellentesque adipiscing commodo elit at. Ac orci phasellus egestas tellus rutrum tellus.',
                  );
                },
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(
                    'assets/graphics/Rectangle28.png',
                    width: screenWidth * 0.3,
                    height: screenHeight * 0.15,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Align(
              alignment: const Alignment(0.5, 0.25),
              child: GestureDetector(
                onTap: () {
                  showTechniqueDialog(
                    context,
                    'FLASHCARD',
                    'assets/graphics/RedCard.png',
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Iaculis at erat pellentesque adipiscing commodo elit at. Ac orci phasellus egestas tellus rutrum tellus.',
                  );
                },
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(
                    'assets/graphics/Rectangle28.png',
                    width: screenWidth * 0.3,
                    height: screenHeight * 0.15,
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

void main() {
  runApp(const MaterialApp(home: Techniques()));
}
