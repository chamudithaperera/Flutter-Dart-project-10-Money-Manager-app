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
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18.0),
          child: Column(
            children: [
              const SizedBox(height: 24),
              // Top Row
              Row(
                children: [
                  CircleAvatar(
                    radius: 18,
                    backgroundColor: AppColors.lightGray,
                    backgroundImage: const AssetImage('assets/profile.png'),
                  ),
                  const SizedBox(width: 12),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Welcome!',
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w500,
                          color: AppColors.darkBlue.withOpacity(0.6),
                        ),
                      ),
                      const Text(
                        'Your Name',
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                          color: AppColors.darkBlue,
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  IconButton(
                    icon: const Icon(Icons.menu, color: AppColors.darkBlue),
                    onPressed: () {},
                  ),
                ],
              ),
              const SizedBox(height: 32),

              // Total Balance Card
              const TotalBalanceCard(
                totalBalance: 'Rs 3500.00',
                income: 'Rs 5000.00',
                expense: 'Rs 1500.00',
              ),
              const SizedBox(height: 24),

              // Recent Transactions
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Recent Transactions',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: AppColors.darkBlue,
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.filter_list),
                    onPressed: () {},
                  ),
                ],
              ),
              const SizedBox(height: 16),

              // Recent Transactions List
              Expanded(
                child: ListView.builder(
                  itemCount: dummyTransactions.length,
                  itemBuilder: (context, index) {
                    final transaction = dummyTransactions[index];
                    return TransactionItem(
                      icon: transaction.icon,
                      title: transaction.title,
                      time: transaction.time,
                      amount: transaction.amount,
                      isExpense: transaction.isExpense,
                      comment: transaction.comment,
                      date: transaction.date,
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
