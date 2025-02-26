import 'package:hcricket/views/upcoming/upcoming_matches_page.dart';
import 'package:hcricket/widget/widgets_exports.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({super.key});

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  int _currentIndex = 0;
  final PageController _pageController = PageController();

  final List<Widget> _pages = const [
    HomePage(),
    UpcomingPage(),
    NewsPage(),
    ProfilePage(),
  ];

  bool _isScrollable(int page) {
    return page != 0 && page != 1 && page != 2 && page != 3;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      appBar: _currentIndex == 3
          ? null
          : PreferredSize(
              preferredSize: Size.fromHeight(90.h),
              child: CostumeAppbar(
                routesName: RoutesName.HomeScreen,
              ),
            ),
      body: PageView(
        allowImplicitScrolling: true,
        controller: _pageController,
        physics: _isScrollable(_currentIndex)
            ? const AlwaysScrollableScrollPhysics()
            : const NeverScrollableScrollPhysics(),
        onPageChanged: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        children: _pages,
      ),
      bottomNavigationBar: Container(
        height: MediaQuery.of(context).size.height / 10,
        decoration: BoxDecoration(
          boxShadow: const [
            BoxShadow(
              color: AppColors.primarycolor,
              blurRadius: 50,
              spreadRadius: 5,
              offset: Offset(0, 3),
            )
          ],
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(26),
            topRight: Radius.circular(26),
          ),
          border: Border(
            top: BorderSide(
                color: AppColors.borderColor.withOpacity(0.5), width: 1.5),
          ),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(27.r),
            topRight: Radius.circular(27.r),
          ),
          child: Theme(
            data: ThemeData(
              splashColor: AppColors.transparentColor,
              highlightColor: AppColors.transparentColor,
              bottomNavigationBarTheme: const BottomNavigationBarThemeData(
                backgroundColor: AppColors.bottombarColor,
              ),
            ),
            child: BottomNavigationBar(
              currentIndex: _currentIndex,
              type: BottomNavigationBarType.fixed,
              unselectedItemColor: AppColors.whiteColor.withOpacity(0.5),
              selectedItemColor: AppColors.primarycolor,
              selectedLabelStyle: Appstyle.textStyle12,
              unselectedLabelStyle: Appstyle.textStyle12regular,
              onTap: (index) {
                setState(() {
                  _currentIndex = index;
                });
                _pageController.animateToPage(
                  index,
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                );
              },
              items: [
                BottomNavigationBarItem(
                  icon: SizedBox(
                    height: 22.h,
                    child: SvgPicture.asset(
                      AppImagepath.homeIcon,
                      height: 18.h,
                    ),
                  ),
                  label: AppString.home,
                  activeIcon: SizedBox(
                    height: 22.h,
                    child: SvgPicture.asset(
                      AppImagepath.activehomeIcon,
                      height: 18.h,
                      color: AppColors.primarycolor,
                    ),
                  ),
                ),
                BottomNavigationBarItem(
                  icon: Padding(
                    padding: EdgeInsets.only(right: 35.0.w),
                    child: SvgPicture.asset(
                      AppImagepath.seriesIcon,
                      height: 20.h,
                    ),
                  ),
                  label: AppString.upcoming,
                  activeIcon: SizedBox(
                      height: 22.h,
                      child: Padding(
                        padding: EdgeInsets.only(right: 35.0.w),
                        child: SvgPicture.asset(
                          AppImagepath.seriesIcon,
                          height: 18.h,
                          color: AppColors.primarycolor,
                        ),
                      )),
                ),
                BottomNavigationBarItem(
                  icon: Padding(
                    padding: EdgeInsets.only(left: 35.0.w),
                    child: SvgPicture.asset(
                      AppImagepath.newsIcon,
                      height: 17.h,
                    ),
                  ),
                  label: AppString.news,
                  activeIcon: Padding(
                      padding: EdgeInsets.only(left: 35.0.w),
                      child: SizedBox(
                        height: 22.h,
                        child: SvgPicture.asset(
                          AppImagepath.newsIcon,
                          height: 18.h,
                          color: AppColors.primarycolor,
                        ),
                      )),
                ),
                BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                    AppImagepath.profileIcon,
                    height: 16.h,
                  ),
                  label: AppString.profile,
                  activeIcon: SizedBox(
                    height: 22.h,
                    child: SvgPicture.asset(
                      AppImagepath.profileIcon,
                      height: 18.h,
                      color: AppColors.primarycolor,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: const GamesBtn(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
