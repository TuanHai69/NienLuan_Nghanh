import 'package:flutter/material.dart';

import 'auth_card.dart';

class AuthScreen extends StatelessWidget {
  static const routeName = '/auth';

  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomInset: false,
      body: Stack(
        children: <Widget>[
          Container(
            decoration: const BoxDecoration(
                image: DecorationImage(
              image: AssetImage('image/login.jpg'),
              fit: BoxFit.cover,
            )),
            child: Center(
                child: Container(
              width: 320,
              height: 500,
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.8),
                  border: Border.all(color: Colors.blue, width: 2),
                  borderRadius: BorderRadius.circular(30)),
              child: const AuthCard(),
            )),
          ),
        ],
      ),
    );
  }
}
