import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/mvvm/view/chat/chat_screen.dart';

import 'package:flutter_app/mvvm/view/home_scroll/home_scroll.dart';
import 'package:flutter_app/mvvm/view/test.dart';
import 'package:flutter_app/mvvm/view/widget/button.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final user = FirebaseAuth.instance.currentUser!;
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
              icon: const Icon(Icons.output_outlined),
              onPressed: () {
                //  Navigator.push(context, MaterialPageRoute(builder: (context) => const ScrollTapView(),));
                FirebaseAuth.instance.signOut();
              },
            ),
          ],
          title: Container(
              alignment: Alignment.center, child: Text('Hi ${user.email!}')),
        ),
        body: Container(
            height: double.infinity,
            width: double.infinity,
            child: SingleChildScrollView(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                userCurrent(),
                SizedBox(),
                SizedBox(
                    height: 50,
                    child: buttonCustom(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ChatScreen(),
                              ));
                        },
                        textBtn: 'N E X T  P A G E')),
                AddUser('John Doe', ' Stokes and Sons', 42),
              ],
            ))),
      ),
    );
  }

  Widget userCurrent() {
    return Container(
      height: 60,
      child: Stack(
        children: [
          // The text border
          Text(
            'Hi ${user.email}',
            style: TextStyle(
              fontSize: 20,
              letterSpacing: 2,
              fontWeight: FontWeight.bold,
              foreground: Paint()
                ..style = PaintingStyle.stroke
                ..strokeWidth = 2
                ..color = Colors.red,
            ),
          ),
          // The text inside
          Text(
            'Hi ${user.email}',
            style: const TextStyle(
              fontSize: 20,
              letterSpacing: 2,
              fontWeight: FontWeight.bold,
              color: Colors.amber,
            ),
          ),
        ],
      ),
    );
  }
}
