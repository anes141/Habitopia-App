//import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc/bloc.dart';
import 'package:habit_tracker/state_management/habits_bloc/habit_event.dart';
import 'package:habit_tracker/state_management/habits_bloc/habit_state.dart';
import 'package:hive/hive.dart';
import '../../models/habit.dart';
import '../abstract_bloc/abstract_app_event.dart';
import '../abstract_bloc/abstract_app_state.dart';


// Events


class LoadHabits extends HabitEvent {}

class AddHabit extends HabitEvent {
  final Habit habit;
  AddHabit(this.habit);
}

class UpdateHabit extends HabitEvent {
  final Habit habit;
  UpdateHabit(this.habit);
}

class MarkHabitCompletedToday extends HabitEvent {
  final Habit habit;
  MarkHabitCompletedToday(this.habit);
}

class DeleteHabit extends HabitEvent {
  final Habit habit;
  DeleteHabit(this.habit);
}

// States
class HabitLoading extends HabitState {
  HabitLoading({required bool isLoading}) : super(isLoading: isLoading);
}

class HabitLoaded extends HabitState {
  final List<Habit> habits;
  HabitLoaded(this.habits) : super(isLoading: false);
}

// Bloc
class HabitBlocProvider extends Bloc<HabitEvent, HabitState> {
  final Box<Habit> habitBox;

  HabitBlocProvider(this.habitBox) : super(HabitLoading(isLoading: true)) {
    on<HabitEventInitalization>((event, emit) async {
      emit(const HabitInitializationState(isLoading: false));
    });

    on<LoadHabits>((event, emit) async {
      await Future.delayed(Duration(seconds: 1));
      final habits = habitBox.values.toList();
      emit(HabitLoaded(habits));
    });

    on<AddHabit>((event, emit) async {
      await habitBox.put(event.habit.id, event.habit);
      final habits = habitBox.values.toList();
      emit(HabitLoaded(habits));
      print('Habits from Box: ${habitBox.values.toList()}');
    });

    on<UpdateHabit>((event, emit) async {
      await habitBox.put(event.habit.id, event.habit);
      final habits = habitBox.values.toList();
      emit(HabitLoaded(habits));
      print('Habits from Box: ${habitBox.values.toList()}');
    });

    on<MarkHabitCompletedToday>((event, emit) async {
      final today = DateTime.now();
      final habit = event.habit;

      if (!habit.completedDates.any((date) =>
      date.year == today.year &&
          date.month == today.month &&
          date.day == today.day)) {
        habit.completedDates.add(today);
        await habitBox.put(habit.id, habit); // Update directly in Hive
      }

      final habits = habitBox.values.toList();
      emit(HabitLoaded(habits));
    });

    on<DeleteHabit>((event, emit) async {
      await habitBox.delete(event.habit.id); // Use the habit ID to delete
      final habits = habitBox.values.toList();
      emit(HabitLoaded(habits));
      print('Habits from Box: ${habitBox.values.toList()}');
    });
  }
}
