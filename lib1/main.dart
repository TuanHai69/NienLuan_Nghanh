import 'package:flutter/material.dart';

import 'ui/login.dart';

void main() {
  runApp(const Storetoys());
}

class Storetoys extends StatelessWidget {
  const Storetoys({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
      ),
      home: const Login(),
    );
  }
}
