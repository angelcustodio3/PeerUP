// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
//import 'main.dart';
//import 'FC_FlashcardSetPage.dart';
//import 'FC_AddCardPage.dart';
//import 'FC_ViewCardSetPages.dart';
//import 'FC_PracticePages.dart';
import 'FC_QuizPage.dart';

class QuizQuestion {
  final String statement;
  final bool correctAnswer;

  QuizQuestion({required this.statement, required this.correctAnswer});
}

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});

  @override
  _QuizScreenState createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int currentQuestionIndex = 0;

  List<QuizQuestion> quizQuestions = [
    QuizQuestion(
      statement: 'The sky is blue.',
      correctAnswer: true,
    ),
    QuizQuestion(
      statement: 'The capital of France is London.',
      correctAnswer: false,
    ),
    // Add more questions...
  ];

  List<bool?> userAnswers = List.filled(10, null);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            QuizCard(
              quizQuestion: quizQuestions[currentQuestionIndex],
              questionNumber: currentQuestionIndex + 1,
              onAnswerSelected: (bool answer) {
                setState(() {
                  userAnswers[currentQuestionIndex] = answer;
                  if (currentQuestionIndex < quizQuestions.length - 1) {
                    currentQuestionIndex++;
                  } else {
                    // When quiz ends, calculate correct and wrong counts
                    int correctCount = userAnswers.where((answer) => answer == true).length;
                    int wrongCount = userAnswers.length - correctCount;

                    // Navigate to QuizCompletePage and pass counts
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => QuizComplete(
                          correctCount: correctCount,
                          wrongCount: wrongCount,
                        ),
                      ),
                    );
                  }
                });
              },
            ),
            const SizedBox(height: 20),
            // Removed the Finish Quiz button as it will navigate automatically
          ],
        ),
      ),
    );
  }
}

class QuizCard extends StatelessWidget {
  final QuizQuestion quizQuestion;
  final int questionNumber;
  final ValueChanged<bool> onAnswerSelected;

  const QuizCard({super.key, 
    required this.quizQuestion,
    required this.questionNumber,
    required this.onAnswerSelected,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Do something when the card is tapped
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
        width: 300,
        height: 200,
        decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.circular(10),
        ),
        child: _buildFrontCard(),
      ),
    );
  }

  Widget _buildFrontCard() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Question #$questionNumber\n\n${quizQuestion.statement}',
            textAlign: TextAlign.center,
            style: const TextStyle(color: Colors.white),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () {
                  onAnswerSelected(true);
                },
                child: const Text('True'),
              ),
              ElevatedButton(
                onPressed: () {
                  onAnswerSelected(false);
                },
                child: const Text('False'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class QuizComplete extends StatelessWidget {
  final int correctCount;
  final int wrongCount;

  const QuizComplete({super.key, 
    required this.correctCount,
    required this.wrongCount,
  });

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF0FA3B1),
        title: const Text('Review Completed'),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_rounded,
            color: Colors.white,
            size: 30,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Center(
        child: Container(
          width: screenWidth * 0.9,
          height: screenHeight * 0.75,
          decoration: BoxDecoration(
            color: const Color(0xFFE6F0F2),
            boxShadow: const [
              BoxShadow(
                blurRadius: 4,
                color: Color(0x40000000),
                offset: Offset(0, 4),
                spreadRadius: 0,
              ),
            ],
            borderRadius: BorderRadius.circular(20),
          ),
          child: Stack(
            children: [
              const Align(
                alignment: Alignment(-0.73, -0.65),
                child: Text(
                  'Review\nCompleted!',
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Align(
                alignment: const Alignment(0.90, -1.00),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(
                    'assets/graphics/welcome.png',
                    width: screenWidth * 0.25,
                    height: screenHeight * 0.3,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Align(
                alignment: const Alignment(-1.24, -0.85),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(
                    'assets/graphics/confetti.png',
                    width: screenWidth * 0.3,
                    height: screenHeight * 0.12,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Align(
                alignment: const Alignment(1.22, -0.34),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(
                    'assets/graphics/confetti.png',
                    width: screenWidth * 0.3,
                    height: screenHeight * 0.12,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Align(
                alignment: const Alignment(0.00, 0.23),
                child: Text(
                  'Score Summary',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: screenWidth * 0.08,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Align(
                alignment: const Alignment(0.04, 0.44),
                child: Text(
                  'CORRECT: $correctCount',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    color: const Color(0xFF0CDF4C),
                    fontSize: screenWidth * 0.06,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Align(
                alignment: const Alignment(0.05, 0.62),
                child: Text(
                  'WRONG: $wrongCount',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    color: const Color(0xFFFF5964),
                    fontSize: screenWidth * 0.06,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Align(
                alignment: const Alignment(0, 0.90),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const Flashcard(),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF0FA3B1),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: const Text('Done'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
