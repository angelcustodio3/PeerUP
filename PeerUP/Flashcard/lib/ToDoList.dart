// ignore_for_file: library_private_types_in_public_api, unused_import, file_names

import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';  //dependency: intl: ^0.17.0

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyPage(),
    );
  }
}

class MyPage extends StatelessWidget {
  const MyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:const Color(0xFF6493A5),
        title: const Text('Timer and To-Do List'),
      ),
      body: const Column(
        children: [
          TimerWidget(),
          Expanded(
            child: TodoListWidget(),
          ),
        ],
      ),
    );
  }
}

class TimerWidget extends StatefulWidget {
  const TimerWidget({super.key});

  @override
  _TimerWidgetState createState() => _TimerWidgetState();
}

class _TimerWidgetState extends State<TimerWidget> {
  int seconds = 0;
  bool isRunning = false;

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  void startTimer() {
    setState(() {
      isRunning = true;
    });
    Future.doWhile(() async {
      if (!isRunning) {
        return false;
      }
      await Future.delayed(const Duration(seconds: 1));
      setState(() {
        seconds++;
      });
      return true;
    });
  }

  void stopTimer() {
    setState(() {
      isRunning = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final hours = (seconds ~/ 3600).toString().padLeft(2, '0');
    final minutes = ((seconds ~/ 60) % 60).toString().padLeft(2, '0');
    final remainingSeconds = (seconds % 60).toString().padLeft(2, '0');

    return Padding(
      padding: const EdgeInsets.only(top:16.0), // Add padding around the timer
    child: Column(
      children: [
        Text(
          '$hours:$minutes:$remainingSeconds',
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        /*ElevatedButton(
          onPressed: isRunning ? stopTimer : startTimer,
          child: Text(
            isRunning ? 'Stop' : 'Start',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),*/
        const Padding(
          padding: EdgeInsets.all(25.0), // Add padding around the text
          child: Text(
            'CMSC 128',
            style: TextStyle(
              fontSize: 26, // Font size
              color: Colors.black, // Text color
              fontWeight: FontWeight.bold, // Font weight
            ),
          ),
        ),
      ],
    ),
    );
  }
}

class TodoListWidget extends StatefulWidget {
  const TodoListWidget({super.key});

  @override
  _TodoListWidgetState createState() => _TodoListWidgetState();
}

class _TodoListWidgetState extends State<TodoListWidget> {
  List<TodoItem> todoItems = [];
  TextEditingController controller = TextEditingController();
  bool isInputVisible = false;

  @override
  void initState() {
    super.initState();

    // Initialize the list with pre-populated to-do items
    todoItems = [
      TodoItem("Task 1", false),
      TodoItem("Task 2", true),
      TodoItem("Task 3", false),
    ];
  }

  void addTodoItem() {
    String text = controller.text.trim();
    if (text.isNotEmpty) {
      setState(() {
        todoItems.add(TodoItem(text, false));
        controller.clear();
      });
    }
  }

  void toggleTodoItem(int index) {
    setState(() {
      todoItems[index].isDone = !todoItems[index].isDone;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            itemCount: todoItems.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(
                  todoItems[index].text,
                  style: TextStyle(
                    fontSize: 15, // Font size
                    fontWeight: FontWeight.normal, // Font weight
                    decoration: todoItems[index].isDone
                        ? TextDecoration.lineThrough
                        : TextDecoration.none,
                    color: todoItems[index].isDone ? Colors.grey : Colors.black,
                  ),
                ),
                leading: Checkbox(
                  value: todoItems[index].isDone,
                  onChanged: (value) {
                    toggleTodoItem(index);
                  },
                ),
              );
            },
          ),
        ),
Padding(
  padding: const EdgeInsets.all(16.0),
  child: Container(
    decoration: BoxDecoration(
      color: const Color(0x706493A5), // Set the background color
      // border: Border.all(color: Colors.blue, width: 2),
      borderRadius: BorderRadius.circular(12),
    ),
    child: Row(
      children: [
        IconButton(
          icon: const Icon(Icons.add),
          onPressed: addTodoItem,
          color: Colors.black,
        ),
        Expanded(
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: TextField(
              controller: controller,
              decoration: const InputDecoration(
                hintText: 'Add a new task',
                border: InputBorder.none,
              ),
              style: const TextStyle(
                fontSize: 16,
                color: Colors.black,
              ),
              onSubmitted: (_) {
                addTodoItem();
              },
            ),
          ),
        ),
      ],
    ),
  ),
)

],
    );
  }
}

class TodoItem {
  final String text;
  bool isDone;

  TodoItem(this.text, this.isDone);
}
