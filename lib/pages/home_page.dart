import 'package:flutter/material.dart';
import 'package:flutter_group_chat/custom_widgets/auth_button.dart';
import 'package:flutter_group_chat/custom_widgets/input.dart';

class HomePage extends StatefulWidget {
  const HomePage();
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  bool isSignIn = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      body: Column(
        children: [
          Container(
            color: Colors.transparent,
            width: double.infinity,
            height: 250,
            child: Center(
              child: Text(
                "Welcome !",
                style: TextStyle(
                  fontSize: 55,
                  fontStyle: FontStyle.italic,
                  color: Colors.white
                ),
              ),
            ),
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                  topRight: Radius.circular(50),
                  topLeft: Radius.circular(50),
                )
              ),
              child: Form(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [

                    SizedBox(
                      height: 50,
                    ),
                    Input(
                        onInputChange: (value){
                          print(value);
                        },
                        hintText: "Enter Your Email"
                    ),

                    SizedBox(
                      height: 40,
                    ),

                    Input(
                      onInputChange: (value){
                        print(value);
                      },
                      hintText: "Enter Your Password",
                      isObsecured: true,
                    ),

                    SizedBox(
                      height: 55,
                    ),

                    AuthButton(
                        onPressed: () {
                          setState(() {
                            isSignIn = !isSignIn;
                          });
                        },
                        label: isSignIn ? "Sign In" : "Sign Up"
                    ),

                    SizedBox(
                      height: 40,
                    ),
                    RichText(
                        text: TextSpan(
                          children: const <TextSpan> [
                            TextSpan( text: " Don't Have An Account ? ", style: TextStyle( fontSize: 22, color : Colors.black )),
                            TextSpan( text: " Sign Up ", style: TextStyle( fontSize: 22 , color: Colors.blueGrey )),
                          ]
                        )
                    )
                  ],
                ),
              ),
            )
          )
        ],
      ),
    );
  }
}
