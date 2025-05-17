import 'package:flutter/material.dart';
import '../app_colors.dart';
import '../widgets/balance_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.veryLightGray,
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
                    backgroundImage: AssetImage('assets/profile.png'),
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
                      Text(
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
                    icon: Icon(Icons.menu, color: AppColors.darkBlue),
                    onPressed: () {},
                  ),
                ],
              ),
              const SizedBox(height: 32),

              // Orange Balance Card
              Container(
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
                padding: const EdgeInsets.symmetric(
                  vertical: 30,
                  horizontal: 20,
                ),
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
                      'Rs 3500.00',
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
                        BalanceCard(
                          icon: Icons.arrow_downward,
                          title: 'Income',
                          amount: 'Rs 5000.00',
                          iconColor: Colors.green,
                          backgroundColor: Colors.white,
                          textColor: Colors.white,
                        ),
                        const SizedBox(width: 14),
                        // Expense
                        BalanceCard(
                          icon: Icons.arrow_upward,
                          title: 'Expense',
                          amount: 'Rs 1500.00',
                          iconColor: Colors.red,
                          backgroundColor: Colors.white,
                          textColor: Colors.white,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              // Add more widgets below as needed
            ],
          ),
        ),
      ),
    );
  }
}
