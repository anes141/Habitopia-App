import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/habit.dart';
import '../providers/habits_provider.dart';

class HabitTile extends StatelessWidget {
  final Habit habit;

  const HabitTile({
    super.key,
    required this.habit,
  });

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: Key(habit.id),
      direction: DismissDirection.endToStart,
      background: Container(
        color: Colors.red,
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.only(right: 16),
        child: const Icon(
          Icons.delete,
          color: Colors.white,
        ),
      ),
      onDismissed: (_) {
        Provider.of<HabitsProvider>(context, listen: false)
            .deleteHabit(habit.id);
      },
      child: Card(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: ListTile(
          title: Text(habit.title),
          subtitle: Text(habit.description),
          trailing: IconButton(
            icon: Icon(
              habit.isCompletedToday()
                  ? Icons.check_circle
                  : Icons.check_circle_outline,
              color: habit.isCompletedToday() ? Colors.green : null,
            ),
            onPressed: () {
              Provider.of<HabitsProvider>(context, listen: false)
                  .toggleHabitCompletion(habit.id);
            },
          ),
        ),
      ),
    );
  }
}