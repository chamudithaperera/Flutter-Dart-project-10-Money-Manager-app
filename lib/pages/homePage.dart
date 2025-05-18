import 'package:flutter/material.dart';
import '../app_colors.dart';
import '../widgets/total_balance_card.dart';
import '../widgets/transaction_item.dart';
import '../data/dummy_transactions.dart';
import '../widgets/add_transaction_popup.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  void _showAddTransactionPopup(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) => const AddTransactionPopup(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.veryLightGray,
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showAddTransactionPopup(context),
        backgroundColor: AppColors.primaryOrange,
        child: const Icon(Icons.add, color: Colors.white, size: 32),
      ),
      body: Column(
        children: [
          // ... existing code ...
        ],
      ),
    );
  }
}
