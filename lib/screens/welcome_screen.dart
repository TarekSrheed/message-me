import 'package:flutter/material.dart';
import 'package:messageme_app/screens/registration_screen.dart';
import 'package:messageme_app/screens/signin_screen.dart';
import 'package:messageme_app/widgets/my_button.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);
  static const String screenRouds = '/WelcomeScreen';
  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Column(
              children: [
                SizedBox(
                  height: 180,
                  child: Image.asset('images/logo1.png'),
                ),
                const Text(
                  'Message Me',
                  style: TextStyle(
                    fontWeight: FontWeight.w900,
                    fontSize: 40,
                    color: Color(0xff2e386b),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 30),
            Mybutton(
              title: 'sign in',
              color: Colors.yellow[900]!,
              onPressed: () {
                Navigator.pushNamed(context, SigninScreen.screenRouds);
              },
            ),
            Mybutton(
              title: 'register',
              color: Colors.blue[800]!,
              onPressed: () {
                Navigator.pushNamed(context, RegistrationScreen.screenRouds);
              },
            ),
          ],
        ),
      ),
    );
  }
}
