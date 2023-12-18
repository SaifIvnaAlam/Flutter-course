import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:counter/Domain/todo_model.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController todoController = TextEditingController();

  List<TodoModel> myTodos = [
    TodoModel(title: "What is test"),
    TodoModel(title: "Need Help in DotNet"),
    TodoModel(title: "Testing the Todo App"),
    TodoModel(title: "Need to Focus"),
    TodoModel(title: "Need to Focus"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            //Show List of Todo
            SizedBox(
              height: 500,
              child: ListView.builder(
                itemCount: myTodos.length,
                itemBuilder: (context, index) {
                  TodoModel todo = myTodos[index];
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      color: Colors.amber,
                      child: ListTile(
                        title: Text(todo.title),
                        leading: const Icon(Icons.check),
                        titleAlignment: ListTileTitleAlignment.center,
                        trailing: const Icon(Icons.delete),
                      ),
                    ),
                  );
                },
              ),
            ),
//Create todo

            Center(
              child: Container(
                width: 400,
                color: Colors.grey,
                child: TextField(
                  controller: todoController,
                  decoration: const InputDecoration(labelText: "Create to-do"),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              height: 40,
              width: 200,
              color: Colors.amber,
              child: MaterialButton(
                onPressed: () {
                  final todo = TodoModel(title: todoController.text);
                  log(todo.title);
                  setState(() {
                    myTodos.add(todo);
                  });
                  todoController.clear();
                },
                child: const Text('Create Todo'),
              ),
            ),
            const SizedBox(
              height: 10,
            )
          ],
        ),
      ),
    );
  }
}
