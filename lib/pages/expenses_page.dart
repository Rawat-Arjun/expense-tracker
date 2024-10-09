import 'package:expense_tracker/models/expense_model.dart';
import 'package:expense_tracker/pages/add_new_expense.dart';
import 'package:expense_tracker/widgets/chart.dart';
import 'package:expense_tracker/widgets/expenses_list.dart';
import 'package:flutter/material.dart';

class ExpensesPage extends StatefulWidget {
  const ExpensesPage({super.key});
  @override
  State<ExpensesPage> createState() => _ExpenseState();
}

class _ExpenseState extends State<ExpensesPage> {
  final List<ExpenseModel> _registeredExpenses = [
    ExpenseModel(
      title: 'Food Expense',
      amount: 299,
      date: DateTime.now(),
      category: Category.food,
    ),
  ];

  void _openAddExpenseOverlay() {
    showModalBottomSheet(
      useSafeArea: true,
      isScrollControlled: true,
      context: context,
      builder: (ctx) {
        return AddNewExpense(
          onAddExpenseToExpensesPage: _addExpenseToExpensesPage,
        );
      },
    );
  }

  void _addExpenseToExpensesPage(ExpenseModel expense) {
    setState(() {
      _registeredExpenses.add(expense);
    });
  }

  void _deleteExpenseToExpensesPage(ExpenseModel expense) {
    final expenseIndex = _registeredExpenses.indexOf(expense);
    setState(() {
      _registeredExpenses.remove(expense);
    });
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        action: SnackBarAction(
          label: 'Undo',
          onPressed: () {
            setState(() {
              _registeredExpenses.insert(expenseIndex, expense);
            });
          },
        ),
        duration: const Duration(seconds: 5),
        content: const Text('Expense Deleted !'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var mainContent = _registeredExpenses.isEmpty
        ? const Expanded(
            child: Center(
              child: Text('Add Some Data ...'),
            ),
          )
        : Expanded(
            child: ExpensesList(
                expenses: _registeredExpenses,
                onDeleteExpenseToExpensesPage: _deleteExpenseToExpensesPage),
          );
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Expense Tracker'),
        actions: [
          IconButton(
            onPressed: _openAddExpenseOverlay,
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: width < 600
          ? Column(
              children: [
                Chart(expenses: _registeredExpenses),
                mainContent,
              ],
            )
          : Row(
              children: [
                Expanded(
                  child: Chart(
                    expenses: _registeredExpenses,
                  ),
                ),
                mainContent,
              ],
            ),
    );
  }
}
