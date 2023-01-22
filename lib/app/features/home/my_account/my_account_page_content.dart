import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_app/app/cubit/root_cubit.dart';

class MyAccountPageContent extends StatelessWidget {
  const MyAccountPageContent({
    Key? key,
    required this.email,
  }) : super(key: key);

  final String? email;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('You are logged as $email'),
          const SizedBox(
            height: 20,
          ),
          ElevatedButton(
            onPressed: () {
              context.read<RootCubit>().signOut();
              FirebaseAuth.instance.signOut();
            },
            child: const Text('Log out'),
          ),
        ],
      ),
    );
  }
}
