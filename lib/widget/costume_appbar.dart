

import 'package:hcricket/widget/widgets_exports.dart';


class CostumeAppbar extends StatefulWidget {
  String routesName;
  CostumeAppbar({required this.routesName});

  @override
  State<CostumeAppbar> createState() => _CostumeAppbarState();
}

class _CostumeAppbarState extends State<CostumeAppbar> {
  // final String routesName = ;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 130.h,
      child: Stack(
        children: [
          Transform.scale(
            scaleY: 1.w,
            scaleX: 1.01.w,
            child: Image.asset(
              AppImagepath.appBar,
            ),
          ),
          Center(
            child: Padding(
              padding: EdgeInsets.only(top: 25.0.h, left: 12.w, right: 12.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        backgroundImage:
                            const AssetImage(AppImagepath.appbarLogo),
                        radius: 24.r,
                      ),
                      10.horizontalSpace,
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            AppString.appName,
                            style: Appstyle.textstyle17bold.copyWith(
                                color: Colors.white.withOpacity(0.8),
                                fontSize: 19.sp),
                          ),
                          Text(
                            AppString.Goodmoring,
                            style: Appstyle.textStyle12regular.copyWith(
                                color: AppColors.whiteColor.withOpacity(0.4),
                                fontSize: 13.sp),
                          ),
                        ],
                      )
                    ],
                  ),
                  // routesName != false
                  //     ?
                  if (widget.routesName == RoutesName.HomeScreen ||
                      widget.routesName == RoutesName.newsScreen) 
                    Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColors.notificationbgColor.withOpacity(0.1),
                      ),
                      width: 40.h,
                      height: 40.h,
                      child: Padding(
                        padding: EdgeInsets.all(12.0.sp),
                        child: SvgPicture.asset(AppImagepath.notiIcon),
                      ),
                    ),
                  if (widget.routesName == RoutesName.GameScreen)
                    Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30.r),
                            color:
                                AppColors.notificationbgColor.withOpacity(0.1),
                            border: Border.all(
                              width: 1,
                              color: AppColors.notificationbgColor
                                  .withOpacity(0.3),
                            )),
                        width: 90.h,
                        height: 30.h,
                        child: Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(AppString.coin,
                                  style: Appstyle.textStyle12regular.copyWith(
                                    color:
                                        AppColors.whiteColor.withOpacity(0.8),
                                    fontSize: 15.sp,
                                  )),
                              Padding(
                                padding: EdgeInsets.all(4.0.h),
                                child: Image.asset(AppImagepath.coin),
                              ),
                            ],
                          ),
                        ))
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
