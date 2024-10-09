import 'package:expense_tracker/models/expense_model.dart';
import 'package:expense_tracker/widgets/expense_item.dart';
import 'package:flutter/material.dart';

class ExpensesList extends StatelessWidget {
  const ExpensesList({
    super.key,
    required this.expenses,
    required this.onDeleteExpenseToExpensesPage,
  });

  final List<ExpenseModel> expenses;
  final void Function(ExpenseModel expense) onDeleteExpenseToExpensesPage;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: expenses.length,
      itemBuilder: (context, index) => Dismissible(
        background: Container(
          color: Theme.of(context).colorScheme.error,
          margin: EdgeInsets.symmetric(
            horizontal: Theme.of(context).cardTheme.margin!.horizontal,
          ),
          child: const Icon(Icons.delete),
        ),
        key: ValueKey(expenses[index]),
        direction: DismissDirection.endToStart,
        onDismissed: (direction) => onDeleteExpenseToExpensesPage(
          expenses[index],
        ),
        child: ExpenseItem(
          expenses[index],
        ),
      ),
    );
  }
}
