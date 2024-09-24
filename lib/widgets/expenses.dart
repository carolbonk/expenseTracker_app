import 'package:expense_tracker/widgets/new_expense.dart';
import 'package:flutter/material.dart';
import 'expenses_list/expenses_list.dart';
import '../models/expense.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() {
    return _ExpensesState();
  }
}

class _ExpensesState extends State<Expenses> {
  final List<Expense> _registeredExpenses = [
    Expense(
      title: 'Cinema',
      amount: 19.99,
      date: DateTime.now(),
      category: Category.leisure,
    ),
    Expense(
      title: 'Car insurance',
      amount: 49.99,
      date: DateTime.now(),
      category: Category.insurance,
    ),
    Expense(
      title: 'HBO max',
      amount: 19.99,
      date: DateTime.now(),
      category: Category.streaming,
    ),
  ];

  void _openAddExpenseOverlay() {
    showModalBottomSheet(
      context: context,
      builder: (ctx) => const NewExpense(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ExpenseTracker'),
        actions: [
          IconButton(
            onPressed: _openAddExpenseOverlay,
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: Column(
        children: [
          const Text('The chart'),
          Expanded(
            child: ExpensesList(expenses: _registeredExpenses),
          ),
        ],
      ),
    );
  }
}
