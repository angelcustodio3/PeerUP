import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'dart:async';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Your App Title',
      home: ProgressPage(),
    );
  }
}

class ProgressPage extends StatefulWidget {
  @override
  _ProgressPageState createState() => _ProgressPageState();
}

class _ProgressPageState extends State<ProgressPage> {
  late Timer _timer;
  DateTime? lastUsedDate;

  @override
  void initState() {
    super.initState();
    _loadLastUsedDate();
    _startTimer();
  }

  void _loadLastUsedDate() {
    // Load the last used date from storage (you might use shared_preferences or other storage solutions)
    // For now, let's use a placeholder value of null
    // Replace this with actual logic to load the last used date from your storage solution
    lastUsedDate = null; // Replace this line
  }

  void _startTimer() {
    // Timer that updates every second
    _timer = Timer.periodic(Duration(seconds: 1), (Timer timer) {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _timer.cancel(); // Cancel the timer when the widget is disposed
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Progress Page'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Timer Section
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                _formattedTime(),
                style: TextStyle(fontSize: 24),
              ),
            ),

            // Calendar Section
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                _markedDays(),
                style: TextStyle(fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }

  String _formattedTime() {
    if (lastUsedDate == null) {
      return 'Time Spent: 0:00:00';
    }

    Duration timeDifference = DateTime.now().difference(lastUsedDate!);
    int hours = timeDifference.inHours;
    int minutes = (timeDifference.inMinutes % 60);
    int seconds = (timeDifference.inSeconds % 60);

    return 'Time Spent: $hours:$minutes:$seconds';
  }

  String _markedDays() {
    if (lastUsedDate == null) {
      return 'No days marked on the calendar';
    }

    String formattedDate = DateFormat.yMd().format(lastUsedDate!);
    return 'Marked Days: $formattedDate';
  }
}
