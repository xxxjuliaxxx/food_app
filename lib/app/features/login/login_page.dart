import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  LoginPage({
    Key? key,
  }) : super(key: key);

  final emailController = TextEditingController();

  final passwordcontroller = TextEditingController();

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var errorMessage = '';
  var isCreatingAcoount = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                isCreatingAcoount == true
                    ? 'First, sign up!'
                    : 'Try sign in :)',
                style: const TextStyle(fontSize: 23),
              ),
              const SizedBox(
                height: 20,
              ),
              TextField(
                controller: widget.emailController,
                decoration: const InputDecoration(
                  hintText: 'E-mail:',
                ),
              ),
              TextField(
                controller: widget.passwordcontroller,
                decoration: const InputDecoration(
                  hintText: 'Password:',
                ),
                obscureText: true,
              ),
              const SizedBox(height: 20),
              Text(errorMessage),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 147, 186, 105)),
                onPressed: () async {
                  if (isCreatingAcoount == true) {
                    // rejestracja
                    try {
                      await FirebaseAuth.instance
                          .createUserWithEmailAndPassword(
                              email: widget.emailController.text,
                              password: widget.passwordcontroller.text);
                    } catch (error) {
                      setState(
                        () {
                          errorMessage = error.toString();
                        },
                      );
                    }
                  } else {
                    //logowanie
                    try {
                      await FirebaseAuth.instance.signInWithEmailAndPassword(
                          email: widget.emailController.text,
                          password: widget.passwordcontroller.text);
                    } catch (error) {
                      setState(
                        () {
                          errorMessage = error.toString();
                        },
                      );
                    }
                  }
                },
                child: Text(isCreatingAcoount == true ? 'Sign up' : 'Sign in'),
              ),
              const SizedBox(
                height: 20,
              ),
              if (isCreatingAcoount == false) ...[
                TextButton(
                  onPressed: () {
                    setState(() {
                      isCreatingAcoount = true;
                    });
                  },
                  child: const Text('Create account'),
                ),
              ],
              if (isCreatingAcoount == true) ...[
                TextButton(
                  onPressed: () {
                    setState(() {
                      isCreatingAcoount = false;
                    });
                  },
                  child: const Text('Do you already have an account?'),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
