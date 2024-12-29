import 'package:flutter/material.dart';
import '../widgets/habit_list.dart';
import '../widgets/add_habit_dialog.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Habits'),
      ),
      body: const HabitList(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) => const AddHabitDialog(),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
