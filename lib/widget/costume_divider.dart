import 'package:hcricket/widget/widgets_exports.dart';

class CostumeDivider extends StatelessWidget {
  const CostumeDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        left: 10.w,
        right: 10.w,
      ),
      height: 1.h,
      decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
        const Color(0xff999999).withOpacity(0.3),
        const Color(0xffFFFFFF),
        const Color(0xff999999).withOpacity(0.3),
      ])),
    );
  }
}

class CostumeSecondDivider extends StatelessWidget {
  const CostumeSecondDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        left: 10.w,
        right: 10.w,
      ),
      height: 1.h,
      decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
        const Color(0xff999999).withOpacity(0.1),
        const Color(0xffFFFFFF).withOpacity(0.4),
        const Color(0xff999999).withOpacity(0.1),
      ])),
    );
  }
}
