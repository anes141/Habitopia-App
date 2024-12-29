import 'package:flutter/material.dart';
import 'package:habit_tracker/boxes.dart';
import 'package:habit_tracker/models/habit.dart';
import 'package:habit_tracker/state_management/habits_bloc/habit_bloc_provider.dart';
import 'package:habit_tracker/state_management/habits_bloc/habit_event.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';
import 'theme/theme_provider.dart';
import 'providers/habits_provider.dart';
import 'screens/main_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'widget_tree.dart';
import 'package:firebase_core/firebase_core.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await Hive.initFlutter();
  Hive.registerAdapter(HabitAdapter());
  await Hive.openBox('themeBox');
  var boxHabit = await Hive.openBox<Habit>('habitBox');
  print('Habits before running app: ${boxHabit.values.toList()}');

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
        ChangeNotifierProvider(create: (_) => HabitsProvider()),
      ],
      child: const HabitTrackerApp(),
    ),
  );
}

class HabitTrackerApp extends StatelessWidget {
  const HabitTrackerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<HabitBlocProvider>(
      create: (BuildContext context) =>
          HabitBlocProvider(boxHabit)..add(const HabitEventInitalization()),
      child: Consumer<ThemeProvider>(
        builder: (context, themeProvider, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Habitopia',
            theme: ThemeData.light(useMaterial3: true),
            darkTheme: ThemeData.dark(useMaterial3: true),
            themeMode: themeProvider.themeMode,
            home: const WidgetTree(),
          );
        },
      ),
    );
  }
}
