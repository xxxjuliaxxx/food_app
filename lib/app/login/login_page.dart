import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  LoginPage({
    Key? key,
  }) : super(key: key);

  final emailController = TextEditingController();
  final passwordcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Zaloguj się'),
              TextField(
                controller: emailController,
                decoration: const InputDecoration(
                  hintText: 'E-mail:',
                ),
              ),
              TextField(
                controller: passwordcontroller,
                decoration: const InputDecoration(
                  hintText: 'Hasło:',
                ),
                obscureText: true,
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                  onPressed: () async {
                    try {
                      await FirebaseAuth.instance.signInWithEmailAndPassword(
                          email: emailController.text,
                          password: passwordcontroller.text);
                    } catch (error) {
                      print(error);
                    }
                  },
                  child: const Text('Zaloguj się')),
            ],
          ),
        ),
      ),
    );
  }
}
