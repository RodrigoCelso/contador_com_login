import 'package:contador_com_login/home_page.dart';
import 'package:contador_com_login/loading_page.dart';
import 'package:contador_com_login/login_page.dart';
import 'package:contador_com_login/services/auth_service.dart';
import 'package:flutter/material.dart';

class AuthLayout extends StatelessWidget {
  const AuthLayout({super.key, this.pageIfNotConnected});

  final Widget? pageIfNotConnected;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: authService,
      builder: (context, authService, child) {
        return StreamBuilder(
          stream: authService.authStateChanges,
          builder: (context, snapshot) {
            Widget widget;
            if (snapshot.connectionState == ConnectionState.waiting) {
              widget = MyLoadingPage();
            } else if (snapshot.hasData) {
              widget = MyHomePage();
            } else {
              widget = pageIfNotConnected ?? MyLoginPage();
            }
            return widget;
          },
        );
      },
    );
  }
}
