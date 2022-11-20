import 'package:flutter/material.dart';
import 'package:itbook_flutter_demo/screens/details.dart';
import 'package:itbook_flutter_demo/screens/home.dart';

void main() {
  runApp(const ItBookstoreApp());
}

class ItBookstoreApp extends StatelessWidget {
  const ItBookstoreApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'IT Bookstore App',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: const HomeScreen(),
    );
  }
}