import 'package:flutter/material.dart';

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
      home: FirstPage(), // Display the FirstPage initially
    );
  }
}

class FirstPage extends StatefulWidget {
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

class SecondPage extends StatefulWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flashcard Sets'),
      ),
      body: Column(
        children: [
          Stack(children: [
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SecondPage(),
                  ),
                );
              },
              child: Card(
                child: Column(
                  children: [
                    ListTile(
                      title: const Text('CMSC 128'),
                      subtitle: const Text('Flashcard set for 1st LE'),
                      trailing: GestureDetector(
                        onTap: () {
                          _showOptionsDialog(context);
                        },
                        child: const Icon(Icons.more_vert),
                      ),
                    ),
                    Align(
                        alignment: const FractionalOffset(0.035, 0.20),
                        child: ElevatedButton(
                          // Practice button for the second flashcard set
                          onPressed: () {
                            _showPracticeOptionsDialog(context);
                          },
                          child: const Text('Practice'),
                        )),
                  ],
                ),
              ),
            ),
          ])
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
            SimpleDialogOption(
              onPressed: () {
                // Add code for the "Edit" option
                Navigator.pop(context);
              },
              child: const Text('Edit'),
            ),
            SimpleDialogOption(
              onPressed: () {
                // Add code for the "Remove" option
                Navigator.pop(context);
              },
              child: const Text('Remove'),
            ),
          ],
        );
      },
    );
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
                  Text('Basic Flashcard Review',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                  Text('Classic Flashcard Method',
                      style: TextStyle(fontSize: 14, color: Colors.grey)),
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
                  Text('Multiple Choice',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                  Text('select the correct answer',
                      style: TextStyle(fontSize: 14, color: Colors.grey)),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}

class AddCard extends StatelessWidget {
  final answerController = TextEditingController();
  final questionController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
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
                    // Save flashcards in backend and go back to main flashcard page
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
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
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
          )),
    );
  }
}

class FourthPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          // actions: []
          ),
      body: const Column(children: []),
    );
  }
}
