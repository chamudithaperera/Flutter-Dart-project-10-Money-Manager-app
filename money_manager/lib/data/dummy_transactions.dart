import 'package:flutter/material.dart';
import '../models/transaction.dart';

final List<Transaction> dummyTransactions = [
  Transaction(
    icon: Icons.fastfood,
    title: 'Food & Drink',
    time: '2.00 PM',
    amount: '-Rs 350.00',
    isExpense: true,
    comment: 'Lunch at restaurant',
    date: DateTime(2024, 3, 15),
  ),
  Transaction(
    icon: Icons.shopping_bag,
    title: 'Shopping',
    time: '3.30 PM',
    amount: '-Rs 1200.00',
    isExpense: true,
    comment: 'Grocery shopping',
    date: DateTime(2024, 3, 15),
  ),
  Transaction(
    icon: Icons.work,
    title: 'Salary',
    time: '10.00 AM',
    amount: '+Rs 5000.00',
    isExpense: false,
    comment: 'Monthly salary',
    date: DateTime(2024, 3, 14),
  ),
  Transaction(
    icon: Icons.local_taxi,
    title: 'Transport',
    time: '9.15 AM',
    amount: '-Rs 250.00',
    isExpense: true,
    comment: 'Taxi fare',
    date: DateTime(2024, 3, 14),
  ),
  Transaction(
    icon: Icons.movie,
    title: 'Entertainment',
    time: '7.00 PM',
    amount: '-Rs 800.00',
    isExpense: true,
    comment: 'Movie tickets',
    date: DateTime(2024, 3, 13),
  ),
];
