import 'dart:math';

class BmiBrain {

  BmiBrain(this.height ,this.weight);
  int height ;
  int weight ;

  double _bmi = 0;

  String getBmi(){
    _bmi = weight/pow(height/100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String getHeadText (){
    if(_bmi >= 25){
      return 'Overweight';
    }
    else if(_bmi < 17){
      return 'UnderWeight';
    }
    else{
      return 'Normal';
    }
  }
  String getBodyText(){
    if(_bmi >= 25){
      return 'You are Overweight , try to do  more exercise';
    }
    else if(_bmi < 17){
      return 'You are UnderWeight , try to gain some weight';
    }
    else{
      return 'You are fit keep it up';
    }

  }

}