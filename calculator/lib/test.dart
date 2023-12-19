import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shesafe/screens/signup_screen.dart';

class AdhaarVerify extends StatefulWidget {
  const AdhaarVerify({Key? key}) : super(key: key);

  @override
  State<AdhaarVerify> createState() => _AdhaarVerifyState();
}

class _AdhaarVerifyState extends State<AdhaarVerify> {
  late TextEditingController _adhaarController;

  @override
  void initState() {
    super.initState();
    _adhaarController = TextEditingController();
  }

  @override
  void dispose() {
    _adhaarController.dispose();
    super.dispose();
  }

  String result = ''; // To store the result from the API call

  Future<void> _postData() async {
    try {
      final response = await http.post(
        Uri.parse("http://20.0.27.38:5000/verifyAadhaar"),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(
          <String, String>{"aadhar_number": _adhaarController.text},
        ),
      );

      if (response.statusCode == 200) {
        final responseData = jsonDecode(response.body);
        print('Response Data: $responseData');

        setState(() {
          result = 'ID: ${responseData['gender']}';
        });

        print('Gender: ${responseData['gender']}');

        if (responseData['gender'] == 'FEMALE') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => SignUpScreen()),
          );
        } else if (responseData['gender'] == 'MALE') {
          showDialog(
            // Show dialog for male registration restriction
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text('Registration Not Allowed'),
                content: Text('Sorry, males cannot register.'),
                actions: <Widget>[
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text('OK'),
                  ),
                ],
              );
            },
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            Text(
              'SIGN UP',
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.w900,
              ),
            ),
            SizedBox(
              height: 40,
            ),
            TextField(
              textAlign: TextAlign.center,
              controller: _adhaarController,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
                filled: true,
                hintStyle: TextStyle(
                  color: Colors.grey[600],
                ),
                hintText: "Enter Adhaar Number",
                fillColor: Colors.white70,
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ButtonStyle(
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                      side: const BorderSide(color: Colors.black),
                    ),
                  ),
                  backgroundColor: MaterialStateProperty.all(Colors.white),
                  padding: MaterialStateProperty.all(
                      const EdgeInsets.symmetric(vertical: 15, horizontal: 20)),
                ),
                onPressed: () {
                  _postData();
                },
                child: const Text(
                  'Verify Adhaar',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
