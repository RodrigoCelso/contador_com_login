import 'package:contador_com_login/home_page.dart';
import 'package:contador_com_login/login_page.dart';
import 'package:contador_com_login/register_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: .fromSeed(seedColor: Colors.cyanAccent),
      ),
      initialRoute: '/login',
      routes: {
        '/login': (context) => MyLoginPage(),
        '/register': (context) => MyRegisterPage(),
        '/home': (context) => MyHomePage(),
      },
    );
  }
}
