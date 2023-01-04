import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:messageme_app/screens/chat_screen.dart';
import 'package:messageme_app/screens/registration_screen.dart';
import 'package:messageme_app/screens/signin_screen.dart';
import 'package:messageme_app/screens/welcome_screen.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  final _auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Message Me',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: _auth.currentUser != null ? ChatScreen.screenRouds : '/',
      routes: {
        '/': (context) => WelcomeScreen(),
        WelcomeScreen.screenRouds: (context) => WelcomeScreen(),
        SigninScreen.screenRouds: (context) => SigninScreen(),
        RegistrationScreen.screenRouds: (context) => RegistrationScreen(),
        ChatScreen.screenRouds: (context) => ChatScreen(),
      },
    );
  }
}
