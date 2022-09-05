
import 'package:flutter/material.dart';
import 'package:flutter_app/constant/color.dart';
import 'package:flutter_app/constant/data.dart';
import 'package:flutter_app/mvvm/view/chat/widget/app_bar.dart';
import 'package:flutter_app/mvvm/view/chat/widget/nav_bottom.dart';



class ChatScreen extends StatefulWidget {
  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        body: SafeArea(
        child: Container(
          width: size.width,
          height: size.height,
          child: SingleChildScrollView(
            child: Column(
              children: [
                _body()
              ],
            ),
          ),
        ),
      ),
    bottomNavigationBar:  NavBottomBar(),
    );
  }
  Widget _body(){
    return SingleChildScrollView(
      child: Column(
        children: [
          AppBarCustom(label: 'ĐOẠN CHAT'),
          Text('data')
        ],
      ),
    );
        
  }

}



