import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:hcricket/bloc/score_card_bloc/score_card_bloc.dart';
import 'package:hcricket/bloc/score_card_bloc/score_card_event.dart';
import 'package:hcricket/bloc/score_card_bloc/score_card_state.dart';
import 'package:hcricket/widget/costume_divider.dart';
import 'package:hcricket/widget/match_coverage/scorecard/batter_score_team_one.dart';
import 'package:hcricket/widget/match_coverage/scorecard/batter_score_team_two.dart';
import 'package:hcricket/widget/match_coverage/scorecard/bowler_score_team_one.dart';
import 'package:hcricket/widget/match_coverage/scorecard/bowler_score_team_two.dart';
import 'package:hcricket/widget/widgets_exports.dart';

class CostumeScorecardBar extends StatefulWidget {
  @override
  State<CostumeScorecardBar> createState() => _CostumeScorecardBarState();
}

class _CostumeScorecardBarState extends State<CostumeScorecardBar> {
  late ScoreCardBloc scoreCardBloc;

  @override
  void initState() {
    super.initState();
    scoreCardBloc =
        ScoreCardBloc(scoreCardRepository: MatchHttpApiRepository());
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => scoreCardBloc..add(GetScoreCard()),
        child: BlocBuilder<ScoreCardBloc, ScoreCardState>(
            builder: (context, state) {
          return Padding(
              padding: EdgeInsets.only(
                  top: 10.h, left: 10.w, right: 10.w, bottom: 10.w),
              child: Container(
                  height: 95.h,
                  width: 80.w,
                  decoration: BoxDecoration(
                      border: const GradientBoxBorder(
                        gradient: AppColors.matchCoveragegradient,
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(30.r)),
                  child: SingleChildScrollView(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(
                                left: 25.w, right: 25.w, top: 20.h),
                            child: Text(
                              state.scoreCard.data?.status.toString() ??
                                  "New Zealand won by 78 runs",
                              style: Appstyle.textStyle12.copyWith(
                                color: AppColors.whiteColor,
                              ),
                            ),
                          ),
                          SizedBox(height: 12.h),
                          Align(
                            alignment: Alignment.center,
                            child: Column(
                              children: [
                                SizedBox(
                                  width: 320.w,
                                  child: Theme(
                                      data: ThemeData().copyWith(
                                          dividerColor: Colors.transparent),
                                      child: ExpansionTile(
                                        minTileHeight: 43.h,
                                        // enabled: isStart,
                                        collapsedIconColor:
                                            AppColors.whiteColor,
                                        collapsedBackgroundColor: AppColors
                                            .primarycolor
                                            .withOpacity(0.6),
                                        collapsedShape: RoundedRectangleBorder(
                                          side: BorderSide(
                                              color: AppColors.whiteColor
                                                  .withOpacity(0.4),
                                              width: 0.4),
                                          borderRadius:
                                              BorderRadius.circular(12.h),
                                        ),
                                        shape: RoundedRectangleBorder(
                                          side: const BorderSide(
                                              color: AppColors.whiteColor,
                                              width: 0.2),
                                          borderRadius:
                                              BorderRadius.circular(27.r),
                                        ),
                                        title: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                                state
                                                        .scoreCard
                                                        .data
                                                        ?.matchHeader
                                                        ?.team1
                                                        ?.name ??
                                                    "",
                                                style: Appstyle.textstyle13),
                                            Text(
                                                "${state.scoreCard.data?.scoreCard?[0].scoreDetails?.runs.toString()}/${state.scoreCard.data?.scoreCard?[0].scoreDetails?.wickets} (${state.scoreCard.data?.scoreCard?[0].scoreDetails?.overs})" ??
                                                    "0/0 (0.0)",
                                                style: Appstyle.textstyle13),
                                          ],
                                        ),
                                        children: [
                                          Container(
                                            height: 180.h,
                                            color: Colors.transparent,
                                            child: SingleChildScrollView(
                                              child: Column(children: [
                                                const CostumeDivider(),
                                                Container(
                                                  color: AppColors.primarycolor
                                                      .withOpacity(0.5),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsets.all(8.0.h),
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        headerText(
                                                            "Batter", 100.w),
                                                        headerText("R", 40.w),
                                                        headerText("B", 30.w),
                                                        headerText("4s", 30.w),
                                                        headerText("6s", 30.w),
                                                        headerText("SR", 50.w),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                                const BatterScoreTeamOne(),
                                                Container(
                                                  color: AppColors.primarycolor
                                                      .withOpacity(0.5),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsets.all(8.0.h),
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        headerText(
                                                            "BOWLER", 100.w),
                                                        headerText("R", 40.w),
                                                        headerText("O", 30.w),
                                                        headerText("M", 30.w),
                                                        headerText("W", 30.w),
                                                        headerText("ECO", 50.w),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                                const BowlerScoreTeamOne(),
                                              ]),
                                            ),
                                          ),
                                        ],
                                      )),
                                ),
                                12.verticalSpace,
                                SizedBox(
                                  width: 320.w,
                                  child: Theme(
                                      data: ThemeData().copyWith(
                                          dividerColor: Colors.transparent),
                                      child: ExpansionTile(
                                        minTileHeight: 43.h,
                                        // enabled: isStart,
                                        collapsedIconColor:
                                            AppColors.whiteColor,
                                        collapsedBackgroundColor: AppColors
                                            .primarycolor
                                            .withOpacity(0.6),
                                        collapsedShape: RoundedRectangleBorder(
                                          side: BorderSide(
                                              color: AppColors.whiteColor
                                                  .withOpacity(0.4),
                                              width: 0.4),
                                          borderRadius:
                                              BorderRadius.circular(12.h),
                                        ),
                                        shape: RoundedRectangleBorder(
                                          side: const BorderSide(
                                              color: AppColors.whiteColor,
                                              width: 0.2),
                                          borderRadius:
                                              BorderRadius.circular(27.r),
                                        ),
                                        title: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                                state
                                                        .scoreCard
                                                        .data
                                                        ?.matchHeader
                                                        ?.team2
                                                        ?.name ??
                                                    "",
                                                style: Appstyle.textstyle13),
                                            Text(
                                                "${state.scoreCard.data?.scoreCard?[1].scoreDetails?.runs.toString()}/${state.scoreCard.data?.scoreCard?[1].scoreDetails?.wickets} (${state.scoreCard.data?.scoreCard?[1].scoreDetails?.overs})" ??
                                                    "0/0 (0.0)",
                                                style: Appstyle.textstyle13),
                                          ],
                                        ),
                                        children: [
                                          Container(
                                            height: 180.h,
                                            color: Colors.transparent,
                                            child: SingleChildScrollView(
                                              child: Column(children: [
                                                const CostumeDivider(),
                                                Container(
                                                  color: AppColors.primarycolor
                                                      .withOpacity(0.5),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsets.all(8.0.h),
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        headerText(
                                                            "Batter", 100.w),
                                                        headerText("R", 40.w),
                                                        headerText("B", 30.w),
                                                        headerText("4s", 30.w),
                                                        headerText("6s", 30.w),
                                                        headerText("SR", 50.w),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                                const BatterScoreTeamTwo(),
                                                Container(
                                                  color: AppColors.primarycolor
                                                      .withOpacity(0.5),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsets.all(8.0.h),
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        headerText(
                                                            "BOWLER", 100.w),
                                                        headerText("R", 40.w),
                                                        headerText("O", 30.w),
                                                        headerText("M", 30.w),
                                                        headerText("W", 30.w),
                                                        headerText("ECO", 50.w),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                                const BowlerScoreTeamTwo(),
                                              ]),
                                            ),
                                          ),
                                        ],
                                      )),
                                )
                              ],
                            ),
                          ),
                        ]),
                  )));
        }));
  }
}

Widget headerText(String title, double size) {
  return SizedBox(
    width: size,
    child: Padding(
      padding: EdgeInsets.only(left: 6.w),
      child: Text(
        title,
        style: Appstyle.textStyle11.copyWith(color: AppColors.whiteColor),
      ),
    ),
  );
}
