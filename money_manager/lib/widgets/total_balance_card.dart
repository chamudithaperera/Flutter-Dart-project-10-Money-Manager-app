import 'package:flutter/material.dart';
import '../app_colors.dart';
import 'balance_card.dart';

class TotalBalanceCard extends StatelessWidget {
  final String totalBalance;
  final String income;
  final String expense;

  const TotalBalanceCard({
    super.key,
    required this.totalBalance,
    required this.income,
    required this.expense,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.primaryOrange,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: AppColors.primaryOrange.withOpacity(0.10),
            blurRadius: 18,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Total Balance',
            style: TextStyle(
              fontSize: 18,
              color: Colors.white,
              fontWeight: FontWeight.w500,
              letterSpacing: 1,
            ),
          ),
          Text(
            totalBalance,
            style: TextStyle(
              fontSize: 34,
              color: Colors.white,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 24),
          Row(
            children: [
              // Income
              Expanded(
                child: BalanceCard(
                  icon: Icons.arrow_downward,
                  title: 'Income',
                  amount: income,
                  iconColor: Colors.green,
                  backgroundColor: Colors.white,
                  textColor: Colors.white,
                ),
              ),
              const SizedBox(width: 14),
              // Expense
              Expanded(
                child: BalanceCard(
                  icon: Icons.arrow_upward,
                  title: 'Expense',
                  amount: expense,
                  iconColor: Colors.red,
                  backgroundColor: Colors.white,
                  textColor: Colors.white,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
