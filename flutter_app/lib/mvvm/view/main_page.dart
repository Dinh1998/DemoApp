import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/mvvm/view/home_screen/home_screen.dart';
import 'package:flutter_app/mvvm/view/input_login_screen/input_login.dart';
import 'package:flutter_app/mvvm/view/login_screen/Login.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return  HomePage();
          } else {
            return  LoginPage();
          }
        },
      ),
    );
  }
}
