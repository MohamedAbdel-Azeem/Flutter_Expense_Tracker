import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../models/expense.dart';

class ExpenseItem extends StatefulWidget {
  const ExpenseItem(this.expense, {super.key});

  final Expense expense;

  @override
  State<ExpenseItem> createState() {
    return _ExpenseItemState();
  }
}

class _ExpenseItemState extends State<ExpenseItem> {
  bool isExpanded = false;

  Icon getExtendIcon() {
    if (!isExpanded) {
      return const Icon(Icons.keyboard_arrow_down_outlined);
    }
      return const Icon(Icons.keyboard_arrow_up_outlined);
  }

  Text getDescriptionText(String str){
    if (str == ""){
       str = "There's no description";
       return Text(str , style: const TextStyle(fontSize: 15 , color: Colors.white70),);
    }
    return Text(str , style: const TextStyle(fontSize: 17),);
  }

  @override
  Widget build(BuildContext context) {
    final Expense expense = widget.expense;

    return Card(
        child: Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 16,
      ),
      child: Column(
        //crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                expense.title,
                style: const TextStyle(fontSize: 19),
              ),
              const Spacer(),
              IconButton(onPressed: () {
                setState(() {
                  isExpanded = !isExpanded;
                });
              }, icon: getExtendIcon()),
            ],
          ),
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
          isExpanded? const SizedBox(height: 20)  : const SizedBox(height: 0,),
          isExpanded?  getDescriptionText(expense.description)  : const SizedBox(height: 0,),
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
