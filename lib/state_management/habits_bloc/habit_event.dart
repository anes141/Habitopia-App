import 'package:flutter/material.dart';
import 'package:habit_tracker/state_management/abstract_bloc/abstract_app_event.dart';
//import 'package:tp_flutter_bloc_etd/state_management/abstract_bloc/abstract_app_event.dart';

@immutable
class HabitEventInitalization implements HabitEvent {
  const HabitEventInitalization();
}

class FetchHabitEvent implements HabitEvent{
  const FetchHabitEvent();
}
