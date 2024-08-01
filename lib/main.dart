import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:gate_log/gate_log.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'GateLog',
      home: Builder(builder: (context) {
        return Scaffold(
          body: Center(
            child: ElevatedButton(
                onPressed: () async {
                  final nav = Navigator.of(context);
                  final prefs = await SharedPreferences.getInstance();
                  await prefs.setString(
                      'userInfo',
                      jsonEncode({
                        'outlookEmail': 'r.hardik@iitg.ac.in',
                        'name': 'Hardik Roongta',
                        'rollNo': '210102036',
                        'altEmail': 'abc@gmail.com',
                        'phoneNumber': 1234567890,
                        'emergencyPhoneNumber': 0987654321,
                        'gender': 'Male',
                        'roomNo': 'ABCD',
                        'homeAddress': 'homeAddress',
                        'dob': 'dob',
                        'hostel': 'LOHIT',
                        'linkedin': 'linkedin',
                        'image': 'image',
                      }));

                  await prefs.setString("accessToken",
                      "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyaWQiOiI2NTE0MzdkYWIxMjgxNmNhODkwYTQzM2MiLCJpYXQiOjE3MjI1MzkxNTYsImV4cCI6MTcyMzQwMzE1Nn0.vY9CoZX7CQiuYbyHUDsYSrwbePW0NhHtfOtguhsGMow");
                  await prefs.setBool('isGuest', false);

                  nav.push(MaterialPageRoute(
                    builder: (context) => const GateLog(),
                  ));
                },
                child: const Text('GateLog')),
          ),
        );
      }),
    );
  }
}
