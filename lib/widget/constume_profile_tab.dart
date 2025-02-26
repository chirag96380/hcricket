import 'package:hcricket/widget/widgets_exports.dart';

class ConstumeProfileTab extends StatelessWidget {
  // const ConstumeProfileTab({super.key});
  String image;
  String title;
  ConstumeProfileTab({required this.image, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 16.w,
        right: 16.w,
      ),
      child: Padding(
        padding: EdgeInsets.all(8.0.h),
        child: Row(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 5.0.h),
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.notificationbgColor.withOpacity(0.1),
                ),
                height: 40.h,
                width: 40.h,
                child: Padding(
                  padding: EdgeInsets.all(8.0.h),
                  child: SvgPicture.asset(
                    image,
                    color: AppColors.whiteColor.withOpacity(0.4),
                  ),
                ),
              ),
            ),
            20.horizontalSpace,
            Text(
              title,
              style: Appstyle.textstyle15,
            ),
            const Spacer(),
            Padding(
                padding: EdgeInsets.only(right: 5.0.h),
                child: RotatedBox(
                    quarterTurns: 6,
                    child: Icon(
                      size: 18.h,
                      Icons.arrow_back_ios_outlined,
                      color: AppColors.notificationbgColor,
                    )))
          ],
        ),
      ),
    );
  }
}
