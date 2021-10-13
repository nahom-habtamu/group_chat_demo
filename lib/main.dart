import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_group_chat/pages/chat_detail_page.dart';
import 'package:flutter_group_chat/pages/chat_list_page.dart';
import 'package:flutter_group_chat/pages/home_page.dart';
import 'package:flutter_group_chat/services/auth.dart';
import 'package:provider/provider.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
      return MultiProvider(
        providers: [
          ChangeNotifierProvider(
              create: (_) => Auth()
          ),
          StreamProvider<User?>.value(
            value: Auth().user,
            initialData: null,
          ),
        ],
        child: MaterialApp(
          theme: ThemeData(
            primaryColor : Colors.blueGrey
          ),
          initialRoute: '/',
          routes: {
            '/' : (context) => HomePage(),
            '/chatlist' : (context) => ChatListPage(),
            '/chatdetail' : (context) => ChatDetailPage()
          }
        ),
      );
  }
}
