import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyService extends ChangeNotifier {
  late SharedPreferences sharedPreferences;

  // ThemeMode variable (no longer reactive with GetX's .obs)
  ThemeMode themeMode = ThemeMode.system;

  Future<MyService> init() async {
    sharedPreferences = await SharedPreferences.getInstance();

    // Load the saved theme mode
    loadThemeMode();

    return this;
  }

  // Method to load the theme mode from SharedPreferences
  void loadThemeMode() {
    final themeIndex =
        sharedPreferences.getInt('themeMode') ?? 0; // Default to system mode
    themeMode = ThemeMode.values[themeIndex];
    notifyListeners(); // Notify listeners about the change
  }

  // Method to save the theme mode to SharedPreferences and update the variable
  Future<void> saveThemeMode(ThemeMode newThemeMode) async {
    themeMode = newThemeMode;
    await sharedPreferences.setInt('themeMode', newThemeMode.index);
    notifyListeners(); // Notify listeners about the change
  }
}
