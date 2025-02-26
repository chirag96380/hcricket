import 'package:hcricket/widget/widgets_exports.dart';

class CostumeScoreAppbar extends StatelessWidget {
  String AppBarName;

  CostumeScoreAppbar({required this.AppBarName});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pop(context);
      },
      child: Padding(
        padding: EdgeInsets.all(10.0.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height: 37.h,
              width: 37.h,
              decoration: BoxDecoration(
                color: AppColors.whiteColor.withOpacity(0.04),
                border: Border.all(
                    width: 0.6, color: AppColors.whiteColor.withOpacity(0.2)),
                shape: BoxShape.circle,
              ),
              child: Center(
                child: Padding(
                  padding: EdgeInsets.only(right: 2.w),
                  child: SvgPicture.asset(
                    "assest/icons/ic_back_btn.svg",
                  ),
                ),
              ),
            ),
            Text(
              AppBarName,
              // AppString.matchCoverage,
              style: Appstyle.textstyle18bold,
            ),
            85.horizontalSpace
          ],
        ),
      ),
    );
  }
}
