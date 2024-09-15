import 'package:flutter/material.dart';
import 'Components/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);  // Corrected constructor

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Blood Donation',
      routes: {
        '/': (context) => HomePage(),
      },
      initialRoute: '/',
    );  
  }
}
