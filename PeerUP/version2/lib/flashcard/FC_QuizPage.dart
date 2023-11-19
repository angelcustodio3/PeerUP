// ignore_for_file: library_private_types_in_public_api, unused_import

import 'package:flutter/material.dart';
import 'package:peerup/flashcard/flashcard_main.dart';
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

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  _QuizScreenState createState() => _QuizScreenState();
}

class _QuizScreenState extends State<Quiz> {
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
    QuizQuestion(
      statement: 'Sharks are mammals.',
      correctAnswer: false,
    ),
    QuizQuestion(
      statement: 'Sea otters have a favorite rock they use to break open food.',
      correctAnswer: true,
    ),
    QuizQuestion(
      statement: 'Pigs roll in the mud because they dont like being clean.',
      correctAnswer: false,
    ),
    QuizQuestion(
      statement: 'It takes a sloth two weeks to digest a meal.',
      correctAnswer: true,
    ),
    QuizQuestion(
      statement: 'Galapagos tortoises sleep up to 16 hours a day.',
      correctAnswer: true,
    ),
    QuizQuestion(
      statement: 'Herbivores are animal eaters.',
      correctAnswer: false,
    ),
    QuizQuestion(
      statement: 'A monkey was the first non-human to go into space.',
      correctAnswer: false,
    ),
    QuizQuestion(
      statement: 'New York City is composed of between 36 and 42 islands.',
      correctAnswer: true,
    ),    // Add more questions...
  ];

  List<bool?> userAnswers = List.filled(10, null);

    void moveToNextQuestion() {
    setState(() {

      // Check if it's not the last question, then move to the next question
      if (currentQuestionIndex < quizQuestions.length - 1) {
        currentQuestionIndex++;
      } else {
        // When all questions are answered, navigate to the QuizCompletePage
        int correctCount = userAnswers.where((answer) => answer == true).length;
        int wrongCount = 10 - correctCount;

        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => QuizComplete(
              correctCount: correctCount,
              wrongCount: wrongCount,
            ),
          ),
        );
        return;
      }
    });
    }

  void onAnswerSelected(bool answer) {
    userAnswers[currentQuestionIndex] = answer;
    moveToNextQuestion();
  }  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF0FA3B1),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            QuizCard(
              quizQuestion: quizQuestions[currentQuestionIndex],
              questionNumber: currentQuestionIndex + 1,
              onAnswerSelected: onAnswerSelected,
            ),
            const SizedBox(height: 20),
            // Removed the Finish Quiz button as it will navigate automatically
          ],
        ),
      ),
    );
  }
}

class QuizCard extends StatefulWidget {
  final QuizQuestion quizQuestion;
  final int questionNumber;
  final ValueChanged<bool> onAnswerSelected;
  //final Function(bool) moveToNextQuestion; // Function to move to the next question

  const QuizCard({
    super.key,
    required this.quizQuestion,
    required this.questionNumber,
    required this.onAnswerSelected,
    //required this.moveToNextQuestion,
  });

  @override
  _QuizCardState createState() => _QuizCardState();
}

class _QuizCardState extends State<QuizCard> {
  bool answerRevealed = false;
  bool userAnswer = false;
@override
Widget build(BuildContext context) {

    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    
    return Center(
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
        width: screenWidth * 0.9, // 90% of screen width
        height: screenHeight * 0.4,
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Question #${widget.questionNumber}\n\n${widget.quizQuestion.statement}',
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w400,
              ),
            ),
            const SizedBox(height: 40),
            if (answerRevealed) ...[
              Text(
                'Correct Answer: ${widget.quizQuestion.correctAnswer ? 'True' : 'False'}',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    answerRevealed = false;
                    widget.onAnswerSelected(userAnswer);
                  });
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF0FA3B1),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Text('Next Question'),
              ),
            ] else ...[
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    answerRevealed = true;
                  });
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF0FA3B1),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Text('Reveal Answer'),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        userAnswer = true;
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF0FA3B1),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: const Text('True'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        userAnswer = false;
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF0FA3B1),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: const Text('False'),
                  ),
                ],
              ),
            ],
          ],
        ),
      ),
    );
  }
}
  

class QuizComplete extends StatelessWidget {
  final int correctCount;
  final int wrongCount;

  const QuizComplete({
    super.key,
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
