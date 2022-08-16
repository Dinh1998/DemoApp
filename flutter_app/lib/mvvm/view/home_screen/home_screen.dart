import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/mvvm/view/login_screen/Login.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final user = FirebaseAuth.instance.currentUser!;
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
      leading: IconButton(
        icon: const Icon(Icons.arrow_back),
        tooltip: 'Show Snackbar',
        onPressed: () {
          FirebaseAuth.instance.signOut();
         //Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage(),));
        },
      ),

        title: const Text(' H o m e P a g e '),

      ),
      body: Center(
          child: Stack(
            children: [
              // The text border
              Text(
                'Hi There ${user.email}',
                style: TextStyle(
                  fontSize: 30,
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
                'Hi There ${user.email}',
                style: const TextStyle(
                  fontSize: 30,
                  letterSpacing: 2,
                  fontWeight: FontWeight.bold,
                  color: Colors.amber,
                ),
              ),
            ],
          )),
    );
  }
}
