import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/habits_provider.dart';

class CompletionRateCard extends StatelessWidget {
  const CompletionRateCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Today\'s Progress',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            Consumer<HabitsProvider>(
              builder: (context, habitsProvider, _) {
                final habits = habitsProvider.habits;
                final completedHabits = habits.where((h) => h.isCompletedToday()).length;
                final completionRate = habits.isEmpty ? 0 : (completedHabits / habits.length * 100);

                return Column(
                  children: [
                    LinearProgressIndicator(
                      value: completionRate / 100,
                      minHeight: 10,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      '${completionRate.toStringAsFixed(1)}% Complete',
                      style: const TextStyle(fontSize: 16),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      '$completedHabits/${habits.length} habits completed',
                      style: const TextStyle(color: Colors.grey),
                    ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}