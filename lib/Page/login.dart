import 'package:fl2_qwerty_messenger/Component/button.dart';
import 'package:fl2_qwerty_messenger/Component/input_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Component/bottom_bar.dart';
import '../utils.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  String email = 'greg@gmail.com';
  String password = 'test1234';

  void setMail(String value) {
    setState(() {
      email = value;
    });
  }

  void setPassword(String value) {
    setState(() {
      password = value;
    });
  }

  Future<void> handleLogin() async {
    print('LOG IN $email $password');
    final bool returnvalue = await context.read<API>().signup(email, password);
    if (returnvalue) {
      await Navigator.push(
        context,
        MaterialPageRoute(builder: (BuildContext context) => const MyBottomBar()),
      );
    }
  }

  void goToRegister() {
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    final Container loginForm = Container(
      margin: const EdgeInsets.only(top: 25),
      child: Column(
        children: <Widget>[
          InputText(
            hintText: 'Email',
            onChanged: (dynamic value) {
              setMail(value);
            },
          ),
          const SizedBox(height: 4),
          InputText(
            hintText: 'Mot de passe',
            password: true,
            onChanged: (dynamic value) {
              setPassword(value);
            },
          ),
          const SizedBox(height: 50),
          Button(label: 'Se Connecter', onPressed: handleLogin),
          const SizedBox(height: 14),
          Button(
            label: 'Créer un nouveau compte',
            color: const Color.fromARGB(255, 48, 48, 48),
            onPressed: goToRegister,
          ),
        ],
      ),
    );

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Spacer(),
            const Spacer(),
            const Text(
              'Connecte toi a Messenger !',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                height: 1.25,
              ),
            ),
            loginForm,
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
