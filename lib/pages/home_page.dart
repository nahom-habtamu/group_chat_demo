import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  
  const HomePage();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child : Text(
             "HELLO APP"
          ),
        ),
      ),
    );
  }
}
