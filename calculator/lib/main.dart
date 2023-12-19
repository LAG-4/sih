import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:shesafe/screens/calculator.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:shesafe/screens/home_screen.dart';
import 'package:shesafe/screens/login_screens/login_screen.dart';
import 'package:http/http.dart' as http;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MaterialApp(home: Scaffold(body: APICall())));

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
class APICall extends StatefulWidget {
  @override
  _APICallState createState() => _APICallState();
}

class _APICallState extends State<APICall> {
  final String apiUrl = 'https://jsonplaceholder.typicode.com/posts';
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  String result = ''; // To store the result from the API call

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    super.dispose();
  }

  Future<void> _postData() async {
    try {
      final response = await http.post(
        Uri.parse("http://20.0.27.38:5000/verifyAadhaar"),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          "aadhar_number": '812948231386'
        }),
      );

      if (response.statusCode == 200) {
        final responseData = jsonDecode(response.body);
        setState(() {
          result = 'ID: ${responseData['gender']}';
        });

        if (responseData['gender'] == 'FEMALE') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => LoginScreen()),
          );
        }
      } else {
        throw Exception(jsonDecode(response.body));
      }
    } catch (e) {
      setState(() {
        result = 'Error: $e';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('POST Request Example'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: nameController,
              decoration: InputDecoration(labelText: 'Name'),
            ),
            TextField(
              controller: emailController,
              decoration: InputDecoration(labelText: 'Email'),
            ),
            ElevatedButton(
              onPressed:_postData,
              child: Text('Submit'),
            ),
            SizedBox(height: 20.0),
            Text(
              result,
              style: TextStyle(fontSize: 16.0),
            ),
          ],
        ),
      ),
    );
  }
}

