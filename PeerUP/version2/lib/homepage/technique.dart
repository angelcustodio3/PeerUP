import 'package:flutter/material.dart';
import 'package:peerup/flashcard/flashcard_main.dart';
import 'package:peerup/pomodoro/pomodoro_main.dart';

class Techniques extends StatelessWidget {
  const Techniques({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PeerUP'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('Study Techniques'),
            const SizedBox(height: 20),
            
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Flashcard(),
                  ),
                );
              },
              child: const Text('Flashcard Technique'),
            ),

            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Pomodoro(),
                  ),
                );
              },
              child: const Text('Pomodoro Technique'),
            ),
          ],
        ),
      ),
    );
  }
}