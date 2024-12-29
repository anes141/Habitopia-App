import 'package:flutter/material.dart';

class HabitTile extends StatelessWidget {
  final String HabitName;
  final bool habitCompleted;
  final Function(bool?)? onChanged;

  const HabitTile({
    super.key,
    required this.HabitName,
    required this.habitCompleted,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        padding: EdgeInsets.all(25),
        decoration: BoxDecoration(
          color: Color(0xFFEAE5FF),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            Checkbox(value: habitCompleted, onChanged: onChanged),
            Text(
              HabitName,
              style: TextStyle(
                color: habitCompleted ? Colors.green : Color(0xff441752),
                fontSize: 20,
                decoration: habitCompleted
                    ? TextDecoration.lineThrough
                    : null, // Strikethrough if completed
              ),
            ),
          ],
        ),
      ),
    );
  }
}
