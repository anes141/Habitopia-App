import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/habits_provider.dart';

class HabitProgressChart extends StatelessWidget {
  const HabitProgressChart({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Weekly Overview',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            Consumer<HabitsProvider>(
              builder: (context, habitsProvider, _) {
                final habits = habitsProvider.habits;
                return SizedBox(
                  height: 200,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: List.generate(7, (index) {
                      final date =
                          DateTime.now().subtract(Duration(days: 6 - index));
                      final dayCompletions = habits.where((habit) {
                        return habit.completedDates.any((completedDate) =>
                            completedDate.year == date.year &&
                            completedDate.month == date.month &&
                            completedDate.day == date.day);
                      }).length;

                      final percentage =
                          habits.isEmpty ? 0.0 : dayCompletions / habits.length;

                      return Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text('${(percentage * 100).toInt()}%'),
                          const SizedBox(height: 8),
                          Container(
                            width: 30,
                            height: 140 * percentage,
                            decoration: BoxDecoration(
                              color: Theme.of(context).primaryColor,
                              borderRadius: BorderRadius.circular(4),
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            [
                              'Mon',
                              'Tue',
                              'Wed',
                              'Thu',
                              'Fri',
                              'Sat',
                              'Sun'
                            ][date.weekday - 1],
                            style: const TextStyle(fontSize: 12),
                          ),
                        ],
                      );
                    }),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
