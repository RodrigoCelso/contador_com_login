import 'package:contador_com_login/app_bar.dart';
import 'package:contador_com_login/services/auth_service.dart';
import 'package:contador_com_login/services/counter_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  void deslogar() async {
    try {
      await authService.value.signOut();
      Get.offAllNamed('/');
    } on FirebaseAuthException catch (e) {
      print(e.message);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        title: 'Home',
        actions: [
          TextButton(
            onPressed: () {
              deslogar();
            },
            child: Icon(Icons.door_back_door_outlined),
          ),
        ],
      ),
      body: Center(
        child: Obx(() {
          return Text('Contador: ${CounterService.instance.getCounter()}');
        }),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            heroTag: 'resetar',
            onPressed: () {
              CounterService.instance.reset();
            },
            tooltip: 'Resetar',
            child: const Icon(Icons.restart_alt),
          ),
          SizedBox(height: 10),
          FloatingActionButton(
            heroTag: 'decrementar',
            onPressed: () {
              CounterService.instance.decrement();
            },
            tooltip: 'Decrementar',
            child: const Icon(Icons.remove),
          ),
          SizedBox(height: 10),
          FloatingActionButton(
            heroTag: 'incrementar',
            onPressed: () {
              CounterService.instance.increment();
            },
            tooltip: 'Incrementar',
            child: const Icon(Icons.add),
          ),
        ],
      ),
    );
  }
}
