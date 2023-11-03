import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyPage(),
    );
  }
}

class MyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Timer and To-Do List'),
      ),
      body: Column(
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
  @override
  _TimerWidgetState createState() => _TimerWidgetState();
}

class _TimerWidgetState extends State<TimerWidget> {
  int seconds = 0;
  bool isRunning = false;

  @override
  void initState() {
    super.initState();
    startTimer(); // Start the timer when the page is loaded
  }

  void startTimer() {
    setState(() {
      isRunning = true;
    });
    Future.doWhile(() async {
      if (!isRunning) {
        return false;
      }
      await Future.delayed(Duration(seconds: 1));
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
    return Column(
      children: [
        Text(
          'Timer: ${seconds}s',
          style: TextStyle(
            fontSize: 24, // Font size
            fontWeight: FontWeight.bold, // Font weight
            color: Colors.blue, // Text color
          ),
        ),
        ElevatedButton(
          onPressed: isRunning ? stopTimer : startTimer,
          child: Text(
            isRunning ? 'Stop' : 'Start',
            style: TextStyle(
              fontSize: 18, // Font size
              fontWeight: FontWeight.bold, // Font weight
            ),
          ),
        ),
      ],
    );
  }
}

class TodoListWidget extends StatefulWidget {
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
                    fontSize: 18, // Font size
                    fontWeight: FontWeight.bold, // Font weight
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
  padding: EdgeInsets.all(16.0),
  child: Container(
    decoration: BoxDecoration(
      border: Border.all(color: Colors.black, width: 1),
      borderRadius: BorderRadius.circular(12),
    ),
    child: Row(
      children: [
        Expanded(
          child: Container( // Wrap the text with a Container
            padding: EdgeInsets.symmetric(vertical: 10.0), // Add vertical padding
            child: TextField(
              controller: controller,
              decoration: InputDecoration(
                hintText: 'Add a new item...',
                border: InputBorder.none,
              ),
              style: TextStyle(
                fontSize: 16,
                color: Colors.black,
              ),
              onSubmitted: (_) {
                addTodoItem();
              },
            ),
          ),
        ),
        IconButton(
          icon: Icon(Icons.check_circle),
          onPressed: addTodoItem,
          color: Colors.blue,
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
