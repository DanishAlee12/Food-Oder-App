import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {

  final String btnTxt ;
  
  CustomButton({this.btnTxt});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25.0),
        color: Colors.blueAccent
      ),
      child: Center(
        child: Text( btnTxt, style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18.0,color: Colors.white),),
      ),
    );
  }
}