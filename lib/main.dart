import 'package:expense_tracker/constants/bright_theme.dart';
import 'package:expense_tracker/constants/dark_theme.dart';
import 'package:expense_tracker/pages/expenses_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Expense Tracker App',
      darkTheme: darkTheme,
      theme: brightTheme,
      themeMode: ThemeMode.system,
      home: const ExpensesPage(),
    );
  }
}
