import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:shesafe/screens/calculator.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:shesafe/screens/home_screen.dart';
import 'package:shesafe/screens/login_screens/login_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  final FirebaseAuth _auth = FirebaseAuth.instance;
 MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: _handleAuth());
  }

  Widget _handleAuth() {
    return StreamBuilder<User?>(
      stream: _auth.authStateChanges(),
      builder: (BuildContext context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          // Show a loading indicator if the connection is in progress
          return CircularProgressIndicator();
        } else {
          if (snapshot.hasData && snapshot.data != null) {
            // User is already logged in, navigate to home screen
            return HomeScreen();
          } else {
            // User is not logged in, redirect to login screen
            return LoginScreen();
          }
        }
      },
    );
  }
}

