import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/constant/theme.dart';
import 'package:flutter_app/mvvm/view/input_login/widget/textformfield.dart';
import 'package:flutter_app/mvvm/view/login_screen/component/button.dart';

class InPutLogin extends StatefulWidget {
  const InPutLogin({Key? key}) : super(key: key);

  @override
  State<InPutLogin> createState() => _InPutLoginState();
}

class _InPutLoginState extends State<InPutLogin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(

        decoration: BoxDecoration(
          gradient: ThemeApp.linearGradient
        )
        ,
        height: double.infinity,
        width: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 100,),

             TextFormFieldCustom(labelText: "Email"),
              SizedBox(height: 15,),

              TextFormFieldCustom(labelText: "Password"),
              SizedBox(height: 30,),
              buttonCustom(textBtn: 'S I G N U P', onTap: (){}),

            ],
          ),
        ),
      ),
    );
  }
}
