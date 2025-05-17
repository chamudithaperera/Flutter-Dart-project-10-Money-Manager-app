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
      body: Column(
        children: [
          const SizedBox(height: 80),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
            child: Row(
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
          ),
        ],
      ),
    );
  }
}
