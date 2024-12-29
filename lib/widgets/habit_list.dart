import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/habits_provider.dart';
import 'habit_tile.dart';

class HabitList extends StatelessWidget {
  const HabitList({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<HabitsProvider>(
      builder: (context, habitsProvider, child) {
        final habits = habitsProvider.habits;
        
        if (habits.isEmpty) {
          return const Center(
            child: Text('No habits yet. Add one to get started!'),
          );
        }

        return ListView.builder(
          itemCount: habits.length,
          itemBuilder: (context, index) {
            final habit = habits[index];
            return HabitTile(habit: habit);
          },
        );
      },
    );
  }
}