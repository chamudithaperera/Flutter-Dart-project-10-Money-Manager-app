import 'package:flutter/material.dart';
import '../app_colors.dart';
import '../widgets/total_balance_card.dart';

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

              // Total Balance Card
              TotalBalanceCard(
                totalBalance: 'Rs 3500.00',
                income: 'Rs 5000.00',
                expense: 'Rs 1500.00',
              ),
              // Add more widgets below as needed
            ],
          ),
        ),
      ),
    );
  }
}
