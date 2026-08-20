import 'package:contador_com_login/auth_layout.dart';
import 'package:contador_com_login/home_page.dart';
import 'package:contador_com_login/loading_page.dart';
import 'package:contador_com_login/login_page.dart';
import 'package:contador_com_login/register_page.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(colorScheme: .fromSeed(seedColor: Colors.cyanAccent)),
      initialRoute: '/',
      getPages: [
        GetPage(name: '/', page: () => AuthLayout()),
        GetPage(name: '/login', page: () => MyLoginPage()),
        GetPage(name: '/register', page: () => MyRegisterPage()),
        GetPage(name: '/home', page: () => MyHomePage()),
        GetPage(name: '/loading', page: () => MyLoadingPage()),
      ],
    );
  }
}
