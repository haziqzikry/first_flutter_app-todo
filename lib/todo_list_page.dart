import 'package:flutter/material.dart';
import 'todo.dart';

class TodoListPage extends StatefulWidget {
  const TodoListPage({super.key});

  @override
  _TodoListPageState createState() => _TodoListPageState();
}

class _TodoListPageState extends State<TodoListPage> {
  List<Todo> todos = [
    Todo(title: 'Get therapy'),
    Todo(title: 'Get a girlfriend'),
  ];

  TextEditingController controller = TextEditingController();

  void addTodo() {
    if (controller.text.isNotEmpty) {
      setState(() {
        todos.add(Todo(
          title: controller.text,
        ));
        controller.clear();
      });
    }
  }

  void toggleTodoState(int index) {
    setState(() {
      todos[index].isDone = !todos[index].isDone;
    });
  }

  void removeTodo(int index) {
    setState(() {
      todos.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TODO List'),
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: controller,
                    decoration: const InputDecoration(
                      hintText: 'Enter a task',
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                ElevatedButton(
                  onPressed: addTodo,
                  child: const Text('Add'),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: todos.length,
              itemBuilder: (context, index) {
                final todo = todos[index];
                return Dismissible(
                  key: Key(todo.title),
                  onDismissed: (direction) {
                    removeTodo(index);
                  },
                  child: ListTile(
                    onTap: () {
                      toggleTodoState(index);
                    },
                    title: Text(
                      todo.title,
                      style: TextStyle(
                        decoration:
                            todo.isDone ? TextDecoration.lineThrough : null,
                      ),
                    ),
                    leading: Checkbox(
                      value: todo.isDone,
                      onChanged: (value) {
                        toggleTodoState(index);
                      },
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
