import 'package:hcricket/widget/widgets_exports.dart';

class CostumeOnboard extends StatefulWidget {
  String image;
  String title;
  String subtitle;
  CostumeOnboard(
      {required this.image, required this.title, required this.subtitle});

  @override
  State<CostumeOnboard> createState() => _CostumeOnboardState();
}

class _CostumeOnboardState extends State<CostumeOnboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            12.verticalSpace,
            Image.asset(widget.image),
            25.verticalSpace,
            Padding(
              padding: EdgeInsets.only(left: 20.0.w, right: 20.0.w),
              child: Text(
                widget.title,
                style: Appstyle.textstyle27,
              ),
            ),
            15.verticalSpace,
            Padding(
              padding: EdgeInsets.only(left: 20.0.w, right: 20.0.w),
              child: Text(
                widget.subtitle,
                style: Appstyle.textstyle15,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
