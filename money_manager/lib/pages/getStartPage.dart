import 'package:flutter/material.dart';
import '../app_colors.dart';

class GetStartPage extends StatelessWidget {
  const GetStartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.veryLightGray,

      appBar: AppBar(backgroundColor: AppColors.veryLightGray),

      body: Center(
        child: Column(
          mainAxisAlignment:
              MainAxisAlignment.center, // Optional: centers content vertically
          children: [
            Text(
              'Money Manager'.toUpperCase(),
              style: const TextStyle(
                fontFamily: 'Roboto Mono',
                color: AppColors.primaryOrange,
                fontSize: 32,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.5,
              ),
            ),
            const SizedBox(
              height: 20,
            ), // Optional: adds spacing between text and image
            Image.asset(
              'assets/getStart.png',
              width: 200, // Optional: set width
              height: 200, // Optional: set height
            ),
          ],
        ),
      ),
    );
  }
}
