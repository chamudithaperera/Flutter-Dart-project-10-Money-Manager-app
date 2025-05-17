import 'package:flutter/material.dart';
import '../models/transaction.dart';

final List<Transaction> dummyTransactions = [
  const Transaction(
    icon: Icons.fastfood,
    title: 'Food & Drink',
    time: '2.00 PM',
    amount: '-Rs 350.00',
    isExpense: true,
  ),
  const Transaction(
    icon: Icons.shopping_bag,
    title: 'Shopping',
    time: '3.30 PM',
    amount: '-Rs 1200.00',
    isExpense: true,
  ),
  const Transaction(
    icon: Icons.work,
    title: 'Salary',
    time: '10.00 AM',
    amount: '+Rs 5000.00',
    isExpense: false,
  ),
  const Transaction(
    icon: Icons.local_taxi,
    title: 'Transport',
    time: '9.15 AM',
    amount: '-Rs 250.00',
    isExpense: true,
  ),
  const Transaction(
    icon: Icons.movie,
    title: 'Entertainment',
    time: '7.00 PM',
    amount: '-Rs 800.00',
    isExpense: true,
  ),
];
