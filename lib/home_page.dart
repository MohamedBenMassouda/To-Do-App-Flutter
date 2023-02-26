import 'package:flutter/material.dart';
import 'package:to_do_app/util/dialogBox.dart';
import 'package:to_do_app/util/todo_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // Text Controller
  final _controller = TextEditingController();

  List toDoList = [
    ["Make To Do", false],
    ["idk", true],
  ];

  // Create new task
  void createNewTask() {
    showDialog(
      context: context,
      builder: (context) {
        return DialogBox(
          controller: _controller,
          onSave: () {
            setState(() {
              toDoList.add([_controller.text, false]);
            });
            Navigator.pop(context);
          },
          onCancel: () {
            Navigator.pop(context);
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(137, 37, 36, 36),
        appBar: AppBar(
          title: Column(
            children: [
              Text(
                toDoList.isEmpty ? "No Tasks" : "You have ${toDoList.length} tasks",
                style: const TextStyle(color: Colors.white)
              ),
              /*TextField(
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  icon: const Icon(Icons.search),
                  hintText: "Search",
                  hintStyle: const TextStyle(color: Colors.black),
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(40))
                ),
                style: const TextStyle(color: Colors.black),
              )*/
            ],
          ),
          backgroundColor: const Color.fromARGB(137, 37, 36, 36),
          centerTitle: true,
          toolbarHeight: 100,
          elevation: 0,
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            createNewTask();
          },
          backgroundColor: Colors.deepPurpleAccent,
          child: const Icon(Icons.add),
        ),
        body: ListView.builder(
          itemCount: toDoList.length,
          itemBuilder: (context, index) {
            return ToDoTile(
              taskName: toDoList[index][0],
              isDone: toDoList[index][1],
              onChanged: (value) {
                setState(() {
                  // toDoList[index][1] = !toDoList[index][1];
                  toDoList[index][1] = value!;
                });
              },
              delete: () {
                setState(() {
                  toDoList.removeAt(index);
                });
              },
            );
          },
        ));
  }
}
