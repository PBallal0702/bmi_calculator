
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'icon_content.dart';
import 'reusable_content.dart';
import 'result_page.dart';
import 'bmi_brain.dart';


const activeCardColor = Color(0xFF1D1E33);
const inactiveCardColor = Color(0xFF111328);

enum Gender{
  male,
  female,
}
int height = 160;
int weight = 60;
int age = 20;

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {


  Gender selectedGender ;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('BMI CALCULATOR')),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
             Expanded(
                 child: Row(
               children: [
                 Expanded(
                   child: GestureDetector(
                     onTap: (){
                       setState(() {
                         selectedGender= Gender.male;
                       });
                     },
                     child:  ReusableCard(
                       childColor: selectedGender == Gender.male?activeCardColor: inactiveCardColor,
                       childCard:  IconContent(FontAwesomeIcons.mars,'Male'),
                     ),
                   )

                 ),
                 Expanded(
                   child: GestureDetector(
                     onTap: (){
                       setState(() {
                         selectedGender = Gender.female;
                       });
                     },
                     child:  ReusableCard(
                       childColor: selectedGender == Gender.female?activeCardColor: inactiveCardColor,
                       childCard:  IconContent(FontAwesomeIcons.venus, 'Female'),
                     ),
    )
                 )
               ],
             )),
           Expanded(
            child: new ReusableCard(
              childColor: inactiveCardColor,
              childCard: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Height',
                    style: TextStyle(
                          color: Color(0xFF8D8E98),
                          fontSize: 30
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        height.toString(),
                        style: TextStyle(
                          color: Color(0xFF8D8E98),
                          fontSize: 40,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                      Text(
                        'cm',
                        style: TextStyle(
                            color: Color(0xFF8D8E98),
                            fontWeight: FontWeight.w900
                        ),
                      )
                    ],
                  ),
                  Slider(
                    value: height.toDouble(),
                    min: 50,
                    max: 220,
                    activeColor: Color(0xFFEB1555),
                    inactiveColor: Color(0xFF8D8E98),
                    onChanged: (double newValue){
                      setState(() {
                        height = newValue.round();
                      });

                    },
                  )

                ],
              ),
            )
          ),
          Expanded(
              child: Row(
            children: [
              Expanded(
                  child: new ReusableCard(
                    childColor: inactiveCardColor,
                    childCard: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Weight',
                          style: TextStyle(
                              color: Color(0xFF8D8E98),
                              fontSize: 20
                          ),
                        ),
                        Text(
                          weight.toString(),
                          style: TextStyle(
                            color: Color(0xFF8D8E98),
                            fontSize: 40,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                       Row(
                         mainAxisAlignment: MainAxisAlignment.center,
                         children: [
                           RoundIconButton(
                             icon: FontAwesomeIcons.minus,
                             onPressed: (){
                               setState(() {
                                 weight--;
                               });
                             },
                           ),
                           SizedBox(
                             width: 10,
                           ),
                           RoundIconButton(
                             icon: FontAwesomeIcons.plus,
                             onPressed: (){
                               setState(() {
                                 weight++;
                               });
                             },
                           )
                         ],
                       )
                      ],
                    )
                  )
              ),
              Expanded(
                  child: new ReusableCard(
                    childColor: inactiveCardColor,
                    childCard: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Age',
                          style: TextStyle(
                              color: Color(0xFF8D8E98),
                              fontSize: 20
                          ),
                        ),
                        Text(
                          age.toString(),
                          style: TextStyle(
                            color: Color(0xFF8D8E98),
                            fontSize: 40,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              onPressed: (){
                                setState(() {
                                  age--;
                                });
                              },
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            RoundIconButton(
                              icon: FontAwesomeIcons.plus,
                              onPressed: (){
                                setState(() {
                                  age++;
                                });
                              },
                            )
                          ],
                        )
                      ],
                    ),
                  )
              )
            ],
          )
          ),
          GestureDetector(
            onTap: (){

              BmiBrain calc = BmiBrain(height ,weight);
              Navigator.push(context, MaterialPageRoute(
                builder: (context)=>ResultPage(
                  bmi: calc.getBmi(),
                  heading: calc.getHeadText(),
                  bodyText: calc.getBodyText(),
                )
              ));
            },
            child: Container(
              child: Center(
                child: Text(
                  'Calculate',
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
      ),
      
    );
  }
}

class RoundIconButton extends StatelessWidget {
  RoundIconButton({@required this.icon,@required this.onPressed});
  final IconData icon;
  final Function onPressed ;
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(icon),
      onPressed: onPressed,
      constraints: BoxConstraints.tightFor(
        width: 52.0,
        height: 52.0
      ),
      elevation: 6.0,
      shape:CircleBorder() ,
      fillColor: Color(0xFF4C4F5E),
    );
  }
}
