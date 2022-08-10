import 'dart:ui';

class GradientColor{

  List<Color> gradientColors1 = [
    Color(0xffFFC48D),
    Color(0xffAB5200),
  ];

  List<Color> gradientColors2 = [
    Color(0xff76FFD6),
    Color(0xff097400),
  ];

  List<Color> gradientColors3 = [
    Color(0xffF4FF76),
    Color(0xff746F00),
  ];

  List<Color> gradientColors4 = [
    Color(0xff76E6FF),
    Color(0xff005F74),
  ];

  List<Color> gradientColors5 = [
    Color(0xffFF5EBE),
    Color(0xff9B0070),
  ];

  List colorsList=[];

  GradientColor(){
    colorsList.add(gradientColors1); // 0
    colorsList.add(gradientColors2); // 1
    colorsList.add(gradientColors3); // 2
    colorsList.add(gradientColors4); // 3
    colorsList.add(gradientColors5); // 4
  }

}