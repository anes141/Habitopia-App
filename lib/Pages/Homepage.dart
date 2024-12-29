import 'package:flutter/material.dart';
import 'package:habit_tracker/components/Habit_tile.dart';

import 'statistique_page.dart';
import 'settings_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const Homepage(),
    );
  }
}

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  int _currentIndex = 0;
  final PageController _pageController = PageController();

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          _getAppBarTitle(),
          style: const TextStyle(
            color: Color(0xFF441752),
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Color(0xFFDFD7FF),
        elevation: 0,
      ),
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        children: const [
          HomePage(),
          StatistiquePage(),
          SettingsPage(),
        ],
      ),
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF7e769c), Color(0xFF7e769c)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              icon: Icon(
                Icons.home,
                color:
                    _currentIndex == 0 ? Color(0xFF65558F) : Color(0xFF441752),
              ),
              onPressed: () {
                setState(() {
                  _currentIndex = 0;
                });
                _pageController.jumpToPage(0);
              },
            ),
            IconButton(
              icon: Icon(
                Icons.bar_chart,
                color:
                    _currentIndex == 1 ? Color(0xFF65558F) : Color(0xFF441752),
              ),
              onPressed: () {
                setState(() {
                  _currentIndex = 1;
                });
                _pageController.jumpToPage(1);
              },
            ),
            IconButton(
              icon: Icon(
                Icons.settings,
                color:
                    _currentIndex == 2 ? Color(0xFF65558F) : Color(0xFF441752),
              ),
              onPressed: () {
                setState(() {
                  _currentIndex = 2;
                });
                _pageController.jumpToPage(2);
              },
            ),
          ],
        ),
      ),
    );
  }

  String _getAppBarTitle() {
    switch (_currentIndex) {
      case 0:
        return 'Habitopia';
      case 1:
        return 'Statistique';
      case 2:
        return 'Settings';
      default:
        return 'Habitopia';
    }
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List habitsList = [
    ["running", false],
    ["playing", false],
  ];

  void checkBoxTrapped(bool? value, int index) {
    setState(() {
      habitsList[index][1] = value!;
    });
  }

  //create a new habit

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        // Apply gradient to the entire screen
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFCDC1FF), Color(0xFF7B7499)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: ListView.builder(
          itemCount: habitsList.length,
          padding:
              EdgeInsets.zero, // Ensures the gradient fills the entire screen
          itemBuilder: (BuildContext context, int index) {
            return HabitTile(
              HabitName: habitsList[index][0],
              habitCompleted: habitsList[index][1],
              onChanged: (value) => checkBoxTrapped(value, index),
            );
          },
        ),
      ),
    );
  }
}
