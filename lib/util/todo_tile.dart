import 'package:flutter/material.dart';

class ToDoTile extends StatelessWidget {
  final String taskName;
  final bool isDone;
  VoidCallback delete;
  Function(bool?)? onChanged;

  ToDoTile({
    super.key,
    required this.taskName,
    required this.isDone,
    required this.onChanged,
    required this.delete,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            Checkbox(
              value: isDone,
              onChanged: onChanged,
              activeColor: Colors.purple,
              shape: const CircleBorder(side: BorderSide.none, eccentricity: 0.0),
            ),
            Text(
              taskName,
              style: TextStyle(
                color: Colors.black,
                fontSize: 18,
                decoration: isDone ? TextDecoration.lineThrough : null,
              ),
            ),
            const Spacer(),
            IconButton(
              onPressed: delete,
              icon: const Icon(
                Icons.delete,
                color: Colors.red,
              ),
            )
          ],
        ),
      ),
    );
  }
}
