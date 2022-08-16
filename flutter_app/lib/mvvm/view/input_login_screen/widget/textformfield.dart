import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TextFormFieldCustom extends StatefulWidget {
  late TextEditingController controller;
  late String labelText;

   TextFormFieldCustom({Key? key,required this.labelText,  required this.controller}) : super(key: key);

  @override
  State<TextFormFieldCustom> createState() => _TextFormFieldCustomState();
}

class _TextFormFieldCustomState extends State<TextFormFieldCustom> {

  @override
  Widget build(BuildContext context) {
    return Container(
      //width: MediaQuery.of(context).size.width -40,
      decoration:const  BoxDecoration(
          borderRadius:  BorderRadius.all(Radius.circular(28)),
          // border: Border.all(
          //     width: 1,
          //     color: Colors.white
          // ),

        boxShadow:  [
        BoxShadow(
          color: Colors.white,
          blurRadius: 10,
          offset: Offset(0, 5), // Shadow position
        ),
      ],),
      height: 60,
      child: TextFormField(
        controller: widget.controller,
        style: const TextStyle(color: Colors.red),
        decoration: InputDecoration(
          filled: true,
          labelText: widget.labelText,
          fillColor: Colors.blue.shade100,
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25.0),
            borderSide: const BorderSide(
              color: Colors.white,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25.0),
            borderSide: const BorderSide(
              color: Colors.white,
              //width: 2.0,
            ),
          ),
        ),
      ),
    );
  }
}
