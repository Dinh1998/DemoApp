import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/constant/theme.dart';
import 'package:flutter_app/mvvm/view/forget_password_screen/forget_password.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_app/mvvm/view/home_screen/home_screen.dart';
import 'package:flutter_app/mvvm/view/main_page.dart';
import 'package:flutter_app/mvvm/view/widget/button.dart';
import 'package:flutter_app/mvvm/view/widget/textformfield.dart';

class InPutLoginPage extends StatefulWidget {
  const InPutLoginPage({Key? key}) : super(key: key);

  @override
  State<InPutLoginPage> createState() => _InPutLoginPageState();
}

class _InPutLoginPageState extends State<InPutLoginPage> {


  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  showLoaderDialog(BuildContext context){
    AlertDialog alert=AlertDialog(

      content:  Row(
        children: [
          CircularProgressIndicator(),
          Container(margin: EdgeInsets.only(left: 7),child:Text("Loading..." )),
        ],),
    );
    showDialog(barrierDismissible: false,
      context:context,
      builder:(BuildContext context){
        return alert;

      },
    );
  }
  Future signIn(BuildContext context) async {
    showLoaderDialog(context);
    // showDialog(
    //     context: context,
    //     builder: (context) => const Center(
    //         child: SizedBox(
    //             height: 30, width: 30, child: CircularProgressIndicator())),
    //     barrierDismissible: false);
    // Navigator.of(context).pop();
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(

          email: emailController.text.trim(),
          password: passwordController.text.trim());
      if (!mounted) return;
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const MainPage(),
          ));
    } on FirebaseAuthException catch (e) {
      showDialog(context: context, builder: (context) =>
          AlertDialog(
            title: const Text('E R R O R'),
            content:  Text(e.message.toString()),
            actions: <Widget>[
              TextButton(
                onPressed: () => Navigator.pop(context, 'Cancel'),
                child: const Text('Cancel'),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pop(context, 'OK');},
                child: const Text('OK'),
              ),
            ],
          ),

        );
    }
  }

  Future<void> login(BuildContext context) async {
    // show (push onto route stack) a modal barrier, blocking UI
    showDialog(
        context: context,
        builder: (context) => const Center(
            child: SizedBox(
                height: 30, width: 30, child: CircularProgressIndicator())),
        barrierDismissible: false);

    // a fake login call using Future.delayed
    bool loginOK = await Future.delayed(const Duration(seconds: 3), () => false)
        .timeout(const Duration(seconds: 5), onTimeout: () => false);

    // dispose the dialog modal barrier (pop it from route stack)
    Navigator.of(context).pop(loginOK);

    // do something with login result
    print('Login OK? $loginOK');
  }

  @override
  void dispose() {
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
                      fontSize: 60,
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
                      fontSize: 60,
                      color: Colors.blue,
                    ),
                  ),
                ],
              )),
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
              buttonCustom(
                  textBtn: 'S  I  G  N   I  N',
                  onTap: () async {
                    signIn(context);
                  }),
              const SizedBox(
                height: 30,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ForgetPasswordPage(),
                      ));
                },
                child: RichText(
                  text: const TextSpan(
                      text: 'Forget password ? ',
                      style: TextStyle(fontSize: 17, color: ThemeApp.blueApp),
                      children: [
                        TextSpan(
                            text: ' Click here !',
                            style: ThemeApp.textStyleSubNormal),
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
