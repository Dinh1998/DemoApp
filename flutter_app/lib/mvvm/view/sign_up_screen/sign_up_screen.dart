import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/constant/theme.dart';

import 'package:flutter_app/mvvm/view/login_screen/Login.dart';

import 'package:flutter_app/mvvm/view/widget/button.dart';
import 'package:flutter_app/mvvm/view/widget/textformfield.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(gradient: ThemeApp.linearGradient),
        height: double.infinity,
        width: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 100,
              ),
              Center(
                  child: Stack(
                    children: <Widget>[
                      // Stroked text as border.
                      Text(
                        'WELCOME NEW MEMBER ! ',
                        style: TextStyle(
                          fontSize: 60,
                          foreground: Paint()
                            ..style = PaintingStyle.stroke
                            ..strokeWidth = 2
                            ..color = Colors.white,
                        ),
                      ),
                      // Solid text as fill.
                      const Text(
                        'WELCOME NEW MEMBER ! ',
                        style: TextStyle(
                          fontSize: 60,
                          color: Colors.blue,
                        ),
                      ),
                    ],
                  )
              ),
              const SizedBox(
                height: 100,
              ),
              TextFormFieldCustom(
                  controller: emailController, labelText: "Email"),
              const SizedBox(
                height: 15,
              ),
              TextFormFieldCustom(
                  controller: passwordController, labelText: "Password"),
              const SizedBox(
                height: 15,
              ),
              TextFormFieldCustom(
                  controller: passwordController, labelText: "Confirm Password"),
              const SizedBox(
                height: 30,
              ),
              buttonCustom(textBtn: 'S  I  G  N    U  P', onTap: () {
                Navigator.push(context,MaterialPageRoute(builder: (context) => LoginPage(),));
              }),
              const SizedBox(
                height: 30,
              ),

              RichText(
                text: const TextSpan(text: 'You have account ? ',style: TextStyle(fontSize: 17,color: ThemeApp.blueApp),
                    children: [
                      TextSpan(text: ' Login  !',style: ThemeApp.textStyleSubNormal),
                    ]),
              )
            ],
          ),
        ),
      ),
    );
  }
}
