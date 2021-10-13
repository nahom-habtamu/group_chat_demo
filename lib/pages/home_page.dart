import 'package:flutter/material.dart';
import 'package:flutter_group_chat/custom_widgets/auth_button.dart';
import 'package:flutter_group_chat/custom_widgets/auth_state_changer.dart';
import 'package:flutter_group_chat/custom_widgets/input.dart';
import 'package:flutter_group_chat/custom_widgets/welcome_container.dart';
import 'package:flutter_group_chat/pages/chat_list_page.dart';
import 'package:flutter_group_chat/services/auth.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';


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

    var auth = Provider.of<Auth>(context);
    var user = Provider.of<User?>(context);

    void handleAuth () async {
      var isSuccessful = false;

      setState(() => isLoading = true );
      if(isSignIn){
        var response = await auth.signInUsers(email, password);
        isSuccessful = response != null;
      }
      else {
        var response = await auth.registerUsers(email, password);
        isSuccessful = response != null;
      }
      setState(() => isLoading = false);

      if(isSuccessful)
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ChatListPage(),
            )
        );
    }
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
                        onPressed: handleAuth,
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
