import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../input_login/input_login.dart';
import 'component/button.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  // @override
  // void dispose() {
  //
  //   super.dispose();
  // }
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
            padding: EdgeInsets.all(20),
            width: size.width,
            height: size.height,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [
                      Colors.blueAccent.withOpacity(0.5),
                      Colors.blue.withOpacity(0.5),
                      Colors.blue.withOpacity(0.3),
                    ],
                    begin: Alignment.topCenter,
                    stops: const [0.0, 0.3, 0.9]),
            ),
            child: body()),
      ),
    );
  }

  Widget body() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          //color: Colors.red,
          child: Column(
            children: [
              Text(
                'W  E  L  L  C  O  M  E',
                style: TextStyle(color: Colors.blue.shade800, fontSize: 26),
              ),
              const SizedBox(
                height: 200,
              ),
              buttonCustom(
                  textBtn: 'L  O  G  I  N',
                  onTap: (){
                    Navigator.push(context,MaterialPageRoute(builder:
                    (context) => InPutLogin(),));

                  }
              ),
              const SizedBox(
                height: 15,
              ),
              buttonCustom(textBtn: 'S  I  G  N  U  P', onTap: () {}),
              const SizedBox(
                height: 50,
              ),
            ],
          ),
        )
      ],
    );
  }
}