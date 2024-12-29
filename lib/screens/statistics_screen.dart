import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/habits_provider.dart';
import '../widgets/habit_progress_chart.dart';
import '../widgets/completion_rate_card.dart';

class StatisticsScreen extends StatelessWidget {
  const StatisticsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Statistics'),
      ),
      body: Consumer<HabitsProvider>(
        builder: (context, habitsProvider, child) {
          final habits = habitsProvider.habits;

          if (habits.isEmpty) {
            return const Center(
              child: Text('Add habits to see your statistics'),
            );
          }

          return ListView(
            padding: const EdgeInsets.all(16),
            children: const [
              CompletionRateCard(),
              SizedBox(height: 16),
              HabitProgressChart(),
            ],
          );
        },
      ),
    );
  }
}
