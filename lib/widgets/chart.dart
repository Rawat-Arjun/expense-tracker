import 'package:expense_tracker/models/expense_model.dart';
import 'package:expense_tracker/widgets/bar_chart.dart';
import 'package:flutter/material.dart';

class Chart extends StatelessWidget {
  const Chart({
    super.key,
    required this.expenses,
  });

  final List<ExpenseModel> expenses;

  List<ExpenseChart> get charts {
    return [
      ExpenseChart.forCategory(expenses, Category.food),
      ExpenseChart.forCategory(expenses, Category.leisure),
      ExpenseChart.forCategory(expenses, Category.travel),
      ExpenseChart.forCategory(expenses, Category.work),
    ];
  }

  double get maxTotalExpense {
    double maxTotalExpense = 0;

    for (final chart in charts) {
      if (chart.totalExpenses > maxTotalExpense) {
        maxTotalExpense = chart.totalExpenses;
      }
    }
    return maxTotalExpense;
  }

  @override
  Widget build(BuildContext context) {
    final isDarkMode =
        MediaQuery.of(context).platformBrightness == Brightness.dark;
    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
      width: double.infinity,
      height: 200,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        gradient: LinearGradient(
          colors: [
            Theme.of(context).colorScheme.primary.withOpacity(0.3),
            Theme.of(context).colorScheme.primary.withOpacity(0.0),
          ],
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
        ),
      ),
      child: Column(
        children: [
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                for (final chart in charts)
                  BarChart(
                    fill: chart.totalExpenses == 0
                        ? 0
                        : chart.totalExpenses / maxTotalExpense,
                  ),
              ],
            ),
          ),
          const SizedBox(height: 12),
          Row(
            children: charts
                .map(
                  (chart) => Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 4),
                      child: Icon(
                        categoryIcons[chart.category],
                        color: isDarkMode
                            ? Theme.of(context).colorScheme.secondary
                            : Theme.of(context)
                                .colorScheme
                                .primary
                                .withOpacity(0.6),
                      ),
                    ),
                  ),
                )
                .toList(),
          ),
        ],
      ),
    );
  }
}
