import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import 'package:intl/intl.dart';

final formatter = DateFormat.Md();

const uuid = Uuid();

enum Category { leisure, insurance, travel, streaming }

const categoryIcons = {
  Category.leisure: Icons.movie,
  Category.insurance: Icons.attach_money,
  Category.travel: Icons.flight_takeoff,
  Category.streaming: Icons.live_tv,
};

class Expense {
  Expense({
    required this.title,
    required this.amount,
    required this.date,
    required this.category,
  }) : id = uuid.v4();

  final String id;
  final DateTime date;
  final String title;
  final double amount; //1.99
  final Category category;

  String get formattedDate {
    return formatter.format(date);
  }
}

class ExpenseBucket {
  const ExpenseBucket({
    required this.category,
    required this.expenses,
  });

  ExpenseBucket.forCategory(List<Expense> allExpenses, this.category)
      : expenses = allExpenses
            .where((expense) => expense.category == category)
            .toList();

  final Category category;
  final List<Expense> expenses;

  double get totalExpenses {
    double total = 0.0;

    for (final expense in expenses) {
      total += expense.amount;
    }
    return total;
  }
}
