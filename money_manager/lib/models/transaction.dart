import 'package:flutter/material.dart';

class Transaction {
  final IconData icon;
  final String title;
  final String time;
  final String amount;
  final bool isExpense;

  const Transaction({
    required this.icon,
    required this.title,
    required this.time,
    required this.amount,
    required this.isExpense,
  });
}
