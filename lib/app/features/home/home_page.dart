import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:food_app/app/features/home/add_opinion/add_opinion_page_content.dart';
import 'package:food_app/app/features/home/my_account/my_account_page_content.dart';
import 'package:food_app/app/features/home/restaurants/restaurants_page_content.dart';


class HomePage extends StatefulWidget {
  const HomePage({
    Key? key,
    required this.user,
  }) : super(key: key);

  final User user;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Rate best food in your city'),
        backgroundColor: const Color.fromARGB(255, 147, 186, 105),
      ),
      body: Builder(builder: (context) {
        if (currentIndex == 0) {
          return const RestaurantsPageContent();
        }
        if (currentIndex == 1) {
          return AddOpinionPageContent(
            onSave: () {
              setState(
                () {
                  currentIndex = 0;
                },
              );
            },
          );
        }
        return MyAccountPageContent(email: widget.user.email);
      }),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (newIndex) {
          setState(() {
            currentIndex = newIndex;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.reviews,
              color: Color.fromARGB(255, 147, 186, 105),
              size: 32,
            ),
            label: 'Reviews',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.add,
              color: Color.fromARGB(255, 147, 186, 105),
              size: 40,
            ),
            label: 'Add',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person,
              color: Color.fromARGB(255, 147, 186, 105),
              size: 32,
            ),
            label: 'My account',
          ),
        ],
      ),
    );
  }
}
