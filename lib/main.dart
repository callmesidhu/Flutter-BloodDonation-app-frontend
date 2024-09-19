import 'package:flutter/material.dart';
import 'Components/home.dart';
import 'Components/add.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';


Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
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
      },
      initialRoute: '/',
    );  
  }
}
