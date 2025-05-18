import 'package:flutter/material.dart';
import '../app_colors.dart';

class TransactionDetailPopup extends StatelessWidget {
  final IconData icon;
  final String title;
  final String time;
  final String amount;
  final bool isExpense;
  final String comment;
  final DateTime date;

  const TransactionDetailPopup({
    super.key,
    required this.icon,
    required this.title,
    required this.time,
    required this.amount,
    required this.isExpense,
    required this.comment,
    required this.date,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Icon
          Container(
            width: 64,
            height: 64,
            decoration: BoxDecoration(
              color: AppColors.veryLightGray,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Center(
              child: Icon(icon, color: AppColors.primaryOrange, size: 36),
            ),
          ),
          const SizedBox(height: 16),
          // Title
          Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 22,
              color: AppColors.darkBlue,
            ),
          ),
          const SizedBox(height: 8),
          // Date and Time
          Text(
            '${date.day}/${date.month}/${date.year} at $time',
            style: TextStyle(
              fontSize: 16,
              color: AppColors.darkBlue.withOpacity(0.6),
            ),
          ),
          const SizedBox(height: 24),
          // Amount
          Text(
            amount,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 28,
              color: isExpense ? Colors.red : Colors.green,
            ),
          ),
          const SizedBox(height: 24),
          // Comment
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: AppColors.veryLightGray,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Comment',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: AppColors.darkBlue,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  comment,
                  style: TextStyle(
                    fontSize: 16,
                    color: AppColors.darkBlue.withOpacity(0.8),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),
          // Close button
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () => Navigator.pop(context),
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primaryOrange,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                padding: const EdgeInsets.symmetric(vertical: 14),
              ),
              child: const Text(
                'Close',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
