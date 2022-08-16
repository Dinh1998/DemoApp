import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/constant/theme.dart';

Widget buttonCustom({required String textBtn, required Function onTap}) {
  return GestureDetector(
    onTap: () {
      onTap();
    },
    child: Container(
      alignment: Alignment.center,
      height: 60,
      decoration: BoxDecoration(
          boxShadow: const [
            BoxShadow(
              color: Colors.blue,
              blurRadius: 10,
              offset: Offset(0, 4), // Shadow position
            ),
          ],
          color: ThemeApp.blueBold,
          borderRadius: const BorderRadius.all(Radius.circular(30)),
          border: Border.all(width: 2, color: Colors.blue)),
      child: Text(
        textBtn,
        style: ThemeApp.textStyleButton,
      ),
    ),
  );
}
