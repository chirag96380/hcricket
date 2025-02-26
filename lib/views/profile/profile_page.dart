import 'package:hcricket/views/view.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Padding(
              padding: EdgeInsets.only(
                left: 18.w,
                right: 18.w,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  40.verticalSpace,
                  Row(
                    children: [
                      CircleAvatar(
                        backgroundImage:
                            const AssetImage(AppImagepath.appbarLogo),
                        radius: 28.r,
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
                        ],
                      )
                    ],
                  ),
                  25.verticalSpace,
                  Text(
                    "Profile",
                    style: Appstyle.textstyle25bold
                        .copyWith(color: AppColors.whiteColor.withOpacity(0.4)),
                  ),
                ],
              ),
            ),
            Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  height: 430.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(25.r),
                        topRight: Radius.circular(25.r)),
                    color: AppColors.fantasyColor.withOpacity(0.2),
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(top: 20.0.h),
                    child: ListView.builder(
                      itemCount: profileTabs.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Padding(
                          padding: EdgeInsets.only(top: 8.0.h, bottom: 5.h),
                          child: Container(
                            height: 60.h,
                            decoration: const BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage(
                                        'assest/images/series_bg.png'))),
                            child: ConstumeProfileTab(
                              image: profileTabs[index].Icon.toString(),
                              title: profileTabs[index].title.toString(),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
