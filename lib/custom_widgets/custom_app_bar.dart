import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {

  final String title;

  const CustomAppBar(this.title);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.blueGrey[300],
      leading: Icon(
          Icons.arrow_back
      ),
      centerTitle: true,
      title: Text(
          'Chat List'
      ),
    );
  }
}
