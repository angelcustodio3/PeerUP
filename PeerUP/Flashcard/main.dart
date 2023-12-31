// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

ThemeData myCustomTheme = ThemeData(
  textTheme: TextTheme(
    bodyLarge: myDefaultTextStyle,
    bodyMedium: myDefaultTextStyle,
  ),
  primaryColor: const Color(0xFF0FA3B1),  // Primary color
  hintColor: const Color(0xFFB5E2FA),   // Accent color
  scaffoldBackgroundColor: const Color(0xFFF9F7F3),
  buttonColor: const Color(0xFFF7A072), colorScheme: const ColorScheme(background: Color(0xFFEDDEA4), brightness: null, primary: null),
  // Add more colors as needed
);

TextStyle myDefaultTextStyle = const TextStyle(
  fontFamily: 'Poppins', // Use the Poppins font
  fontSize: 16.0,
  color: Colors.black, // You can change the color if needed
);

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: FirstPage(),
    );
  }
}

class FirstPage extends StatelessWidget {
  const FirstPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PeerUP'),
        backgroundColor: const Color(0xFF6493A5),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('PeerUP HomePage'),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SecondPage(),
                  ),
                );
              },
                  style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromRGBO(100, 147, 165, 100),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              child: const Text('Flashcard Technique'),
            ),
          ],
        ),
      ),
    );
  }
}

class SecondPage extends StatelessWidget {
  const SecondPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flashcard Sets'),
        backgroundColor: const Color(0xFF6493A5),
      ),
      body: Column(
        children: [
          Stack(
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ViewCard(),
                    ),
                  );
                }, 
                child: Card(
                  child: Column(
                    children: [
                      ListTile(
                        title: const Text('CMSC 128'),
                        subtitle: const Text('Flashcard set for 1st LE'),
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
                    builder: (context) => const Practice(),
                  ),
                );
                          },
                  style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromRGBO(251, 173, 47, 100)
          ,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                         child: const Text(
                    'Practice',
                    style: TextStyle(
                      fontFamily: 'Inter',
                      color: Color.fromARGB(255, 0, 0, 0),
                    ),
                  ),
                          
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AddCard(),
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

// void _showPracticeOptionsDialog(BuildContext context) {
//   showDialog(
//     context: context,
//     builder: (BuildContext context) {
//       return SimpleDialog(
//         title: const Text('Practice'),
//         children: <Widget>[
//           SimpleDialogOption(
//             onPressed: () {
//               // Add code for the first practice option
//               Navigator.pop(context);
//             },
//             child: const Column(
//               children: [
//                 Text(
//                   'Basic Flashcard Review',
//                   style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//                 ),
//                 Text(
//                   'Classic Flashcard Method',
//                   style: TextStyle(fontSize: 14, color: Colors.grey),
//                 ),
//               ],
//             ),
//           ),
//           SimpleDialogOption(
//             onPressed: () {
//               // Add code for the second practice option
//               Navigator.pop(context);
//             },
//             child: const Column(
//               children: [
//                 Text(
//                   'Multiple Choice',
//                   style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//                 ),
//                 Text(
//                   'Select the correct answer',
//                   style: TextStyle(fontSize: 14, color: Colors.grey),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       );
//     },
//   );
// }

class AddCard extends StatelessWidget {
  final answerController = TextEditingController();
  final questionController = TextEditingController();

  AddCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo[300],
        actions: [
          SizedBox(
            width: 80,
            child: IconButton(
              icon: const Icon(
                Icons.check_circle,
                size: 30,
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SecondPage(),
                  ),
                );
              },
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          const Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Create FlashCard',
                style: TextStyle(
                  fontSize: 24,
                ),
              ),
            ),
          ),
          Expanded(
            child: Center(
              child: Card(
                color: Colors.grey[350],
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.75,
                  height: MediaQuery.of(context).size.height * 0.5,
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 25.0),
                          child: TextField(
                            controller: questionController,
                            maxLines: null,
                            decoration: const InputDecoration(
                              labelText: ('Question / Topic'),
                              border: OutlineInputBorder(),
                            ),
                          ),
                        ),
                        const SizedBox(height: 5),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 8.0),
                          child: TextField(
                            controller: answerController,
                            maxLines: null,
                            decoration: const InputDecoration(
                              labelText: 'Answer / Description',
                              border: OutlineInputBorder(),
                            ),
                          ),
                        ),
                        const Spacer(),
                        Builder(
                          builder: (BuildContext context) {
                            return Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: ElevatedButton(
                                onPressed: () {
                                  // Add flashcards in a list or backend
                                  questionController.clear();
                                  answerController.clear();
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text("Flashcard Added"),
                                      duration: Duration(seconds: 1),
                                    ),
                                  );
                                },
                                child: const Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Text('Add Card',
                                      style: TextStyle(
                                        fontSize: 16,
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
          ),
        ],
      ),
    );
  }
}

class ViewCard extends StatefulWidget {
  const ViewCard({super.key});

  @override
  _ViewCardState createState() => _ViewCardState();
}

class _ViewCardState extends State<ViewCard> {
  bool isHeartFilled = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF6493A5),
      ),
      body: Column(
        children: [
          Expanded(
            child: Stack(
              children: [
                // Your existing card content
                Card(
                  child: Column(
                    children: [
                      ListTile(
                        title: const Text('Lorem ipsum'),
                        subtitle: const Text(
                            'Lorem ipsum dolor sit amet consectetur adipisicing elit.'),
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
                                isHeartFilled
                                    ? Icons.favorite
                                    : Icons.favorite_border,
                                color:
                                    isHeartFilled ? Colors.red : Colors.black,
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                _showOptionsDialog(context);
                              },
                              child: const Icon(Icons.more_vert),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            color: Colors.white,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AddCard(),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromRGBO(100, 147, 165, 100),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                  child: const Row(
                    children: [
                      Icon(Icons.add),
                      Text('Add Card'),
                    ],
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    // Practice navigation here
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const Practice(),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromRGBO(100, 147, 165, 100),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                  child: const Row(
                    children: [
                      Text('Practice'),
                      Icon(Icons.arrow_forward),
                    ],
                  ),
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

class Practice extends StatelessWidget {
  const Practice({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xAD060606),
      appBar: AppBar(
        title: const Text('Practice',
            style: TextStyle(fontFamily: 'Inter', fontWeight: FontWeight.w600)),
            backgroundColor: const Color(0xFF6493A5),
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
        child: Card(
          color: const Color(0xFFE6F0F2),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            children: [
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
            ],
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

  const PracticeCard({super.key, 
    required this.title,
    required this.subtitle,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        color: const Color(0xFF6493A5),
        child: ListTile(
          title: Text(title,
              style:
                  const TextStyle(fontFamily: 'Inter', fontWeight: FontWeight.w500)),
          subtitle: Text(subtitle,
              style:
                  const TextStyle(fontFamily: 'Inter', fontWeight: FontWeight.w400)),
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
        backgroundColor: const Color(0xFF6493A5),
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
            style: TextStyle(fontFamily: 'Inter', fontWeight: FontWeight.w600)),
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
                          fontFamily: 'Inter', fontWeight: FontWeight.w600),
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

  const PracticeCards({super.key, 
    required this.title,
    required this.subtitle,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color(0xFF6493A5),
      child: ListTile(
        title: Text(title,
            style: const TextStyle(fontFamily: 'Inter', fontWeight: FontWeight.w500)),
        subtitle: Text(subtitle,
            style: const TextStyle(fontFamily: 'Inter', fontWeight: FontWeight.w400)),
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
            decoration: const BoxDecoration(color: Color(0xFF6493A5)),
          ),
        ),
        Positioned(
          left: 28,
          top: 238,
          child: Container(
            width: 305,
            height: 66,
            decoration: const BoxDecoration(color: Color(0xFF6493A5)),
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
                fontFamily: 'Inter',
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
                fontFamily: 'Inter',
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
                fontFamily: 'Inter',
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
                fontFamily: 'Inter',
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
                fontFamily: 'Inter',
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
  const ViewFlashcard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF6493A5),
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
                Navigator.push(context, MaterialPageRoute(builder: (context) => const Page2Widget()));
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
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const Page2Widget()));
                    },
                    child: const Text(
                      'Lorem Ipsum',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: 'Inter',
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
  const Page2Widget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF6493A5),
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
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const Page2Widget()));
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
                  child: Align(
                    alignment: const Alignment(0.00, 0.00),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => const Page2Widget()));
                      },
                      child: const Text(
                        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Orci ac auctor augue mauris augue neque gravida in fermentum.',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: 'Inter',
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const Align(
              alignment: Alignment(-0.70, 0.70),
              child: Text(
                'Did you get it?',
                style: TextStyle(
                  fontFamily: 'Inter',
                  fontSize: 14,
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
                    MaterialPageRoute(builder: (context) => const ReviewCompletePage()),
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
                    MaterialPageRoute(builder: (context) => const ReviewCompletePage()),
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
            )
          ]
        )
      )
      );
  }
  }

class ReviewCompletePage extends StatelessWidget {
  const ReviewCompletePage({Key? key}) : super(key: key);

@override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF6493A5),
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
                        fontFamily: 'Inter',
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: const Alignment(1.20, -1.00),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.asset(
                      'welcome.png',
                      width: 155,
                      height: 185,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Align(
                  alignment: const Alignment(-1.24, -0.85),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.asset(
                      'confetti.png',
                      width: 184,
                      height: 78,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Align(
                  alignment: const Alignment(1.22, -0.34),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.asset(
                      'confetti.png',
                      width: 184,
                      height: 78,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const Align(
                  alignment: Alignment(0.00, 0.23),
                  child: Text(
                    'Score Summary',
                    style: TextStyle(
                      fontFamily: 'Readex Pro',
                      fontSize: 25,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                const Align(
                  alignment: Alignment(0.04, 0.44),
                  child: Text(
                    'CORRECT: 2',
                    style: TextStyle(
                      fontFamily: 'Inter',
                      color: Color(0xFF0CDF4C),
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const Align(
                  alignment: Alignment(0.05, 0.62),
                  child: Text(
                    'WRONG: 1',
                    style: TextStyle(
                      fontFamily: 'Inter',
                      color: Color.fromARGB(255, 255, 89, 100),
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                            Align(
              alignment: const Alignment(0.049, 1.25),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                  context,
                    MaterialPageRoute(builder: (context) => const SecondPage()),
                    );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromRGBO(100, 147, 165, 100),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Text('Done'),
              ),
            )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
