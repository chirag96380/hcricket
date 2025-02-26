import 'package:hcricket/widget/widgets_exports.dart';

class Costumebtn extends StatelessWidget {
  String btname;
  Costumebtn({super.key, required this.btname});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.r),
        color: AppColors.primarycolor,
      ),
      height: 50.h,
      width: 175.w,
      child: Center(
          child: Text(
        btname,
        style: Appstyle.textstyle17,
      )),
    );
  }
}
