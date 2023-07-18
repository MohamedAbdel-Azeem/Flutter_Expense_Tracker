import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../models/expense.dart';

class ExpenseItem extends StatelessWidget {
  const ExpenseItem(this.expense, {super.key});

  final Expense expense;

  @override
  Widget build(BuildContext context) {
    return Card(
        child: Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 16,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(expense.title,
              style: const TextStyle(fontSize: 19),),
          const SizedBox(
            height: 4,
          ), // we could have used margain
          Row(
            children: [
              Text("\$${expense.amount.toStringAsFixed(2)}"),
              // we could used .toString but toStringAsFixed takes only 2 digits after comma , \ used to diffrentiate between the two dollar signs
              const Spacer(),
              // pushes amount to the Left and the other things to the right
              Row(
                children: [
                  Icon(setIcon(expense.category)),
                  const SizedBox(width: 8),
                  Text(expense.formattedDate),
                ],
              ),
            ],
          ),
        ],
      ),
    ));
  }

  IconData setIcon(Category category) {
    if (category == Category.work) {
      return Icons.work_rounded;
    }
    if (category == Category.leisure) {
      return Icons.movie_rounded;
    }
    if (category == Category.food) {
      return Icons.fastfood_rounded;
    }
    if (category == Category.travel) {
      return Icons.flight_takeoff_rounded;
    }
    return Icons.shopping_cart_rounded;
  }
}
