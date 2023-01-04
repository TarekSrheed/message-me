import 'package:flutter/material.dart';
import 'package:messageme_app/constants.dart';
import 'package:messageme_app/screens/chat_screen.dart';
import 'package:messageme_app/widgets/my_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:google_sign_in/google_sign_in.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({Key? key}) : super(key: key);
  static const String screenRouds = '/registrationScreen';
  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final _auth = FirebaseAuth.instance;
  late String email;
  late String password;
  bool _showSpinner = false;

  // Future<UserCredential> signInWithGoogle() async {
  //   // Trigger the authentication flow
  //   final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

  //   // Obtain the auth details from the request
  //   final GoogleSignInAuthentication? googleAuth =
  //       await googleUser?.authentication;

  //   // Create a new credential
  //   final credential = GoogleAuthProvider.credential(
  //     accessToken: googleAuth?.accessToken,
  //     idToken: googleAuth?.idToken,
  //   );

  //   // Once signed in, return the UserCredential
  //   return await FirebaseAuth.instance.signInWithCredential(credential);
  // }
  Future<void> _googleSignIn() async {
    final googleSignIn = GoogleSignIn();
    final googleAccount = await googleSignIn.signIn();
    if (googleAccount != null) {
      final googleAuth = await googleAccount.authentication;
      if (googleAuth.accessToken != null && googleAuth.idToken != null) {
        try {
          await FirebaseAuth.instance.signInWithCredential(
              GoogleAuthProvider.credential(
                  idToken: googleAuth.idToken,
                  accessToken: googleAuth.accessToken));
          Navigator.pushNamed(context, ChatScreen.screenRouds);
        } on FirebaseException catch (error) {
        } catch (error) {
        } finally {}
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: ModalProgressHUD(
        inAsyncCall: _showSpinner,
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 24,
              vertical: size.height / 4,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(
                  height: 180,
                  child: Image.asset('images/logo1.png'),
                ),
                const SizedBox(height: 50),
                TextField(
                  onChanged: (value) {
                    email = value;
                  },
                  textAlign: TextAlign.center,
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                    hintText: 'Enter your email',
                    contentPadding: EdgeInsets.symmetric(
                      vertical: 10,
                      horizontal: 20,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.orange,
                        width: 1,
                      ),
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.blue,
                        width: 2,
                      ),
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                TextField(
                  onChanged: (value) {
                    password = value;
                  },
                  obscureText: true,
                  textAlign: TextAlign.center,
                  decoration: const InputDecoration(
                    hintText: 'Enter your password',
                    contentPadding: EdgeInsets.symmetric(
                      vertical: 10,
                      horizontal: 20,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.orange,
                        width: 1,
                      ),
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.blue,
                        width: 2,
                      ),
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Mybutton(
                  title: 'register',
                  color: Colors.blue[800]!,
                  onPressed: () async {
                    setState(() {
                      _showSpinner = true;
                    });
                    try {
                      final newUser =
                          await _auth.createUserWithEmailAndPassword(
                        email: email,
                        password: password,
                      );
                      Navigator.pushNamed(context, ChatScreen.screenRouds);
                      setState(() {
                        _showSpinner = false;
                      });
                    } catch (e) {
                      print(e);
                    }
                  },
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Expanded(
                      child: Divider(
                        height: kDefaultPadding * 2,
                        color: Colors.black38,
                        endIndent: kDefaultPadding,
                      ),
                    ),
                    Text('OR'),
                    Expanded(
                      child: Divider(
                        color: Colors.black38,
                        indent: kDefaultPadding,
                      ),
                    ),
                  ],
                ),
                TextButton(
                  onPressed: () async {
                    // setState(() {
                    //   _showSpinner = true;
                    // });
                    // try {

                    //   setState(() {
                    //     _showSpinner = false;
                    //   });
                    // } catch (e) {
                    //   print(e);
                    // }
                    await _googleSignIn();
                    // Navigator.pushNamed(context, ChatScreen.screenRouds);
                  },
                  child: Material(
                    elevation: 6,
                    borderRadius: const BorderRadius.all(
                      Radius.circular(30),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.network(
                          'http://pngimg.com/uploads/google/google_PNG19635.png',
                          height: kDefaultPadding * 2,
                        ),
                        const Text(
                          'Sign With Google',
                          style: TextStyle(fontSize: 15),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
