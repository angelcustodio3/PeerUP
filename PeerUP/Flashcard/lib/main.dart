import 'package:flutter/material.dart';

ThemeData myCustomTheme = ThemeData(
  textTheme: TextTheme(
    bodyText1: myDefaultTextStyle,
    bodyText2: myDefaultTextStyle,
  ),
  primaryColor: const Color(0xFF0FA3B1),  // Primary color
  accentColor: const Color(0xFFB5E2FA),   // Accent color
  scaffoldBackgroundColor: const Color(0xFFF9F7F3), // Background color
  backgroundColor: const Color(0xFFEDDEA4),
  buttonColor: const Color(0xFFF7A072),
  // Add more colors as needed
);

TextStyle myDefaultTextStyle = TextStyle(
  fontFamily: 'Poppins', // Use the Poppins font
  fontSize: 16.0,
  color: Colors.black, // You can change the color if needed
);


void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: myCustomTheme,
      home: FirstPage(),
    );
  }
}

class FirstPage extends StatelessWidget {
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
            const Text('PeerUP HomePage'),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SecondPage(),
                  ),
                );
              },
              child: const Text('Flashcard Technique'),
            ),
          ],
        ),
      ),
    );
  }
}

class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flashcard Sets'),
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
                      builder: (context) => ViewCard(),
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
                              child: Icon(Icons.more_vert),
                            ),
                          ],
                        ),
                      ),
                      Align(
                        alignment: const FractionalOffset(0.035, 0.20),
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Practice(),
                              ),
                            );
                          },
                          child: const Text('Practice'),
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
          SizedBox(width: 8), // Adjust the spacing between icon and text
          Text(text),
        ],
      ),
    );
  }
}

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

class AddCard extends StatelessWidget {
  final answerController = TextEditingController();
  final questionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo[300],
        actions: [
          Container(
            width: 80,
            child: IconButton(
              icon: Icon(
                Icons.check_circle,
                size: 30,
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SecondPage(),
                  ),
                );
              },
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
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
                        SizedBox(height: 5),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 8.0),
                          child: TextField(
                            controller: answerController,
                            maxLines: null,
                            decoration: InputDecoration(
                              labelText: 'Answer / Description',
                              border: OutlineInputBorder(),
                            ),
                          ),
                        ),
                        Spacer(),
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
                                    SnackBar(
                                      content: Text("Flashcard Added"),
                                      duration: Duration(seconds: 1),
                                    ),
                                  );
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
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
  @override
  _ViewCardState createState() => _ViewCardState();
}

class _ViewCardState extends State<ViewCard> {
  bool isHeartFilled = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
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
                              child: Icon(Icons.more_vert),
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
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                  child: Row(
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
                        builder: (context) => Practice(),
                      ),
                    );
                  },
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                  child: Row(
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
        SizedBox(width: 8), // Adjust the spacing between icon and text
        Text(text),
      ],
    ),
  );
}

class Practice extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xAD060606),
      appBar: AppBar(
        title: Text('Practice',
            style: TextStyle(fontFamily: 'Inter', fontWeight: FontWeight.w600)),
        actions: [
          IconButton(
            icon: Icon(Icons.close),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
      body: Center(
        child: Card(
          color: Color(0xFFE6F0F2),
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
                      builder: (context) => AnotherPage(),
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
                      builder: (context) => AnotherPage(),
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

  PracticeCard({
    required this.title,
    required this.subtitle,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        color: Color(0xFF6493A5),
        child: ListTile(
          title: Text(title,
              style:
                  TextStyle(fontFamily: 'Inter', fontWeight: FontWeight.w500)),
          subtitle: Text(subtitle,
              style:
                  TextStyle(fontFamily: 'Inter', fontWeight: FontWeight.w400)),
        ),
      ),
    );
  }
}

class AnotherPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Premium Feature'),
      ),
      body: Center(
        child: Text(
            'WOW! You have opened a Premium Feature!, access Premium to try this feature out!!'),
      ),
    );
  }
}

class PracticePageAndCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xAD060606),
      appBar: AppBar(
        title: Text('Practice',
            style: TextStyle(fontFamily: 'Inter', fontWeight: FontWeight.w600)),
        actions: [
          IconButton(
            icon: Icon(Icons.close),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height /
                2, // Half of the screen's height
            child: Card(
              child: Column(
                children: [
                  ListTile(
                    title: Text(
                      'Practice',
                      style: TextStyle(
                          fontFamily: 'Inter', fontWeight: FontWeight.w600),
                    ),
                  ),
                  PracticeCard(
                    title: 'Basic Flashcard Review',
                    subtitle: 'Create Flashcard',
                    onTap: () {
                      // Navigate to another page for Card 1
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AnotherPage(),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
          PracticeCard(
            title: 'Multiple Choice',
            subtitle: 'Select the correct answer',
            onTap: () {
              // Navigate to another page for Card 2
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AnotherPage(),
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

  PracticeCards({
    required this.title,
    required this.subtitle,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Color(0xFF6493A5),
      child: ListTile(
        title: Text(title,
            style: TextStyle(fontFamily: 'Inter', fontWeight: FontWeight.w500)),
        subtitle: Text(subtitle,
            style: TextStyle(fontFamily: 'Inter', fontWeight: FontWeight.w400)),
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
      color: Color(0xAD060606),
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
            decoration: BoxDecoration(),
            child: Row(
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
            decoration: BoxDecoration(),
            child: Row(
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
              color: Color(0xFFE6F0F2),
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
            decoration: BoxDecoration(color: Color(0xFF6493A5)),
          ),
        ),
        Positioned(
          left: 28,
          top: 238,
          child: Container(
            width: 305,
            height: 66,
            decoration: BoxDecoration(color: Color(0xFF6493A5)),
          ),
        ),
        Positioned(
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
        Positioned(
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
        Positioned(
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
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage("https://via.placeholder.com/200x225"),
                fit: BoxFit.contain,
              ),
            ),
          ),
        ),
        Positioned(
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
        Positioned(
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
            decoration: BoxDecoration(
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
