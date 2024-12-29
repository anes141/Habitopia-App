import 'package:hive/hive.dart';

part 'habit.g.dart';

@HiveType(typeId: 1)
class Habit {
  @HiveField(0)
  String id;

  @HiveField(1)
  String title;

  @HiveField(2)
  String description;

  @HiveField(3)
  final List<DateTime> completedDates;
  Habit(
      {required this.id,
      required this.title,
      required this.description,
      required this.completedDates});

  bool isCompletedToday() {
    final today = DateTime.now();
    return completedDates.any((date) =>
        date.year == today.year &&
        date.month == today.month &&
        date.day == today.day);
  }
}
