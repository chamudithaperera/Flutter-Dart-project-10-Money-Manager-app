import 'package:flutter/material.dart';

class GetStartPage extends StatelessWidget {
  const GetStartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: const Color(0xFFFA812F),
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFFFA812F),
          primary: const Color(0xFFFA812F),
          secondary: const Color(0xFFFFB22C),
        ),
      ),
      home: Scaffold(body: Column(children: const [Text('Get Start Page')])),
    );
  }
}
