import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(' H o m e P a g e '),
      ),
      body: Center(
          child: Stack(
            children: [
              // The text border
              Text(
                'Hi There',
                style: TextStyle(
                  fontSize: 70,
                  letterSpacing: 5,
                  fontWeight: FontWeight.bold,
                  foreground: Paint()
                    ..style = PaintingStyle.stroke
                    ..strokeWidth = 10
                    ..color = Colors.red,
                ),
              ),
              // The text inside
              const Text(
                'Hi There',
                style: TextStyle(
                  fontSize: 70,
                  letterSpacing: 5,
                  fontWeight: FontWeight.bold,
                  color: Colors.amber,
                ),
              ),
            ],
          )),
    );
  }
}
