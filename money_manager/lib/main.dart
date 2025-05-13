import 'package:flutter/material.dart';
import 'pages/getStartPage.dart';
import 'app_colors.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Money Manager',
      debugShowCheckedModeBanner: false,
      theme: AppColors.theme,
      initialRoute: '/',
      routes: {
        '/': (context) => const GetStartPage(),
        // Add more routes here as you create more pages
      },
    );
  }
}
