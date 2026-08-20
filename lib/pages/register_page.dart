import 'package:contador_com_login/components/app_bar.dart';
import 'package:contador_com_login/services/auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyRegisterPage extends StatefulWidget {
  const MyRegisterPage({super.key});

  @override
  State<MyRegisterPage> createState() => _MyRegisterPage();
}

class _MyRegisterPage extends State<MyRegisterPage> {
  final _registerKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _senhaController = TextEditingController();
  final _senhaRptController = TextEditingController();

  String _mensagemDeErro = '';

  void registrar() async {
    try {
      await authService.value.createAccount(
        email: _emailController.text,
        password: _senhaController.text,
      );
    } on FirebaseAuthException catch (e) {
      setState(() {
        _mensagemDeErro = e.message ?? 'Erro ao autenticar com o Firebase';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(title: 'Registro'),
      body: SingleChildScrollView(
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Form(
            key: _registerKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextFormField(
                  controller: _emailController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Campo obrigatório";
                    }
                    if (!GetUtils.isEmail(value)) {
                      return "E-mail inválido";
                    }
                    return null;
                  },
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    label: Text('Digite o e-mail'),
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 10),
                TextFormField(
                  controller: _senhaController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Campo obrigatório";
                    }
                    if (value.length < 6) {
                      return "A senha deve conter pelo menos 6 caracteres";
                    }
                    if (value != _senhaRptController.text) {
                      return "As senhas devem coincidir";
                    }
                    return null;
                  },
                  obscureText: true,
                  decoration: InputDecoration(
                    label: Text('Digite a senha'),
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 10),
                TextFormField(
                  controller: _senhaRptController,
                  validator: (value) {
                    if (value != _senhaController.text) {
                      return "As senhas devem coincidir";
                    }
                    return null;
                  },
                  obscureText: true,
                  decoration: InputDecoration(
                    label: Text('Repita a senha'),
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 15),
                ElevatedButton(
                  onPressed: () {
                    if (_registerKey.currentState!.validate()) {
                      registrar();

                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("Registrado com sucesso!"),
                        ),
                      );

                      // Navigator.of(context).pop(true);
                      Get.back();
                    }
                  },
                  child: Text('Registrar'),
                ),
                SizedBox(height: 10),
                Text(
                  _mensagemDeErro,
                  style: TextStyle(color: Colors.redAccent),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    _senhaController.dispose();
    _senhaRptController.dispose();
    super.dispose();
  }
}
