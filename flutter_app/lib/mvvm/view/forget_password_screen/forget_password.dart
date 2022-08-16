import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/constant/theme.dart';

import 'package:flutter_app/mvvm/view/widget/button.dart';
import 'package:flutter_app/mvvm/view/widget/textformfield.dart';

class ForgetPasswordPage extends StatefulWidget {
  const ForgetPasswordPage({Key? key}) : super(key: key);

  @override
  State<ForgetPasswordPage> createState() => _ForgetPasswordPageState();
}

class _ForgetPasswordPageState extends State<ForgetPasswordPage> {
  final emailForgetController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
            padding: const EdgeInsets.all(20),
            width: size.width,
            height: size.height,
            decoration: BoxDecoration(gradient: ThemeApp.linearGradient),
            child: body()),
      ),
    );
  }

  Widget body() {
    return Column(
      children: [
            //color: Colors.red,
         
                Text(
                  'Input your email ',
                  style: TextStyle(color: Colors.blue.shade800, fontSize: 26),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  'A email be sent to email for you. Please ensure you check it ! ',
                  style: TextStyle(color: Colors.blue.shade800, fontSize: 14),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormFieldCustom(
                    labelText: 'Email for password restore ',
                    controller: emailForgetController),
                const SizedBox(
                  height: 20,
                ),
                buttonCustom(
                    textBtn: 'C O N F I R M',
                    onTap: () {
                      // Navigator.push(
                      //     context,
                      //     MaterialPageRoute(
                      //       builder: (context) => const InPutLoginPage(),
                      //     ));
                    }),




      ],
    );
  }
}
