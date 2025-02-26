import 'package:hcricket/views/view.dart';

class SpalshScreen extends StatefulWidget {
  const SpalshScreen({super.key});

  @override
  State<SpalshScreen> createState() => _SpalshScreenState();
}

class _SpalshScreenState extends State<SpalshScreen>
    with SingleTickerProviderStateMixin {
  late ScrollController _scrollController1;
  late ScrollController _scrollController2;
  late ScrollController _scrollController3;
  late ScrollController _scrollController4;
  late ScrollController _scrollController5;
  late AnimationController _animationController;

  final SplashServices _splashServices = SplashServices();

  bool liveline = false;

  final List<String> firsttags = [
    "Live Match",
    "Earn Money",
    "Cricket",
    "Play Games",
    "Fantasy",
    "Games",
    "Live Line",
    "Trophy"
  ];

  final List<String> twoApptags = [
    "Live Line",
    "Games",
    "Trophy",
    "Cricket",
    "Earn Money",
    "Play Games",
    "Fantasy",
    "Live Match",
  ];

  final List<String> threeApptags = [
    "Live Match",
    "Cricket",
    "Live Line",
    "Games",
    "Trophy",
    "Fantasy",
    "Play Games",
    "Earn Money",
  ];

  final List<String> fourApptags = [
    "Trophy",
    "Cricket",
    "Play Games",
    "Live Line",
    "Live Match",
    "Earn Money",
    "Games",
    "Fantasy",
  ];

  final List<String> fiveApptags = [
    "Live Line",
    "Earn Money",
    "Play Games",
    "Fantasy",
    "Trophy",
    "Cricket",
    "Games",
    "Live Match",
  ];

  @override
  void initState() {
    super.initState();
    _scrollController1 = ScrollController();
    _scrollController2 = ScrollController();
    _scrollController3 = ScrollController();
    _scrollController4 = ScrollController();
    _scrollController5 = ScrollController();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 15),
    )..addListener(() {
        if (_scrollController1.hasClients) {
          _scrollController1.jumpTo(
            _animationController.value *
                _scrollController1.position.maxScrollExtent,
          );
        }

        if (_scrollController2.hasClients) {
          _scrollController2.jumpTo(
            _scrollController2.position.maxScrollExtent -
                (_animationController.value *
                    _scrollController2.position.maxScrollExtent),
          );
        }

        if (_scrollController3.hasClients) {
          _scrollController3.jumpTo(
            _animationController.value *
                _scrollController3.position.maxScrollExtent,
          );
        }

        if (_scrollController4.hasClients) {
          _scrollController4.jumpTo(
            _scrollController4.position.maxScrollExtent -
                (_animationController.value *
                    _scrollController4.position.maxScrollExtent),
          );
        }

        if (_scrollController5.hasClients) {
          _scrollController5.jumpTo(
            _animationController.value *
                _scrollController5.position.maxScrollExtent,
          );
        }
      });

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _animationController.repeat();
    });

    _splashServices.splashScreen(context);
  }

  @override
  void dispose() {
    _scrollController1.dispose();
    _scrollController2.dispose();
    _scrollController3.dispose();
    _scrollController4.dispose();
    _scrollController5.dispose();
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Column(
          children: [
            SizedBox(
              height: 40.h,
              child: Transform.rotate(
                  angle: 12.0,
                  child: Transform.scale(
                    scale: 1.35,
                    child: ListView.builder(
                        controller: _scrollController1,
                        scrollDirection: Axis.horizontal,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: twoApptags.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Container(
                            margin: EdgeInsets.symmetric(horizontal: 8.0.w),
                            width: 144.w,
                            decoration: BoxDecoration(
                                color: firsttags[index] == "Fantasy"
                                    ? AppColors.fantasyColor
                                    : firsttags[index] == "Live Line"
                                        ? const Color.fromARGB(255, 6, 7, 21)
                                        : firsttags[index] == "Cricket"
                                            ? AppColors.cricektColor
                                            : const Color.fromARGB(
                                                31, 64, 64, 64),
                                borderRadius: BorderRadius.circular(13.0.r),
                                border: Border.all(
                                    color: AppColors.whiteColor, width: 0.2)),
                            child: Center(
                              child: Text(twoApptags[index],
                                  style: Appstyle.sptextstyle),
                            ),
                          );
                        }),
                  )),
            ),
            60.verticalSpace,
            SizedBox(
                height: 40.h,
                child: Transform.rotate(
                  angle: 12.0,
                  child: Transform.scale(
                    scale: 1.35,
                    child: ListView.builder(
                        controller: _scrollController2,
                        scrollDirection: Axis.horizontal,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: threeApptags.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Container(
                            margin: EdgeInsets.symmetric(horizontal: 8.0.w),
                            padding: const EdgeInsets.all(12.0),
                            width: 144.w,
                            decoration: BoxDecoration(
                                color: twoApptags[index] == "Fantasy"
                                    ? AppColors.fantasyColor
                                    : twoApptags[index] == "Live Line"
                                        ? const Color.fromARGB(255, 6, 7, 21)
                                        : twoApptags[index] == "Cricket"
                                            ? AppColors.cricektColor
                                            : const Color.fromARGB(
                                                31, 64, 64, 64),
                                borderRadius: BorderRadius.circular(14.0.r),
                                border: Border.all(
                                    color: AppColors.whiteColor, width: 0.2)),
                            child: Center(
                              child: Text(threeApptags[index],
                                  style: Appstyle.sptextstyle),
                            ),
                          );
                        }),
                  ),
                )),
            60.verticalSpace,
            SizedBox(
              height: 40.h,
              child: Transform.rotate(
                  angle: 12.0,
                  child: Transform.scale(
                    scale: 1.35,
                    child: ListView.builder(
                        controller: _scrollController3,
                        scrollDirection: Axis.horizontal,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: fourApptags.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Container(
                            margin: EdgeInsets.symmetric(horizontal: 8.0.w),
                            width: 144.w,
                            decoration: BoxDecoration(
                                color: threeApptags[index] == "Fantasy"
                                    ? AppColors.fantasyColor
                                    : threeApptags[index] == "Live Line"
                                        ? const Color.fromARGB(255, 6, 7, 21)
                                        : threeApptags[index] == "Cricket"
                                            ? AppColors.cricektColor
                                            : const Color.fromARGB(
                                                31, 64, 64, 64),
                                borderRadius: BorderRadius.circular(13.0.r),
                                border: Border.all(
                                    color: AppColors.whiteColor, width: 0.2)),
                            child: Center(
                              child: Text(fourApptags[index],
                                  style: Appstyle.sptextstyle),
                            ),
                          );
                        }),
                  )),
            ),
            60.verticalSpace,
            SizedBox(
                height: 40.h,
                child: Transform.rotate(
                  angle: 12.0,
                  child: Transform.scale(
                    scale: 1.35,
                    child: ListView.builder(
                        controller: _scrollController4,
                        scrollDirection: Axis.horizontal,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: fourApptags.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Container(
                            margin: EdgeInsets.symmetric(horizontal: 8.0.w),
                            padding: const EdgeInsets.all(12.0),
                            width: 144.w,
                            decoration: BoxDecoration(
                                color: fourApptags[index] == "Fantasy"
                                    ? AppColors.fantasyColor
                                    : fourApptags[index] == "Live Line"
                                        ? const Color.fromARGB(255, 6, 7, 21)
                                        : fourApptags[index] == "Cricket"
                                            ? AppColors.cricektColor
                                            : const Color.fromARGB(
                                                31, 64, 64, 64),
                                borderRadius: BorderRadius.circular(14.0.r),
                                border: Border.all(
                                    color: AppColors.whiteColor, width: 0.2)),
                            child: Center(
                              child: Text(fourApptags[index],
                                  style: Appstyle.sptextstyle),
                            ),
                          );
                        }),
                  ),
                )),
            60.verticalSpace,
            SizedBox(
                height: 40.h,
                child: Transform.rotate(
                  angle: 12.0,
                  child: Transform.scale(
                    scale: 1.35,
                    child: ListView.builder(
                        controller: _scrollController5,
                        scrollDirection: Axis.horizontal,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: fiveApptags.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Container(
                            margin: EdgeInsets.symmetric(horizontal: 8.0.w),
                            padding: const EdgeInsets.all(12.0),
                            width: 144.w,
                            decoration: BoxDecoration(
                                color: fiveApptags[index] == "Fantasy"
                                    ? AppColors.fantasyColor
                                    : fiveApptags[index] == "Live Line"
                                        ? const Color.fromARGB(255, 6, 7, 21)
                                        : fiveApptags[index] == "Cricket"
                                            ? AppColors.cricektColor
                                            : const Color.fromARGB(
                                                31, 64, 64, 64),
                                borderRadius: BorderRadius.circular(14.0.r),
                                border: Border.all(
                                    color: AppColors.whiteColor, width: 0.2)),
                            child: Center(
                              child: Text(fourApptags[index],
                                  style: Appstyle.sptextstyle),
                            ),
                          );
                        }),
                  ),
                )),
          ],
        ),
        Container(
          decoration: const BoxDecoration(gradient: AppColors.bgradient),
        ),
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              280.verticalSpace,
              Image.asset(AppImagepath.appLogo),
              170.verticalSpace,
              Text("Choose Your", style: Appstyle.textstyle27),
              Text(
                "Find Best Musicians All",
                style: Appstyle.textstyle22,
              ),
              Lottie.asset(Applottiepath.spDot, height: 80.h),
              Text(
                "Get Started",
                style: TextStyle(color: AppColors.whiteColor.withOpacity(0.3)),
              ),
            ],
          ),
        )
      ],
    ));
  }
}
