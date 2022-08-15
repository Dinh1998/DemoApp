import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TextFormFieldCustom extends StatefulWidget {
  late String labelText;
   TextFormFieldCustom({Key? key,required this.labelText}) : super(key: key);

  @override
  State<TextFormFieldCustom> createState() => _TextFormFieldCustomState();
}

class _TextFormFieldCustomState extends State<TextFormFieldCustom> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:  BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(30)),
          border: Border.all(
              width: 1,
              color: Colors.blue
          ),

        boxShadow: const [
        BoxShadow(
          color: Colors.blue,
          blurRadius: 10,
          offset: Offset(0, 2), // Shadow position
        ),
      ],),
      height: 60,
      child: TextFormField(
        style: const TextStyle(color: Colors.red),
        decoration: InputDecoration(


          filled: true,

          labelText: widget.labelText,
          fillColor: Colors.blue.shade100,
          focusedBorder: OutlineInputBorder(

            borderRadius: BorderRadius.circular(25.0),
            borderSide: const BorderSide(
              color: Colors.blue,
            ),
          ),
          enabledBorder: OutlineInputBorder(

            borderRadius: BorderRadius.circular(25.0),
            borderSide: const BorderSide(
              color: Colors.blue,
              width: 2.0,
            ),
          ),
        ),
      ),
    );
  }
}
