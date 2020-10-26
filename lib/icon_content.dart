import 'package:flutter/material.dart';

class IconContent extends StatelessWidget {

  IconContent(
      this.icon,
      this.label
      );
  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            size: 80,
          ),
          SizedBox(
            height: 15,
          ),
          Text(label,
            style: TextStyle(
                color: Color(0xFF8D8E98),
                fontSize: 20
            ),
          )
        ],
      ),
    );
  }
}
