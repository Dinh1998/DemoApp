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
      height: 50,
      decoration: BoxDecoration(
          boxShadow: const [
            BoxShadow(
              color: Colors.white,
              blurRadius: 10,
              offset: Offset(0, 0), // Shadow position
            ),
          ],
          color: ThemeApp.blueBold,
          borderRadius: const BorderRadius.all(Radius.circular(30)),
          border: Border.all(width: 0, color: Colors.white)),
      child: Text(
        textBtn,
        style: ThemeApp.textStyleButton,
      ),
    ),
  );
}
