import 'package:bl/Components/update.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'Components/home.dart';
import 'Components/add.dart';


void main(){
 
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
        '/add': (context)=> AddUser(),
        '/update': (context)=> UpdateDonor(),
      },
      initialRoute: '/',
    );  
  }
}
