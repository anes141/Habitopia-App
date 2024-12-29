import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';
import '../models/habit.dart';

class HabitsProvider extends ChangeNotifier {
  // Open the Hive box
  final Box<Habit> habitBox = Hive.box<Habit>('habitBox');
  List<Habit> get habits => [...habitBox.values];

  void addHabit(String title, String description) {
    final habit = Habit(
      id: DateTime.now().toString(),
      title: title,
      description: description,
      completedDates: [],
    );
    habitBox.put(habit.id, habit);
    notifyListeners();
  }

  void deleteHabit(String id) {
    habitBox.delete(id);
    notifyListeners();
  }

  void toggleHabitCompletion(String id) {
    final habit = habitBox.get(id);
    if (habit != null) {
      final today = DateTime.now();

      if (habit.isCompletedToday()) {
        habit.completedDates.removeWhere((date) =>
            date.year == today.year &&
            date.month == today.month &&
            date.day == today.day);
      } else {
        habit.completedDates.add(today);
      }

      habitBox.put(id, habit);
      notifyListeners();
    }
  }
}
