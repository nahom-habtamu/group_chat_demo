import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_group_chat/custom_widgets/auth_button.dart';
import 'package:flutter_group_chat/custom_widgets/auth_state_changer.dart';
import 'package:flutter_group_chat/custom_widgets/input.dart';
import 'package:flutter_group_chat/custom_widgets/welcome_container.dart';
import 'package:flutter_group_chat/services/auth.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage();
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  bool isSignIn = true;
  String email = "";
  String password = "";
  bool isLoading = false;
  String error = "";

  @override
  Widget build(BuildContext context) {

    var user = Provider.of<User?>(context);
    var auth = Provider.of<Auth>(context);

    return Scaffold(
      backgroundColor: Colors.blueGrey,
      body: Column(
        children: [
          WelcomeContainer(),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                  topRight: Radius.circular(50),
                  topLeft: Radius.circular(50),
                )
              ),
              child: SingleChildScrollView(
                child: Form(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 50,
                      ),
                      Input(
                          onInputChange: (value){
                            setState(() => email = value);
                          },
                          hintText: "Enter Your Email"
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      Input(
                        onInputChange: (value){
                          setState(() => password = value);
                        },
                        hintText: "Enter Your Password",
                        isObsecured: true,
                      ),
                      SizedBox(
                        height: 55,
                      ),

                      if(!isLoading)
                      AuthButton(
                        onPressed: () async{
                          setState(() {
                            isLoading = true;
                          });
                          if(isSignIn)
                            await auth.signInUsers(email, password);
                          else
                            await auth.registerUsers(email, password);

                          setState(() {
                            isLoading = false;
                          });
                          Navigator.pushNamed(context,"/chatlist");
                        },
                        label: isSignIn ? "Sign In" : "Sign Up"
                      ),

                      if(isLoading)
                        CircularProgressIndicator(),

                      SizedBox(
                        height: 40,
                      ),


                      GestureDetector(
                        onTap: (){
                          setState(() {
                            isSignIn = !isSignIn;
                          });
                        },
                        child: AuthStateChanger(
                            spanTextOne: isSignIn ? " Don't Have An Account ?" : " Already Have An Account ?",
                            spanTextTwo: isSignIn ? " Sign Up " : " Sign In "
                        ),
                      )
                    ],
                  ),
                ),
              ),
            )
          )
        ],
      ),
    );
  }
}
