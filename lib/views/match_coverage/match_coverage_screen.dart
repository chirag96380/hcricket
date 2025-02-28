import 'package:gradient_borders/gradient_borders.dart';
import 'package:hcricket/bloc/matche_info_bloc/matche_info_bloc.dart';
import 'package:hcricket/views/view.dart';
import 'package:hcricket/widget/match_coverage/costume_over_bar.dart';
import 'package:hcricket/widget/match_coverage/costume_squads_bar.dart';

import '../../widget/match_coverage/costume_info_bar.dart';
import '../../widget/match_coverage/costume_live_bar.dart';
import '../../widget/match_coverage/costume_scorecard_bar.dart';

class MatchCoverageScreen extends StatefulWidget {
  dynamic team1score;
  dynamic team2score;
  dynamic team1over;
  dynamic team2over;
  dynamic team1wic;
  dynamic team2wic;
  dynamic team1;
  dynamic team2;
  dynamic tem1flag;
  dynamic tem2flag;
  dynamic seriesName;
  dynamic matchId;
  dynamic teamName;
  dynamic matchDesc;
  dynamic endDate;
  dynamic inning;

  MatchCoverageScreen(
      {required this.team1score,
      required this.team2score,
      required this.team1over,
      required this.team2over,
      required this.team1wic,
      required this.team2wic,
      this.team1,
      this.team2,
      this.tem1flag,
      this.tem2flag,
      this.seriesName,
      this.matchId,
      this.teamName,
      this.matchDesc,
      this.endDate,
      this.inning});

  // const MatchCoverageScreen({super.key});

  @override
  State<MatchCoverageScreen> createState() => _MatchCoverageScreenState();
}

class _MatchCoverageScreenState extends State<MatchCoverageScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  late MatchInfoBloc matchInfoBloc;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 5, vsync: this);
    matchInfoBloc =
        MatchInfoBloc(matcheInfoRepository: MatchHttpApiRepository());
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print("widget.endDate ${widget.endDate}");
    return Scaffold(
      body: Stack(children: [
        SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Image.asset(
            AppImagepath.mainBg,
            fit: BoxFit.fill,
          ),
        ),
        SafeArea(
            child: Column(
          children: [
            CostumeScoreAppbar(
              AppBarName: AppString.matchCoverage,
            ),
            Padding(
              padding: EdgeInsets.all(8.0.h),
              child: Stack(
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 8.h),
                    child: Container(
                      height: 140.h,
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(AppImagepath.matchCoverBg))),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SizedBox(
                            width: 120.w,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(5.r),
                                  child: Image.network(
                                    GetImage()
                                        .FlagImage(flagId: widget.tem1flag),
                                    height: 27.h,
                                    fit: BoxFit.cover,
                                    errorBuilder: (context, error, stackTrace) {
                                      return const Icon(Icons.error);
                                    },
                                  ),
                                ),
                                5.verticalSpace,
                                Text(
                                  "${widget.team1}",
                                  style: Appstyle.sptextstyle.copyWith(
                                      fontSize: 13.sp,
                                      color: AppColors.whiteColor
                                          .withOpacity(0.8)),
                                ),
                                3.verticalSpace,
                                Text(
                                  "${widget.team1score}/${widget.team1wic} (${widget.team1over})",
                                  style: Appstyle.textstyle14bold,
                                ),
                              ],
                            ),
                          ),
                          Text(
                            "V/S",
                            style: Appstyle.textstyle15Bold.copyWith(
                                color: AppColors.whiteColor.withOpacity(0.4)),
                          ),
                          SizedBox(
                            width: 120.w,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(5.r),
                                  child: Image.network(
                                    GetImage()
                                        .FlagImage(flagId: widget.tem2flag),
                                    height: 27.h,
                                    fit: BoxFit.cover,
                                    errorBuilder: (context, error, stackTrace) {
                                      return const Icon(Icons.error);
                                    },
                                  ),
                                ),
                                5.verticalSpace,
                                Text(
                                  "${widget.team2}",
                                  style: Appstyle.sptextstyle.copyWith(
                                      fontSize: 13.sp,
                                      color: AppColors.whiteColor
                                          .withOpacity(0.8)),
                                ),
                                3.verticalSpace,
                                Text(
                                  "${widget.team2score}/${widget.team2wic} (${widget.team2over})",
                                  // "127/2 (42.5)",
                                  style: Appstyle.textstyle14bold,
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 30.w),
                        height: 18.h,
                        width: 56.w,
                        decoration: BoxDecoration(
                          color: AppColors.cricektColor,
                          borderRadius: BorderRadius.circular(12.r),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            LottieBuilder.asset(
                              Applottiepath.livestatus,
                              height: 10.h,
                            ),
                            5.horizontalSpace,
                            Text(
                              AppString.live,
                              style: Appstyle.textstyle8,
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(right: 30.w),
                        height: 18.h,
                        width: 70.w,
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 11, 122, 14),
                          borderRadius: BorderRadius.circular(12.r),
                        ),
                        child: Center(
                          child: Text(
                            widget.matchDesc,
                            style: Appstyle.textStyle10,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      margin: EdgeInsets.only(top: 132.h),
                      height: 27.h,
                      width: 270.w,
                      decoration: BoxDecoration(
                          border: Border.all(
                              width: 1,
                              color: AppColors.borderColor.withOpacity(0.6)),
                          color: AppColors.primarycolor,
                          borderRadius: BorderRadius.circular(12.r)),
                      child: Center(
                        child: Text(
                          widget.seriesName ?? "Match 01 - World Cup ODI 2020",
                          textAlign: TextAlign.center,
                          style: Appstyle.textstyle11Regular
                              .copyWith(color: AppColors.whiteColor),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            12.verticalSpace,
            Expanded(
              child: Stack(children: [
                Container(
                  margin: EdgeInsets.zero,
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    children: [
                      Image.asset("assest/images/tab_bar_bg.png"),
                      Expanded(
                        child: Container(
                          color: AppColors.whiteColor.withOpacity(0.04),
                        ),
                      )
                    ],
                  ),
                ),
                Column(
                  children: [
                    20.verticalSpace,
                    SizedBox(
                      height: 30.h,
                      child: Padding(
                        padding: EdgeInsets.only(left: 3.w, right: 3.w),
                        child: TabBar(
                          splashFactory: InkRipple.splashFactory,
                          tabAlignment: TabAlignment.start,
                          padding: EdgeInsets.zero,
                          isScrollable: true,
                          controller: _tabController,
                          indicator: BoxDecoration(
                            gradient: const LinearGradient(colors: [
                              Color.fromARGB(243, 99, 101, 241),
                              Color.fromARGB(133, 99, 101, 241),
                            ]),
                            borderRadius: BorderRadius.circular(8.r),
                          ),
                          indicatorSize: TabBarIndicatorSize.label,
                          labelColor: Colors.white.withOpacity(0.6),
                          unselectedLabelColor:
                              AppColors.whiteColor.withOpacity(0.6),
                          labelStyle: Appstyle.textstyle13,
                          unselectedLabelStyle: Appstyle.textstyle13Regular,
                          indicatorPadding: EdgeInsets.all(0.9.h),
                          labelPadding: EdgeInsets.symmetric(horizontal: 10.w),
                          tabs: [
                            _buildTab(title: AppString.t_live),
                            _buildTab(title: AppString.t_info),
                            _buildTab(title: AppString.t_scorecard),
                            _buildTab(title: AppString.t_squads),
                            _buildTab(title: AppString.t_overs),
                          ],
                          dividerColor: Colors.transparent,
                        ),
                      ),
                    ),
                    Expanded(
                      child: TabBarView(
                        controller: _tabController,
                        children: [
                          CostumeLiveBar(
                            matchId: widget.matchId,
                            teamName: widget.team1,
                          ),
                          CostumeInfoBar(
                            matchId: widget.matchId,
                          ),
                          CostumeScorecardBar(),
                          CostumeSquadsBar(
                            matchId: widget.matchId,
                          ),
                          CostumeOverBar(
                            matchId: widget.matchId,
                            endDate: widget.endDate,
                            inning: widget.inning,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ]),
            )
          ],
        )),
      ]),
    );
  }

  Widget _buildTab({
    required String title,
  }) {
    return Container(
      height: 30.h,
      padding: EdgeInsets.symmetric(
          horizontal: 18.w, vertical: 6.h), // Proper padding for tab
      decoration: BoxDecoration(
        border: const GradientBoxBorder(
          gradient: LinearGradient(colors: [
            Color(0xff6366F1),
            Color.fromARGB(133, 99, 101, 241),
          ]),
          width: 1,
        ),
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Text(
        title,
      ),
    );
  }
}
