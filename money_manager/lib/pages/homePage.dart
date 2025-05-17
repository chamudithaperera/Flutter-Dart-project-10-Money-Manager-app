import 'package:flutter/material.dart';

import '../app_colors.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
        child: Column(
          children: [
            const SizedBox(height: 80),
            Row(
              //top row
              children: [
                Image.asset('assets/profile.png', width: 40, height: 40),
                const SizedBox(width: 10),
                Column(
                  crossAxisAlignment:
                      CrossAxisAlignment.start, // Aligns children to the left
                  children: [
                    Text(
                      'Welcome',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: AppColors.darkBlue.withOpacity(0.5),
                      ),
                    ),
                    Text(
                      'Your Name',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: AppColors.darkBlue,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 20),

            Container(
              height: 200,
              width: double.infinity,
              decoration: BoxDecoration(
                color: AppColors.secondaryYellow,
                borderRadius: BorderRadius.circular(
                  16,
                ), // You can change 16 to any value you like
              ),
              child: Column(
                children: [
                  const SizedBox(height: 20),
                  Text(
                    'Total Balance',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: AppColors.darkBlue,
                    ),
                  ),
                  Text(
                    'Rs: 3500.00',
                    style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                      color: AppColors.darkBlue,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        width: 150,
                        height: 80,
                        decoration: BoxDecoration(
                          color: AppColors.primaryOrange.withOpacity(0.5),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        padding: const EdgeInsets.all(10),

                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                color: AppColors.primaryOrange.withOpacity(0.5),
                                shape: BoxShape.circle,
                              ),
                              padding: EdgeInsets.all(8),
                              child: Icon(
                                Icons.arrow_upward,
                                color: Colors.green,
                                size: 20,
                              ),
                            ),
                            Column(
                              crossAxisAlignment:
                                  CrossAxisAlignment
                                      .start, // Aligns children to the left
                              children: [
                                Text(
                                  'Income',
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600,
                                    color: AppColors.darkBlue.withOpacity(0.5),
                                  ),
                                ),
                                Text(
                                  'Rs: 5000.00',
                                  style: TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.darkBlue,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: 150,
                        height: 80,
                        decoration: BoxDecoration(
                          color: AppColors.primaryOrange.withOpacity(0.5),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        padding: const EdgeInsets.all(10),

                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                color: AppColors.primaryOrange.withOpacity(0.5),
                                shape: BoxShape.circle,
                              ),
                              padding: EdgeInsets.all(8),
                              child: Icon(
                                Icons.arrow_downward,
                                color: Colors.red,
                                size: 20,
                              ),
                            ),
                            Column(
                              crossAxisAlignment:
                                  CrossAxisAlignment
                                      .start, // Aligns children to the left
                              children: [
                                Text(
                                  'Expense',
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600,
                                    color: AppColors.darkBlue.withOpacity(0.5),
                                  ),
                                ),
                                Text(
                                  'Rs: 1500.00',
                                  style: TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.darkBlue,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
