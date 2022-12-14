import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/mvvm/view/input_login_screen/input_login.dart';
import 'package:flutter_app/mvvm/view/sign_up_screen/sign_up_screen.dart';
import '../widget/button.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
            padding: const EdgeInsets.all(20),
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
                'W  E  L  C  O  M  E',
                style: TextStyle(color: Colors.blue.shade800, fontSize: 26),
              ),
              const SizedBox(
                height: 200,
              ),
              SizedBox(
                height: 40,
                child: buttonCustom(
                    textBtn: 'L O G  I N',
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const InPutLoginPage(),
                          ));
                    }),
              ),
              const SizedBox(
                height: 15,
              ),
              SizedBox(
                height: 40,
                child: buttonCustom(textBtn: 'S I G N   U P', onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder:  (context) => const SignUpPage(),));
                }),
              ),
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
