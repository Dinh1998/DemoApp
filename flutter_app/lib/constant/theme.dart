import 'package:flutter/material.dart';
class  ThemeApp {
ThemeApp._();
static const String fontName= 'Roboto';
static const int fontSizeNomarl1=16;
static  Color blueBold= Colors.blue.shade700 ;
static const TextStyle textStyleButton=TextStyle(color:
Colors.white,fontSize: 17,fontWeight: FontWeight.bold);
static LinearGradient linearGradient=LinearGradient(
    colors: [
      Colors.blueAccent.withOpacity(0.5),
      Colors.blue.withOpacity(0.5),
      Colors.blue.withOpacity(0.3),
    ],
    begin: Alignment.topCenter,
    stops: const [0.0, 0.3, 0.9]);
}