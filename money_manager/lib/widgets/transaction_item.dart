import 'package:flutter/material.dart';
import '../app_colors.dart';
import 'TransactionDetailPopup.dart';
// Import the popup widget

class TransactionItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final String time;
  final String amount;
  final bool isExpense;

  const TransactionItem({
    super.key,
    required this.icon,
    required this.title,
    required this.time,
    required this.amount,
    this.isExpense = true,
  });

  void _showDetailPopup(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder:
          (_) => TransactionDetailPopup(
            icon: icon,
            title: title,
            time: time,
            amount: amount,
            isExpense: isExpense,
          ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _showDetailPopup(context),
      child: Container(
        height: 72,
        width: double.infinity,
        margin: const EdgeInsets.symmetric(vertical: 8),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.06),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          children: [
            // Leading icon in rounded square
            Container(
              width: 44,
              height: 44,
              decoration: BoxDecoration(
                color: AppColors.veryLightGray,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Center(
                child: Icon(icon, color: AppColors.primaryOrange, size: 28),
              ),
            ),
            const SizedBox(width: 16),
            // Title and subtitle
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 17,
                      color: AppColors.darkBlue,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    time,
                    style: TextStyle(
                      fontSize: 14,
                      color: AppColors.darkBlue.withOpacity(0.5),
                    ),
                  ),
                ],
              ),
            ),
            // Amount
            Text(
              amount,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 17,
                color: isExpense ? Colors.red : Colors.green,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
