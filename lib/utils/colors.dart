import 'package:hcricket/utils/utils_exports.dart';

class AppColors {
  static const primarycolor = Color(0xFF6366F1);

  static const backgroundColor = Color(0xff0F1124);
  static const whiteColor = Color(0xffffffff);
  static const bottombarColor = Color(0xff1A1B2E);
  static const borderColor = Color(0xffA6A6A6);

  static const gameborderColor = Color(0xff4285F4);
  static const transparentColor = Color(0x00000000);

  static const notificationbgColor = Color(0xffD9D9D9);

  static const splashGradint1 = Color.fromARGB(142, 16, 17, 31);
  static const splashGradint2 = Color.fromARGB(255, 13, 14, 27);
  static const splashGradint3 = Color.fromARGB(206, 13, 15, 29);
  static const splashGradint4 = Color.fromARGB(228, 16, 17, 33);

  static const splashGradint6 = Color(0xff1A1B2E);
  static const primaryText = Color(0xff8889FF);

  static const forText = Color.fromARGB(255, 136, 255, 144);

  //tabs
  static const livelineColor = Color(0xff0F1124);
  static const fantasyColor = Color(0xFF303879);
  static const cricektColor = Color(0xffE33A46);


  static const coverageBoxColor = Color(0xff999999);

  static const redColor = Colors.red;
  static const orangeColor = Colors.orange;
  static const blueColor = Colors.blue;
  static const purpleColor = Colors.purple;
  static const cyanColor = Colors.cyan;
  static const greenColor = Colors.green;
  static const deepPurpleColor = Colors.deepPurple;
  static const yellowColor = Colors.yellow;
  static const pinkColor = Colors.pink;

  static const brownColor = Colors.brown;
  static const tealColor = Colors.teal;

  static const greyColor = Colors.grey;

  static const bgradient = LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      stops: [
        0.0,
        0.7,
        1,
        0.0
      ],
      colors: [
        AppColors.splashGradint1,
        AppColors.splashGradint2,
        AppColors.splashGradint3,
        AppColors.splashGradint4,
      ]);

  static const gamegradient = LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [
        Color(0xff6465F0),
        Color(0xff4848D1),
      ]);

  static const seriesgradient = LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomCenter,
      colors: [
        Color(0xff6366F1),
        Color.fromARGB(133, 99, 101, 241),
      ]);

  static const nextgradient = LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [
        Color.fromARGB(101, 99, 101, 241),
        Color.fromARGB(133, 99, 101, 241),
      ]);

  static const matchCoveragegradient = LinearGradient(
      begin: Alignment.topRight,
      end: Alignment.bottomLeft,
      colors: [
        Color.fromARGB(64, 153, 153, 153),
        Color.fromARGB(216, 255, 255, 255),
        Color.fromARGB(64, 153, 153, 153),
      ]);

  static const scoreCoveragegradient = LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomCenter,
      colors: [
        Color.fromARGB(129, 255, 255, 255),
        Color.fromARGB(155, 153, 153, 153),
        Color.fromARGB(64, 153, 153, 153),
        Color.fromARGB(19, 153, 153, 153),
        Color.fromARGB(3, 153, 153, 153)
      ]);

  static const blowerCoveragegradient = LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [
        Color.fromARGB(129, 255, 255, 255),
        Color.fromARGB(0, 153, 153, 153),
        Color.fromARGB(0, 153, 153, 153),
        Color.fromARGB(0, 153, 153, 153)
      ]);



  





  
}
