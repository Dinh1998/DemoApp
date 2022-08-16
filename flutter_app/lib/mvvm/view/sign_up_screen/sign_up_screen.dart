import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/constant/theme.dart';
import 'package:flutter_app/mvvm/view/home_screen/home_screen.dart';
import 'package:flutter_app/mvvm/view/input_login_screen/widget/textformfield.dart';

import 'package:flutter_app/mvvm/view/login_screen/component/button.dart';

class InPutSignUpPage extends StatefulWidget {
  const InPutSignUpPage({Key? key}) : super(key: key);

  @override
  State<InPutSignUpPage> createState() => _InPutSignUpPageState();
}

class _InPutSignUpPageState extends State<InPutSignUpPage> {
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
              buttonCustom(textBtn: 'S  I  G  N  U  P', onTap: () {
                Navigator.push(context,MaterialPageRoute(builder: (context) => HomePage(),));
              }),
              const SizedBox(
                height: 30,
              ),
              RichText(
                text: const TextSpan(text: 'Forget password ? ',style: TextStyle(fontSize: 17,color: ThemeApp.blueApp),
                    children: [
                      TextSpan(text: ' Click here !',style: ThemeApp.textStyleSubNormal),
                    ]),
              )
            ],
          ),
        ),
      ),
    );
  }
}
