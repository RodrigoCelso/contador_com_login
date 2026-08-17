import 'package:contador_com_login/app_bar.dart';
import 'package:flutter/material.dart';

class MyRegisterPage extends StatelessWidget {
  const MyRegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(title: 'Registro'),
      body: SingleChildScrollView(
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Form(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    label: Text('Digite o E-mail'),
                    border: OutlineInputBorder()
                  ),
                ),
                SizedBox( height: 10 ),
                TextFormField(
                  obscureText: true,
                  decoration: InputDecoration(
                    label: Text('Digite a Senha'),
                    border: OutlineInputBorder()
                  ),
                ),
                SizedBox( height: 10 ),
                TextFormField(
                  obscureText: true,
                  decoration: InputDecoration(
                    label: Text('Repita a senha'),
                    border: OutlineInputBorder()
                  ),
                ),
                SizedBox( height: 15 ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop(true);
                  },
                  child: Text('Registrar'),
                ),
              ],
            )
          ),
        ),
      )
    );
  }
}
