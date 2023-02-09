import 'package:cashrich/screens/home.dart';
import 'package:cashrich/screens/auth/auth_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {

  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CashRich',
      theme: ThemeData.dark(),
      home: AuthScreen(),
    );
  }
}