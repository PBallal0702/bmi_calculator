import 'package:bmicalci/reusable_content.dart';
import 'package:flutter/material.dart';

class ResultPage extends StatelessWidget {

  ResultPage({this.bmi ,@required this.heading , this.bodyText});

  final String heading ;
  final String bmi;
  final String bodyText;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Title(
          color: Colors.red,
          child: Text(
            'Result'
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Text(
                'Your Result',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 50
                ),
              ),
            ),
            Expanded(
              flex: 5,
              child: ReusableCard(
                childColor: Color(0xFF1D1E33),
                childCard: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      heading,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.green
                      ),
                    ),
                    Text(
                      bmi,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 100
                      ),
                    ),
                    Text(
                      bodyText,
                      textAlign: TextAlign.center,
                      style:TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                      ),
                    )
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: (){
                Navigator.pop(context);
              },
              child: Container(
                child: Center(
                  child: Text(
                    'Re Calculate',
                    style: TextStyle(
                        fontSize: 30
                    ),
                  ),
                ),
                margin: EdgeInsets.only(top:15),
                color: Colors.pink,
                height: 80,
              ),
            )

          ],
        )
      ),
    );
  }
}
