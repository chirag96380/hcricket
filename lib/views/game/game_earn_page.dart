import 'package:hcricket/views/view.dart';

class GameEarnPage extends StatelessWidget {
  const GameEarnPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(90.h),
            child: CostumeAppbar(
              routesName: RoutesName.GameScreen,
            ),
          ),
          body: Padding(
            padding: EdgeInsets.only(left: 12.w, right: 12.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                5.verticalSpace,
                Text(
                  AppString.games,
                  style: Appstyle.textstyle15Bold,
                ),
                5.verticalSpace,
                Image.asset(AppImagepath.getcoin),
                15.verticalSpace,
                Image.asset(AppImagepath.dailybonus),
                15.verticalSpace,
                Image.asset(AppImagepath.games),
              ],
            ),
          ),
        ),
        Container(
          color: AppColors.backgroundColor.withOpacity(0.8),
        ),
        ElasticInUp(
          child: Center(
            child: Image.asset(
              'assest/images/coming-soon1.png',
              height: 550.h,
            ),
          ),
        ),
        Center(
          child: Padding(
              padding:
                  EdgeInsets.only(top: MediaQuery.of(context).size.height / 2),
              child: Bounce(
                child: Image.asset(
                  'assest/images/Coming Soon@2x (2).png',
                  height: 60.h,
                  width: 270.w,
                ),
              )),
        ),
      ],
    );
  }
}
