// ignore_for_file: library_private_types_in_public_api png, library_private_types_in_public_api
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:peerup/flashcard/practice.dart';
import 'package:peerup/functions/addFlashcard.dart';
import 'package:peerup/functions/addFlashcardSet.dart';
import 'package:peerup/functions/fetchFlashcard.dart';
import 'package:peerup/functions/fetchFlashcardSet.dart';
import 'package:peerup/main.dart';
import 'FC_QuizPage.dart';
//import 'package:flip_card/flip_card.dart';

void main() {
  runApp(const MyApp());
}

class Flashcard extends StatefulWidget {
  const Flashcard({super.key});

  @override
  FlashcardState createState() => FlashcardState();
}

class FlashcardState extends State<Flashcard> {
  late Stream<QuerySnapshot<Map<String, dynamic>>> flashcardSets;
  @override
  void initState() {
    super.initState();

    flashcardSets = fetchFlashcardSet();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flashcard Sets'),
        backgroundColor: const Color(0xFF0FA3B1),
      ),
      body: StreamBuilder(
          stream: flashcardSets,
          builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            }

            if (snapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator();
            }

            if (snapshot.data?.docs == null) {
              return const Text('No flashcard sets yet');
            }

            if (snapshot.data!.docs.isEmpty) {
              return const Text('No flashcard sets yet');
            }

            return Column(
              children: snapshot.data!.docs.map((DocumentSnapshot document) {
                return Stack(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                ViewCard(flashcardSetId: document.id),
                          ),
                        );
                      },
                      child: Container(
                        color: const Color(0xFFE6F0F2),
                        child: Card(
                          margin: EdgeInsets.zero,
                          child: Column(
                            children: [
                              ListTile(
                                title: Text((document.data()
                                    as Map<String, dynamic>)?['name']),
                                subtitle: Text((document.data()
                                    as Map<String, dynamic>)?['desc']),
                                trailing: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        _showOptionsDialog(context);
                                      },
                                      child: const Icon(Icons.more_vert),
                                    ),
                                  ],
                                ),
                              ),
                              Align(
                                alignment: const FractionalOffset(0.035, 0.90),
                                child: ElevatedButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => PracticeReview(
                                            flashcardSetId: document.id),
                                      ),
                                    );
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: const Color(0xFFFBAD2F),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(0),
                                    ),
                                  ),
                                  child: const Text(
                                    'PRACTICE',
                                    style: TextStyle(
                                      fontFamily: 'Poppins',
                                      color: Color.fromARGB(255, 0, 0, 0),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              }).toList(),
            );
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AddFlashcardSet(),
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  void _showOptionsDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return SimpleDialog(
          title: const Text('Options'),
          children: <Widget>[
            _buildOption(
              text: 'Edit',
              icon: Icons.edit, // Pen icon
              onTap: () {
                // Add code for the "Edit" option
                Navigator.pop(context);
              },
            ),
            _buildOption(
              text: 'Remove',
              icon: Icons.delete, // Red trash bin icon
              iconColor: Colors.red, // Set the icon color
              onTap: () {
                // Add code for the "Remove" option
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }

  Widget _buildOption({
    required String text,
    required IconData icon,
    Color? iconColor,
    required VoidCallback onTap,
  }) {
    return SimpleDialogOption(
      onPressed: onTap,
      child: Row(
        children: [
          Icon(
            icon,
            color: iconColor,
          ),
          const SizedBox(width: 8), // Adjust the spacing between icon and text
          Text(text),
        ],
      ),
    );
  }
}

/*
void _showPracticeOptionsDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return SimpleDialog(
        title: const Text('Practice'),
        children: <Widget>[
          SimpleDialogOption(
            onPressed: () {
              // Add code for the first practice option
              Navigator.pop(context);
            },
            child: const Column(
              children: [
                Text(
                  'Basic Flashcard Review',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                Text(
                  'Classic Flashcard Method',
                  style: TextStyle(fontSize: 14, color: Colors.grey),
                ),
              ],
            ),
          ),
          SimpleDialogOption(
            onPressed: () {
              // Add code for the second practice option
              Navigator.pop(context);
            },
            child: const Column(
              children: [
                Text(
                  'Multiple Choice',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                Text(
                  'Select the correct answer',
                  style: TextStyle(fontSize: 14, color: Colors.grey),
                ),
              ],
            ),
          ),
        ],
      );
    },
  );
}
*/

class AddCard extends StatelessWidget {
  final answerController = TextEditingController();
  final questionController = TextEditingController();

  final String flashcardSetId;

  AddCard({super.key, required this.flashcardSetId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF0FA3B1),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              'Create FlashCard',
              style: TextStyle(
                fontSize: 24,
                fontFamily: 'Poppins Medium Regular',
              ),
            ),
          ),
          Center(
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.7,
              child: Card(
                color: Colors.grey[350],
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 22.0),
                        child: TextField(
                          controller: questionController,
                          maxLines: null,
                          decoration: const InputDecoration(
                            labelText: ('Question / Topic'),
                            border: OutlineInputBorder(),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 6.0),
                        child: TextField(
                          controller: answerController,
                          maxLines: null,
                          decoration: const InputDecoration(
                            labelText: 'Answer / Description',
                            border: OutlineInputBorder(),
                          ),
                        ),
                      ),
                      Builder(
                        builder: (BuildContext context) {
                          return Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor:
                                    const Color.fromRGBO(100, 147, 165, 100),
                              ),
                              onPressed: () async {
                                String question = questionController.text;
                                String answer = answerController.text;

                                if (question.isNotEmpty && answer.isNotEmpty) {
                                  await addFlashcard(
                                      flashcardSetId, question, answer);

                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text("Flashcard Added",
                                          style: TextStyle(
                                              fontFamily: 'Poppins Regular')),
                                      duration: Duration(seconds: 1),
                                    ),
                                  );
                                } else {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text("Invalid Input",
                                          style: TextStyle(
                                              fontFamily: 'Poppins Regular')),
                                      duration: Duration(seconds: 1),
                                    ),
                                  );
                                }
                                questionController.clear();
                                answerController.clear();
                              },
                              child: const Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text('Add Card',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontFamily: "'Poppins' SemiBold Regular",
                                    )),
                              ),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class AddFlashcardSet extends StatelessWidget {
  final nameController = TextEditingController();
  final descriptionController = TextEditingController();

  AddFlashcardSet({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF0FA3B1),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              'Create FlashCard Set',
              style: TextStyle(
                fontSize: 24,
                fontFamily: 'Poppins Medium Regular',
              ),
            ),
          ),
          Center(
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.7,
              child: Card(
                color: Colors.grey[350],
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 22.0),
                        child: TextField(
                          controller: nameController,
                          maxLines: null,
                          decoration: const InputDecoration(
                            labelText: ('Add subject title...'),
                            border: OutlineInputBorder(),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 6.0),
                        child: TextField(
                          controller: descriptionController,
                          maxLines: null,
                          decoration: const InputDecoration(
                            labelText: 'Add description...',
                            border: OutlineInputBorder(),
                          ),
                        ),
                      ),
                      Builder(
                        builder: (BuildContext context) {
                          return Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor:
                                    const Color.fromRGBO(100, 147, 165, 100),
                              ),
                              onPressed: () async {
                                String name = nameController.text;
                                String description = descriptionController.text;

                                if (name.isNotEmpty && description.isNotEmpty) {
                                  await addFlashcardSet(name, description);

                                  Navigator.of(context).pop();
                                } else {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text("Invalid Input",
                                          style: TextStyle(
                                              fontFamily: 'Poppins Regular')),
                                      duration: Duration(seconds: 1),
                                    ),
                                  );
                                }
                              },
                              child: const Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text('ADD SET',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontFamily: "'Poppins' SemiBold Regular",
                                    )),
                              ),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ViewCard extends StatefulWidget {
  final String flashcardSetId;

  const ViewCard({super.key, required this.flashcardSetId});

  @override
  _ViewCardState createState() =>
      _ViewCardState(flashcardSetId: flashcardSetId);
}

class _ViewCardState extends State<ViewCard> {
  _ViewCardState({required this.flashcardSetId});

  late Stream<QuerySnapshot<Map<String, dynamic>>> flashcards;
  final String flashcardSetId;

  @override
  initState() {
    super.initState();

    flashcards = fetchFlashcards(flashcardSetId);
  }

  bool isHeartFilled = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(51, 50, 50, 1),
      ),
      body: Padding(
          padding: const EdgeInsets.only(top: 5.0, bottom: 15.0),
          child: StreamBuilder(
              stream: flashcards,
              builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                }

                if (snapshot.connectionState == ConnectionState.waiting) {
                  return CircularProgressIndicator();
                }

                if (snapshot.data?.docs == null) {
                  return const Text('No flashcard yet');
                }

                if (snapshot.data!.docs.isEmpty) {
                  return Column(children: [
                    Text(' No flashcard added'),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    AddCard(flashcardSetId: flashcardSetId),
                              ),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                                const Color.fromRGBO(247, 160, 114, 1),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(0),
                            ),
                          ),
                          child: const Row(
                            children: [
                              Icon(
                                Icons.add,
                                color: Colors.black,
                              ),
                              Text(
                                'Add Card',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontFamily: 'Poppins',
                                  fontSize: 12.0,
                                ),
                              ),
                            ],
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const Practice(),
                              ),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                                const Color.fromRGBO(247, 160, 114, 1),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(0),
                            ),
                          ),
                          child: const Row(
                            children: [
                              Text(
                                'Practice',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontFamily: 'Poppins',
                                  fontSize: 12.0,
                                ),
                              ),
                              Icon(
                                Icons.arrow_forward,
                                color: Colors.black,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ]);
                  // return const Text('No flashcard yet');
                }

                return Column(children: [
                  ...snapshot.data!.docs.map((DocumentSnapshot document) {
                    return _buildCard(
                        (document.data() as Map<String, dynamic>)['question'],
                        (document.data() as Map<String, dynamic>)['answer']);
                  }).toList(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  AddCard(flashcardSetId: flashcardSetId),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              const Color.fromRGBO(247, 160, 114, 1),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(0),
                          ),
                        ),
                        child: const Row(
                          children: [
                            Icon(
                              Icons.add,
                              color: Colors.black,
                            ),
                            Text(
                              'Add Card',
                              style: TextStyle(
                                color: Colors.black,
                                fontFamily: 'Poppins',
                                fontSize: 12.0,
                              ),
                            ),
                          ],
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => PracticeReview(
                                flashcardSetId: flashcardSetId,
                              ),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              const Color.fromRGBO(247, 160, 114, 1),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(0),
                          ),
                        ),
                        child: const Row(
                          children: [
                            Text(
                              'Practice',
                              style: TextStyle(
                                color: Colors.black,
                                fontFamily: 'Poppins',
                                fontSize: 12.0,
                              ),
                            ),
                            Icon(
                              Icons.arrow_forward,
                              color: Colors.black,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ]);
              })),
    );
  }

  Widget _buildCard(String title, String subtitle) {
    return Card(
      color: const Color.fromRGBO(237, 222, 164, 1),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
      child: Column(
        children: [
          ListTile(
            title: Text(
              title,
              style: const TextStyle(
                fontFamily: 'Poppins',
                // fontSize: 20, // Set the desired font family
                fontWeight: FontWeight.bold, // Set the desired font weight
                color: Colors.black, // Set the desired font color
              ),
            ),
            subtitle: Text(
              subtitle,
              style: const TextStyle(
                fontFamily: 'Poppins', // Set the desired font family
                // fontSize: 15,
                fontWeight: FontWeight.normal, // Set the desired font weight
                color: Colors.black, // Set the desired font color
              ),
            ),
            contentPadding: const EdgeInsets.all(8.0),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  onPressed: () {
                    setState(() {
                      isHeartFilled = !isHeartFilled;
                    });
                  },
                  icon: Icon(
                    isHeartFilled ? Icons.favorite : Icons.favorite_border,
                    color: isHeartFilled ? Colors.red : Colors.black,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    _showOptionsDialog(context);
                  },
                  child: const Icon(Icons.more_vert, color: Colors.black),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _showOptionsDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return SimpleDialog(
          title: const Text('Options'),
          children: <Widget>[
            _buildOption(
              text: 'Edit',
              icon: Icons.edit,
              onTap: () {
                Navigator.pop(context);
              },
            ),
            _buildOption(
              text: 'Remove',
              icon: Icons.delete,
              iconColor: Colors.red,
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }

  Widget _buildOption({
    required String text,
    required IconData icon,
    Color? iconColor,
    required VoidCallback onTap,
  }) {
    return SimpleDialogOption(
      onPressed: onTap,
      child: Row(
        children: [
          Icon(
            icon,
            color: iconColor,
          ),
          const SizedBox(width: 8),
          Text(text),
        ],
      ),
    );
  }
}

class Practice extends StatefulWidget {
  const Practice({super.key});

  @override
  _FlashcardState createState() => _FlashcardState();
}

class _FlashcardState extends State<Practice> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xAD060606),
      appBar: AppBar(
        title: const Text('Practice',
            style:
                TextStyle(fontFamily: 'Poppins', fontWeight: FontWeight.w600)),
        backgroundColor: const Color(0xFF0FA3B1),
        actions: [
          IconButton(
            icon: const Icon(Icons.close),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
      body: Center(
        child: SizedBox(
          width: MediaQuery.of(context).size.width * 0.8,
          height: MediaQuery.of(context).size.height * 0.4,
          child: Card(
            color: const Color(0xFFE6F0F2),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Align(
                    alignment: Alignment.centerLeft, // Align text to the left
                    child: Text(
                      'Practice', // Add your text inside the Text widget
                      style: TextStyle(
                        fontSize: 24,
                        fontFamily: "'Poppins' Medium Regular",
                      ),
                    ),
                  ),
                ),
                PracticeCard(
                  title: 'Basic Flashcard Review',
                  subtitle: 'Classic flashcard method',
                  onTap: () {
                    // Navigate to another page for Card 1
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ViewFlashcard(),
                      ),
                    );
                  },
                ),
                PracticeCard(
                  title: 'Multiple Choice',
                  subtitle: 'Select the correct answer',
                  onTap: () {
                    // Navigate to another page for Card 2
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const AnotherPage(),
                      ),
                    );
                  },
                ),
                Expanded(
                  child: Image.asset(
                    'assets/graphics/design1.png',
                    fit: BoxFit.contain,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class PracticeCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final VoidCallback onTap;

  const PracticeCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        color: const Color(0xFF0FA3B1),
        child: ListTile(
          title: Text(title,
              style: const TextStyle(
                  fontFamily: 'Poppins', fontWeight: FontWeight.w500)),
          subtitle: Text(subtitle,
              style: const TextStyle(
                  fontFamily: 'Poppins', fontWeight: FontWeight.w400)),
        ),
      ),
    );
  }
}

class AnotherPage extends StatelessWidget {
  const AnotherPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Premium Feature'),
        backgroundColor: const Color(0xFF0FA3B1),
      ),
      body: const Center(
        child: Text(
            textAlign: TextAlign.center,
            'WOW! You have opened a Premium Feature!, access Premium to try this feature out!!'),
      ),
    );
  }
}

class PracticePageAndCard extends StatelessWidget {
  const PracticePageAndCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xAD060606),
      appBar: AppBar(
        title: const Text('Practice',
            style:
                TextStyle(fontFamily: 'Poppins', fontWeight: FontWeight.w600)),
        actions: [
          IconButton(
            icon: const Icon(Icons.close),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
      body: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height /
                2, // Half of the screen's height
            child: Card(
              child: Column(
                children: [
                  const ListTile(
                    title: Text(
                      'Practice',
                      style: TextStyle(
                          fontFamily: 'Poppins', fontWeight: FontWeight.w600),
                    ),
                  ),
                  PracticeCard(
                    title: 'Card 1',
                    subtitle: 'Practice Card 1',
                    onTap: () {
                      // Navigate to another page for Card 1
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ViewFlashcard(),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
          PracticeCard(
            title: 'Card 2',
            subtitle: 'Practice Card 2',
            onTap: () {
              // Navigate to another page for Card 2
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const AnotherPage(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

class PracticeCards extends StatelessWidget {
  final String title;
  final String subtitle;
  final VoidCallback onTap;

  const PracticeCards({
    super.key,
    required this.title,
    required this.subtitle,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color(0xFF0FA3B1),
      child: ListTile(
        title: Text(title,
            style: const TextStyle(
                fontFamily: 'Poppins', fontWeight: FontWeight.w500)),
        subtitle: Text(subtitle,
            style: const TextStyle(
                fontFamily: 'Poppins', fontWeight: FontWeight.w400)),
        onTap: onTap,
      ),
    );
  }
}

@override
Widget build(BuildContext context) {
  return Scaffold(
      body: Container(
    width: 360,
    height: 800,
    clipBehavior: Clip.antiAlias,
    decoration: ShapeDecoration(
      color: const Color(0xAD060606),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(25),
      ),
    ),
    child: Stack(
      children: [
        Positioned(
          left: -1458,
          top: -520,
          child: Container(
            width: 512,
            height: 512,
            padding: const EdgeInsets.only(
              top: 64,
              left: 64,
              right: 63.88,
              bottom: 63.88,
            ),
            clipBehavior: Clip.antiAlias,
            decoration: const BoxDecoration(),
            child: const Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                //
              ],
            ),
          ),
        ),
        Positioned(
          left: -1458,
          top: -520,
          child: Container(
            width: 512,
            height: 512,
            padding: const EdgeInsets.only(
              top: 127.91,
              left: 128,
              right: 128.11,
              bottom: 127.88,
            ),
            clipBehavior: Clip.antiAlias,
            decoration: const BoxDecoration(),
            child: const Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // children here
              ],
            ),
          ),
        ),
        Positioned(
          left: 0,
          right: 0,
          top: 139,
          child: Container(
            width: 127,
            height: 278,
            decoration: ShapeDecoration(
              color: const Color(0xFFE6F0F2),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
        ),
        Positioned(
          left: 30,
          top: 331,
          child: Container(
            width: 305,
            height: 66,
            decoration: const BoxDecoration(color: Color(0xFF0FA3B1)),
          ),
        ),
        Positioned(
          left: 28,
          top: 238,
          child: Container(
            width: 305,
            height: 66,
            decoration: const BoxDecoration(color: Color(0xFF0FA3B1)),
          ),
        ),
        const Positioned(
          left: 62,
          top: 340,
          child: SizedBox(
            width: 314,
            child: Text(
              'Multiple Choice',
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w500,
                height: 0,
              ),
            ),
          ),
        ),
        const Positioned(
          left: 62,
          top: 370,
          child: SizedBox(
            width: 208,
            height: 27,
            child: Text(
              'Select the correct answer',
              style: TextStyle(
                color: Colors.black,
                fontSize: 14,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w400,
                height: 0,
              ),
            ),
          ),
        ),
        const Positioned(
          left: 62,
          top: 278,
          child: SizedBox(
            width: 208,
            height: 27,
            child: Text(
              'Classic flashcard',
              style: TextStyle(
                color: Colors.black,
                fontSize: 14,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w400,
                height: 0,
              ),
            ),
          ),
        ),
        Positioned(
          left: 96,
          top: 404,
          child: Container(
            width: 200,
            height: 225,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: NetworkImage("https://via.placeholder.com/200x225"),
                fit: BoxFit.contain,
              ),
            ),
          ),
        ),
        const Positioned(
          left: 26,
          top: 169,
          child: SizedBox(
            width: 314,
            child: Text(
              'Practice',
              style: TextStyle(
                color: Colors.black,
                fontSize: 25,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w600,
                height: 0,
              ),
            ),
          ),
        ),
        const Positioned(
          left: 62,
          top: 248,
          child: SizedBox(
            width: 314,
            child: Text(
              'Basic Flashcard Review',
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w500,
                height: 0,
              ),
            ),
          ),
        ),
        Positioned(
          left: 296,
          top: 164,
          child: Container(
            width: 30,
            height: 40,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: NetworkImage("https://via.placeholder.com/30x40"),
                fit: BoxFit.contain,
              ),
            ),
          ),
        ),
      ],
    ),
  ));
}

class ViewFlashcard extends StatelessWidget {
  const ViewFlashcard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF0FA3B1),
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
        actions: const [],
        centerTitle: true,
        elevation: 2,
      ),
      body: Stack(
        children: [
          Align(
            alignment: const Alignment(0.0, -0.40),
            child: InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const Page2Widget()));
              },
              child: Container(
                width: 314,
                height: 420,
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
                child: Center(
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Page2Widget()));
                    },
                    child: const Text(
                      'Lorem Ipsum',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 25,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class Page2Widget extends StatelessWidget {
  const Page2Widget({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF0FA3B1),
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
        actions: const [],
        centerTitle: true,
        elevation: 2,
      ),
      body: SafeArea(
        top: true,
        child: Stack(
          children: [
            Align(
              alignment: const Alignment(0.0, -0.40),
              child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ViewFlashcard(),
                    ),
                  );
                },
                child: Container(
                  width: screenWidth * 0.9, // 90% of screen width
                  height: screenHeight * 0.6, // 60% of screen height
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
                  child: Align(
                    alignment: const Alignment(0.00, 0.00),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const Page2Widget(),
                          ),
                        );
                      },
                      child: Text(
                        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Orci ac auctor augue mauris augue neque gravida in fermentum.',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: screenWidth * 0.04, // Adjust the font size
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Align(
              alignment: const Alignment(-0.70, 0.70),
              child: Text(
                'Did you get it?',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: screenWidth * 0.04, // Adjust the font size
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            Align(
              alignment: const Alignment(-0.30, 0.90),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ReviewCompletePage(),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Text('Wrong'),
              ),
            ),
            Align(
              alignment: const Alignment(0.30, 0.90),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ReviewCompletePage(),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Text('Correct'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ReviewCompletePage extends StatelessWidget {
  const ReviewCompletePage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF0FA3B1),
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
        actions: const [],
        centerTitle: true,
        elevation: 2,
      ),
      body: Center(
        child: InkWell(
          child: Container(
            width: screenWidth * 0.9, // 90% of screen width
            height: screenHeight * 0.75, // 75% of screen height
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
                  child: InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
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
                ),
                Align(
                  alignment: const Alignment(0.90, -1.00),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.asset(
                      'assets/graphics/welcome.png',
                      width: screenWidth * 0.25, // Adjust the width
                      height: screenHeight * 0.3, // Adjust the height
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
                      width: screenWidth * 0.3, // Adjust the width
                      height: screenHeight * 0.12, // Adjust the height
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
                      width: screenWidth * 0.3, // Adjust the width
                      height: screenHeight * 0.12, // Adjust the height
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
                      fontSize: screenWidth * 0.08, // Adjust the font size
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Align(
                  alignment: const Alignment(0.04, 0.44),
                  child: Text(
                    'CORRECT: 2',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      color: const Color(0xFF0CDF4C),
                      fontSize: screenWidth * 0.06, // Adjust the font size
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Align(
                  alignment: const Alignment(0.05, 0.62),
                  child: Text(
                    'WRONG: 1',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      color: const Color(0xFFFF5964),
                      fontSize: screenWidth * 0.06, // Adjust the font size
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Align(
                  alignment: const Alignment(0, 0.90),
                  child: ElevatedButton(
                    onPressed: () {
                      //Navigator.pop(context); // Pop the current page
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
      ),
    );
  }
}
