import 'package:flutter/material.dart';

import 'color.dart';
class  ThemeApp {
ThemeApp._();
static const String fontName= 'Roboto';
static const int fontSizeNomarl1=16;
static  Color blueBold= Colors.blue.shade700 ;
static TextStyle textTitleBorder = TextStyle(

  fontSize: 70,
  letterSpacing: 5,
  fontWeight: FontWeight.bold,
  foreground: Paint()
    ..style = PaintingStyle.stroke
    ..strokeWidth = 2
    ..color = Colors.white,
);
static const Color blueApp=Colors.blue;
static const TextStyle textStyleTittle=TextStyle(color:
Colors.blueAccent,fontSize: 25,fontWeight: FontWeight.bold);

static const TextStyle textStyleSubNormal=TextStyle(color:
Colors.blue,fontSize: 17,fontWeight: FontWeight.bold);
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
ThemeData themeData = ThemeData(
    fontFamily: 'Montserrat',
    hintColor: dark_green,
    primarySwatch: customColorGreen,
    scaffoldBackgroundColor: darker_blue,
    highlightColor: dark_blue,
    splashColor: dark_green);

ThemeData themeData1 = ThemeData(
  fontFamily: 'Montserrat',
  hintColor: dark_green,
  primarySwatch: customColorGreen,
  scaffoldBackgroundColor: green,
  highlightColor: dark_blue,
  splashColor: dark_green,
  canvasColor: dark_blue,
  textTheme: const TextTheme(
    subtitle1: TextStyle(
      color: Colors.white,
      fontSize: 20,
    ),
  ),
);
