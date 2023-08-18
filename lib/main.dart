import 'package:flutter/material.dart';
import 'package:the_daily_app/screens/home.dart';

void main() {
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'The Daily App',
      theme: ThemeData(fontFamily: 'Montserrat'),
      home: const Home(),
    );
  }
}
