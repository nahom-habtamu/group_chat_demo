import 'package:flutter/material.dart';
class AuthStateChanger extends StatelessWidget {

  final String? spanTextOne;
  final String? spanTextTwo;

  const AuthStateChanger({ required this.spanTextOne, required this.spanTextTwo });

  @override
  Widget build(BuildContext context) {
    return RichText(
        text: TextSpan(
            children: <TextSpan> [
              TextSpan(
                  text: spanTextOne!,
                  style: TextStyle( fontSize: 22, color : Colors.black )
              ),
              TextSpan(
                  text: spanTextTwo!,
                  style: TextStyle( fontSize: 22 , color: Colors.blueGrey )
              ),
            ]
        )
    );
  }
}
