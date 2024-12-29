import 'package:habit_tracker/state_management/abstract_bloc/abstract_app_state.dart';
//import 'package:tp_flutter_bloc_etd/models/meal_model.dart';
//import 'package:tp_flutter_bloc_etd/state_management/abstract_bloc/abstract_app_state.dart';

import '../../models/habit.dart';

final class HabitInitializationState extends HabitState {
  const HabitInitializationState({
    required super.isLoading,
  });
}

final class FetchHabitState extends HabitState{
  final List<Habit> fetchHabitList;
  const FetchHabitState({
    required this.fetchHabitList,
    required super.isLoading,
  });
}
