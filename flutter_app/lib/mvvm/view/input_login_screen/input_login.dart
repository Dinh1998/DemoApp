import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/constant/theme.dart';
import 'package:flutter_app/mvvm/view/forget_password_screen/forget_password.dart';

import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter_app/mvvm/view/widget/button.dart';
import 'package:flutter_app/mvvm/view/main_page.dart';
import 'package:flutter_app/mvvm/view/widget/textformfield.dart';

class InPutLoginPage extends StatefulWidget {
  const InPutLoginPage({Key? key}) : super(key: key);

  @override
  State<InPutLoginPage> createState() => _InPutLoginPageState();
}

class _InPutLoginPageState extends State<InPutLoginPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  Future signIn() async {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim());
  }
  @override
  void dispose(){
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
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
                       'WELCOME BACK ',
                       style: TextStyle(
                         fontSize: 80,
                         foreground: Paint()
                           ..style = PaintingStyle.stroke
                           ..strokeWidth = 2
                           ..color = Colors.white,
                       ),
                     ),
                     // Solid text as fill.
                     const Text(
                       'WELCOME BACK ',
                       style: TextStyle(
                         fontSize: 80,
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
                height: 30,
              ),
              buttonCustom(textBtn: 'S  I  G  N  I  N', onTap: () {
                signIn();
                Navigator.push(context,MaterialPageRoute(builder: (context) => MainPage(),));
              }),
              const SizedBox(
                height: 30,
              ),
              GestureDetector(
                onTap: (){
                  Navigator.push(context,MaterialPageRoute(builder: (context) => const ForgetPasswordPage(),));
                },
                child: RichText(
                  text: const TextSpan(text: 'Forget password ? ',style: TextStyle(fontSize: 17,color: ThemeApp.blueApp),
                      children: [
                    TextSpan(text: ' Click here !',style: ThemeApp.textStyleSubNormal),
                  ]),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
