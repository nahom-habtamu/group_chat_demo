import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  
  const HomePage();
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
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 50),
                      child: TextFormField(
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(
                            hintText: "Enter Your Email",
                            border: OutlineInputBorder()
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 40,
                    ),

                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 50),
                      child: TextFormField(
                        textAlign: TextAlign.center,
                        obscureText: true,
                        decoration: InputDecoration(
                            hintText: "Enter Your Password",
                            border: OutlineInputBorder()
                        ),
                      ),
                    ),

                    SizedBox(
                      height: 55,
                    ),

                    Container(
                      width: 200,
                      height: 50,
                      color: Colors.blueGrey,
                      child: Center(
                        child: Text(
                          "Sign In",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20
                          ),
                        ),
                      ),
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
