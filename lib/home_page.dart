import 'package:contador_com_login/app_bar.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(title: 'Home'),
      body: Center(
        child: Text(
          'You have pushed the button this many times: $_counter',
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            heroTag: 'resetar',
            onPressed: () {
              setState(() {
                _counter = 0;
              });
            },
            tooltip: 'Resetar',
            child: const Icon(Icons.restart_alt),
          ),
          SizedBox(
            height: 10,
          ),
          FloatingActionButton(
            heroTag: 'decrementar',
            onPressed: () {
              setState(() {
                _counter--;
                if (_counter < 0) _counter = 0;
              });
            },
            tooltip: 'Decrementar',
            child: const Icon(Icons.remove),
          ),
          SizedBox(
            height: 10,
          ),
          FloatingActionButton(
            heroTag: 'incrementar',
            onPressed: () {
              setState(() {
                _counter++;
              });
            },
            tooltip: 'Incrementar',
            child: const Icon(Icons.add),
          ),
        ],
      ),
    );
  }
}
