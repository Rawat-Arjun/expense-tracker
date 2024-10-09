import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';

const uuid = Uuid();
final dateFormatter = DateFormat.yMMMEd();
final timeFormatter = DateFormat.jm();

enum Category { food, travel, leisure, work }

const categoryIcons = {
  Category.food: Icons.fastfood,
  Category.travel: Icons.flight_takeoff,
  Category.leisure: Icons.movie,
  Category.work: Icons.work
};

class ExpenseModel {
  ExpenseModel({
    required this.title,
    required this.amount,
    required this.date,
    required this.category,
  }) : id = uuid.v4();

  final String id;
  final String title;
  final double amount;
  final DateTime date;
  final Category category;

  String get formattedDate {
    return dateFormatter.format(date);
  }

  String get formattedTime {
    return timeFormatter.format(date);
  }
}

class ExpenseChart {
  const ExpenseChart({
    required this.category,
    required this.expenses,
  });

  ExpenseChart.forCategory(
    List<ExpenseModel> allExpenses,
    this.category,
  ) : expenses = allExpenses
            .where((expense) => expense.category == category)
            .toList();
  final Category category;
  final List<ExpenseModel> expenses;

  double get totalExpenses {
    double sum = 0;
    for (final expense in expenses) {
      sum = sum + expense.amount;
    }
    return sum;
  }
}
