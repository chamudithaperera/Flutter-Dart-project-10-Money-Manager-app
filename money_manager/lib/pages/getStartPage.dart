import 'package:flutter/material.dart';
import '../app_colors.dart';

class GetStartPage extends StatelessWidget {
  const GetStartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.veryLightGray,

      body: Center(
        child: Column(
          mainAxisAlignment:
              MainAxisAlignment.center, // Optional: centers content vertically
          children: [
            Text(
              'Money\nManager'.toUpperCase(),
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontFamily: 'Roboto Mono',
                color: AppColors.primaryOrange,
                fontSize: 35,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.5,
              ),
            ),

            const SizedBox(height: 80),

            Image.asset(
              'assets/getStart.png',
              width: 200, // Optional: set width
              height: 200, // Optional: set height
            ),

            const SizedBox(height: 80),

            Padding(
              padding: const EdgeInsets.fromLTRB(25, 0, 25, 0),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/login');
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primaryOrange, // Red background
                  foregroundColor: Colors.white, // White text
                  textStyle: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    letterSpacing: 1,
                  ),
                  minimumSize: Size(
                    double.infinity,
                    48,
                  ), // Full width, height 48
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12), // Rounded corners
                  ),
                  padding: EdgeInsets.symmetric(
                    vertical: 12,
                  ), // Vertical padding
                ),
                child: Text('GET STARTED', textAlign: TextAlign.center),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
