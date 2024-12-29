import 'package:flutter/material.dart';
import 'package:habit_tracker/auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';
import '../theme/theme_provider.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  Future<void> signOut() async {
    await Auth().signOut();
  }

  Widget _signOutButton() {
    return ElevatedButton(
      onPressed: signOut,
      child: const Text('Sign Out'),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: ListView(
        children: [
          Consumer<ThemeProvider>(
            builder: (context, themeProvider, _) {
              return SwitchListTile(
                title: const Text('Dark Mode'),
                subtitle: const Text('Toggle dark theme'),
                value: themeProvider.themeMode == ThemeMode.dark,
                onChanged: (_) => themeProvider.toggleTheme(),
              );
            },
          ),
          _signOutButton(),
        ],
      ),
    );
  }
}
