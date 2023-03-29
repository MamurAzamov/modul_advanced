import 'package:flutter/material.dart';
import 'package:modul_advanced/pages/account_page.dart';
import 'package:modul_advanced/pages/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
      routes: {
        AccountPage.id: (context) => const AccountPage(),
      },
    );
  }
}

