import 'package:flutter/cupertino.dart';

@immutable
abstract class HabitState {
  final bool isLoading;
  final bool? stateIsChanged;

  const HabitState({
    required this.isLoading,
    this.stateIsChanged
});
}