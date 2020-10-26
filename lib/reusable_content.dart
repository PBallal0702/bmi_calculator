import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {

  ReusableCard({this.childCard,this.childColor});

  final Widget childCard ;
  final Color childColor;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(15) ,
      decoration: BoxDecoration(
          color: childColor,
          borderRadius: BorderRadius.circular(15)
      ),
      child: childCard,
    );
  }
}
