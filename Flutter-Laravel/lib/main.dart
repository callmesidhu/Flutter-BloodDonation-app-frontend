import 'package:bl/Components/update.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'Components/home.dart';
import 'Components/add.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
    if (kIsWeb) {
    // Provide FirebaseOptions for Web
    await Firebase.initializeApp(
            options: FirebaseOptions(
        apiKey: "AIzaSyAEw6wxfrjSqqa8EHAuLmMtH0h2XpFTW5s",
        authDomain: "flutter-blooddonation-app.firebaseapp.com",
        projectId: "flutter-blooddonation-app",
        storageBucket: "flutter-blooddonation-app.appspot.com",
        messagingSenderId: "708035593743",
        appId: "1:708035593743:web:701e5cb1d59bee2be7057a"      
      ),
    );
    print('Web connected');
  } else {
    // Initialize Firebase for mobile platforms (Android, iOS)
    await Firebase.initializeApp();
  }
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
