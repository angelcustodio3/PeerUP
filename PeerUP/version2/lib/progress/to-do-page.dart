import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyPage(),
    );
  }
}

class MyPage extends StatelessWidget {
  const MyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFFAEBD2),
        title: const Center(
          child: Text(
            'Tasks',
            style: TextStyle(
              color: Color(0xFF333232),
              fontFamily: 'Poppins',
              fontSize: 20,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            child: const Expanded(
              child: TodoListWidget(),
            ),
          )
        ],
      ),
    );
  }
}

class TodoListWidget extends StatefulWidget {
  const TodoListWidget({Key? key}) : super(key: key);

  @override
  _TodoListWidgetState createState() => _TodoListWidgetState();
}

class _TodoListWidgetState extends State<TodoListWidget> {
  List<TodoItem> todoItems = [];
  TextEditingController controller = TextEditingController();

  @override
  void initState() {
    super.initState();

    // Initialize the list with pre-populated to-do items
    todoItems = [
      // TodoItem("Task 1", false),
      // TodoItem("Task 2", true),
      // TodoItem("Task 3", false),
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
      bool isChecked = !todoItems[index].isDone;
      todoItems[index].isDone = isChecked;

      // If the task is done, wait for 0.5 seconds, then remove it from the list
      if (isChecked) {
        Future.delayed(const Duration(milliseconds: 500), () {
          setState(() {
            todoItems.removeAt(index);
          });
        });
      }
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
                    fontSize: 14, // Modified font size
                    fontWeight: FontWeight.normal,
                    decoration: todoItems[index].isDone
                        ? TextDecoration.lineThrough
                        : TextDecoration.none,
                    color: todoItems[index].isDone ? Colors.grey : Colors.black,
                    fontFamily: 'Poppins', // Added Poppins font
                  ),
                ),
                leading: Checkbox(
                  value: todoItems[index].isDone,
                  onChanged: (value) {
                    toggleTodoItem(index);
                  },
                  activeColor: Color(0xFF064147), // Modified checkbox color
                ),
              );
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Container(
            decoration: BoxDecoration(
              color: const Color(0x7081B29A),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.add_rounded),
                  onPressed: addTodoItem,
                  color: Colors.black,
                ),
                SizedBox(width: 8), // Increased space
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
                        fontFamily: 'Poppins', // Added Poppins font
                      ),
                      textAlign: TextAlign.left, // Centered text
                      onSubmitted: (_) {
                        addTodoItem();
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class TodoItem {
  final String text;
  bool isDone;

  TodoItem(this.text, this.isDone);
}
