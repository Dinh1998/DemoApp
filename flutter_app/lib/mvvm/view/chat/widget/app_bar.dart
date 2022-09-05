import 'package:flutter/material.dart';

class AppBarCustom extends StatelessWidget {
   AppBarCustom({Key? key,required this.label}) : super(key: key);

  final String  label  ;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(25, 0, 25, 0),
      color: Colors.amberAccent,
      height: 60,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Icon(Icons.menu),
          const SizedBox(width: 15),
          Container(
            width: 300,
            child:  Text(label),

          ),
          const Icon(Icons.camera_alt_outlined),
          const SizedBox(width: 20),
          const Icon(Icons.edit),
        ],
      ),
    );
  }
}
