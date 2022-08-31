import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/constant/theme.dart';
import 'package:flutter_app/mvvm/view/home_screen/home_screen.dart';
import 'package:flutter_app/mvvm/view/main_page.dart';
import 'package:flutter_app/mvvm/view/widget/button.dart';
import 'package:flutter_app/mvvm/view/widget/textformfield.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  bool passwordConfirm() {
    if (passwordController.text.trim() ==
        passwordConfirmController.text.trim()) {
      return true;
    }
    return false;
  }

  Future signUp() async {
    showDialog(
        context: context,
        builder: (context) => const Center(
            child: SizedBox(
                height: 30, width: 30, child: CircularProgressIndicator())),
        barrierDismissible: false);
    try {
      if (passwordConfirm()) {
        // create user
        var signUp = await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailController.text.trim(),
          password: passwordController.text.trim(),
        );
        //add user details
        addUserDetails(
          firstNameController.text.trim(),
          lastNameController.text.trim(),
          phoneController.text.trim(),
        );
        if (!mounted) return;
        Navigator.of(context).pop(signUp); //dispose showdialog circularProgress
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const MainPage(),
            ));
      }
    } on FirebaseAuthException catch (e) {
      print(e);
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('E R R O R'),
          content: Text(e.message.toString()),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.pop(context, 'OK');
                Navigator.pop(context);
              },
              child: const Text('OK'),
            ),
          ],
        ),
      );
    }
  }

  Future addUserDetails(String firstName, String lastName, String phone) async {
    await FirebaseFirestore.instance.collection('users').add({
      'first_name': firstName,
      'last_name': lastName,
      'phone': phone,
    });
  }

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final passwordConfirmController = TextEditingController();
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final phoneController = TextEditingController();
  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    firstNameController.dispose();
    lastNameController.dispose();
    phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(20),
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
                      fontSize: 40,
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
                      fontSize: 40,
                      color: Colors.blue,
                    ),
                  ),
                ],
              )),
              const SizedBox(
                height: 20,
              ),
              TextFormFieldCustom(
                  controller: emailController, labelText: "Email"),
              const SizedBox(
                height: 15,
              ),
              TextFormFieldCustom(
                  controller: firstNameController, labelText: "First Name"),
              const SizedBox(
                height: 15,
              ),
              TextFormFieldCustom(
                  controller: lastNameController, labelText: "Last Name"),
              const SizedBox(
                height: 15,
              ),
              TextFormFieldCustom(
                  controller: phoneController, labelText: "Phone Number"),
              const SizedBox(
                height: 15,
              ),
              TextFormFieldCustom(
                  controller: passwordController, labelText: "Password"),
              const SizedBox(
                height: 15,
              ),
              TextFormFieldCustom(
                  controller: passwordConfirmController,
                  labelText: "Confirm Password"),
              const SizedBox(
                height: 30,
              ),
              buttonCustom(
                  textBtn: 'S  I  G  N    U  P',
                  onTap: () {
                    signUp();
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const HomePage(),
                        ));
                  }),
              const SizedBox(
                height: 30,
              ),
              RichText(
                text: const TextSpan(
                    text: 'You have account ? ',
                    style: TextStyle(fontSize: 17, color: ThemeApp.blueApp),
                    children: [
                      TextSpan(
                          text: ' Login  !',
                          style: ThemeApp.textStyleSubNormal),
                    ]),
              )
            ],
          ),
        ),
      ),
    );
  }
}
