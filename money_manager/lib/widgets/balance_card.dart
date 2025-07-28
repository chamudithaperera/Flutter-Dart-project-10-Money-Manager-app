import 'package:flutter/material.dart';

class BalanceCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String amount;
  final Color iconColor;
  final Color backgroundColor;
  final Color textColor;

  const BalanceCard({
    super.key,
    required this.icon,
    required this.title,
    required this.amount,
    this.iconColor = Colors.green,
    this.backgroundColor = Colors.white,
    this.textColor = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      decoration: BoxDecoration(
        color: backgroundColor.withOpacity(0.18),
        borderRadius: BorderRadius.circular(16),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      child: Row(
        children: [
          Container(
            decoration: BoxDecoration(
              color: backgroundColor.withOpacity(0.32),
              shape: BoxShape.circle,
            ),
            padding: const EdgeInsets.all(7),
            child: Icon(icon, color: iconColor, size: 20),
          ),
          const SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                  color: textColor,
                ),
              ),
              Text(
                amount,
                style: TextStyle(
                  fontSize: 13, // slightly smaller to help prevent overflow
                  fontWeight: FontWeight.bold,
                  color: textColor,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
