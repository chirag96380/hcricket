import 'package:flutter/material.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:hcricket/bloc/bloc_exports.dart';
import 'package:hcricket/bloc/matche_leadback_bloc/matche_leadback_bloc.dart';
import 'package:hcricket/bloc/matche_leadback_bloc/matche_leadback_event.dart';
import 'package:hcricket/bloc/matche_leadback_bloc/matche_leadback_state.dart';
import 'package:hcricket/repositery/match_http_api_repository.dart';
import 'package:hcricket/utils/textstyle.dart';
import 'package:hcricket/utils/utils_exports.dart';
import 'package:hcricket/widget/costume_divider.dart';

class CostumeLiveBar extends StatefulWidget {
  final int matchId;
  final String teamName;

  const CostumeLiveBar(
      {super.key, required this.matchId, required this.teamName});

  @override
  State<CostumeLiveBar> createState() => _CostumeLiveBarState();
}

class _CostumeLiveBarState extends State<CostumeLiveBar> {
  late MatcheLeadbackBloc matcheLeadbackBloc;

  @override
  void initState() {
    super.initState();
    matcheLeadbackBloc =
        MatcheLeadbackBloc(leadbackMatcheRepository: MatchHttpApiRepository());
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => matcheLeadbackBloc..add(GetLeadBackList(widget.matchId)),
      child: BlocBuilder<MatcheLeadbackBloc, MatcheLeadbackState>(
          builder: (context, state) {
        var miniScore = state.allLeadbackDetails.data?.miniScore;

        var batsmanStriker = miniScore?.batsmanStriker.name.toString() ?? '';
        var runs = miniScore?.batsmanStriker.runs.toString() ?? '';

        var batsmanNonStriker =
            miniScore?.batsmanNonStriker.name.toString() ?? "0";

        var batsmanNonStrikerRun =
            miniScore?.batsmanNonStriker.runs.toString() ?? "0";

        var batsmanStrikerBalls =
            miniScore?.batsmanStriker.balls.toString() ?? "0";

        var batsmanNonStrikerBalls =
            miniScore?.batsmanNonStriker.balls.toString() ?? "0";

        var batsmanStrikerfours =
            miniScore?.batsmanStriker.fours.toString() ?? '0';

        var batsmanNonStrikerfours =
            miniScore?.batsmanNonStriker.fours.toString() ?? "0";

        var batsmanStrikerStrikeRate =
            miniScore?.batsmanStriker.strikeRate.toString() ?? '0';

        var batsmanNonStrikerStrikeRate =
            miniScore?.batsmanNonStriker.strikeRate.toString() ?? "0";

        var batsmanStrikerStrikeSix =
            miniScore?.batsmanStriker.six.toString() ?? '0';

        var batsmanNonStrikerStrikeSix =
            miniScore?.batsmanNonStriker.six.toString() ?? "0";

        var bowlername = miniScore?.bowlerStriker.name.toString() ?? "0";

        var bowlerrun = miniScore?.bowlerStriker.runs.toString() ?? "0";

        var bowlerover = miniScore?.bowlerStriker.overs.toString() ?? "0";

        var bowlerwickets = miniScore?.bowlerStriker.wickets.toString() ?? "0";

        var bowlereconomy = miniScore?.bowlerStriker.economy.toString() ?? "0";

        // ignore: non_constant_identifier_names
        var CRR = miniScore?.crr.toString() ?? "0";

        // ignore: non_constant_identifier_names
        var RRR = miniScore?.rrr.toString() ?? "0";

        var target = miniScore?.target.toString() ?? "0";

        var partnership = miniScore?.partnership.toString() ?? "0";

        // var current1Inning = miniScore?.inningsScores[0].runs ?? '';
        // var current2Inning = miniScore?.inningsScores[1].runs ?? '';

        // var current1Wickets = miniScore?.inningsScores[0].wickets ?? '';
        // var current2Wickets = miniScore?.inningsScores[1].wickets ?? '';

        // var current1Over = miniScore?.inningsScores[0].overs ?? '';
        // var current2Over = miniScore?.inningsScores[1].overs ?? '';

        // var team1Name =
        //     state.allLeadbackDetails.data?.matchHeader.team1.teamSName ?? '';
        // var team2Name =
        //     state.allLeadbackDetails.data?.matchHeader.team2.teamSName ?? '';

        var currentStatus = miniScore?.custStatus ?? '';

        var currentInningId = miniScore?.inningsId;

        var currentInningData = miniScore?.inningsScores.firstWhere(
          (inning) => inning.inningsId == currentInningId,
        );

        if (currentInningData?.inningsId == -1) {
          currentInningData = null;
        }

        var currentInning = currentInningData?.runs ?? '';
        var currentWickets = currentInningData?.wickets ?? '';
        var currentOvers = currentInningData?.overs ?? '';
        var currentTeamName = currentInningData?.batTeamShortName ?? '';

        return Padding(
            padding: EdgeInsets.only(
                top: 10.h, left: 10.w, right: 10.w, bottom: 10.w),
            child: Container(
                height: 90.h,
                width: 80.w,
                decoration: BoxDecoration(
                    border: const GradientBoxBorder(
                      gradient: AppColors.matchCoveragegradient,
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(30.r)),
                child: Column(children: [
                  Padding(
                      padding: EdgeInsets.only(
                          left: 30.0.w, top: 20.h, bottom: 12.h, right: 50.0.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    currentTeamName,
                                    // ignore: unnecessary_null_comparison
                                    // current2Inning != null
                                    //     ? team1Name
                                    //     : team2Name,
                                    style: Appstyle.textstyle13
                                        .copyWith(color: AppColors.primaryText),
                                  ),
                                  Text(
                                    "${currentInning.toString()} / ${currentWickets.toString()} (${currentOvers.toString()})",
                                    // ignore: unnecessary_null_comparison
                                    // current2Inning != null
                                    //     ? "${current1Inning.toString()} / ${current1Wickets.toString()} (${current1Over.toString()})"
                                    //     : "${current2Inning.toString()} / ${current2Wickets.toString()} (${current2Over.toString()})",
                                    style: Appstyle.textstyle17bold,
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Column(
                                    children: [
                                      Text(
                                        "CRR",
                                        style: Appstyle.textstyle12Regular,
                                      ),
                                      Text(
                                        CRR.toString(),
                                        style: Appstyle.textstyle13Regular,
                                      )
                                    ],
                                  ),
                                  12.horizontalSpace,
                                  // ignore: unnecessary_null_comparison
                                  RRR != null
                                      ? Column(
                                          children: [
                                            Text(
                                              "REQ",
                                              style:
                                                  Appstyle.textstyle12Regular,
                                            ),
                                            Text(
                                              RRR,
                                              style:
                                                  Appstyle.textstyle13Regular,
                                            )
                                          ],
                                        )
                                      : const SizedBox.shrink()
                                ],
                              )
                            ],
                          ),
                          6.verticalSpace,
                          Text(
                            currentStatus,
                            style: Appstyle.textstyle12Regular
                                .copyWith(color: AppColors.primaryText),
                          ),
                          12.verticalSpace,
                          const CostumeDivider(),
                          8.verticalSpace,
                          RichText(
                            text: TextSpan(
                              style: Appstyle.textstyle12Regular,
                              // text: 'TARGET, ',
                              children: <TextSpan>[
                                TextSpan(
                                    // ignore: unrelated_type_equality_checks
                                    text: target != 0 ? "TARGET  " : '',
                                    style: Appstyle.textstyle12Regular),
                                TextSpan(
                                    text: target,
                                    style: Appstyle.textStyle12
                                        .copyWith(color: AppColors.whiteColor)),
                                TextSpan(
                                    text: '  PATNER SHIP  ',
                                    style: Appstyle.textstyle12Regular),
                                TextSpan(
                                    text: partnership,
                                    style: Appstyle.textStyle12
                                        .copyWith(color: AppColors.whiteColor)),
                              ],
                            ),
                          )
                        ],
                      )),
                  Container(
                    height: 214.h,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        border: const GradientBoxBorder(
                          gradient: AppColors.scoreCoveragegradient,
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(35.r)),
                    child: Column(
                      children: [
                        8.verticalSpace,
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              headerText("BATTERS", 90.w),
                              headerText("R", 40.w),
                              headerText("B", 30.w),
                              headerText("4s", 30.w),
                              headerText("6s", 30.w),
                              headerText("SR", 50.w),
                            ],
                          ),
                        ),
                        5.verticalSpace,
                        const CostumeDivider(),
                        5.verticalSpace,
                        Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    playerText(
                                        batsmanStriker.toString(),
                                        100.w,
                                        Appstyle.textStyle12.copyWith(
                                            color: AppColors.primaryText
                                                .withOpacity(0.7))),
                                    playerText(
                                        runs.toString(),
                                        40.w,
                                        Appstyle.textStyle12regular.copyWith(
                                            color: AppColors.whiteColor
                                                .withOpacity(0.7))),
                                    playerText(
                                        batsmanStrikerBalls,
                                        40.w,
                                        Appstyle.textStyle12regular.copyWith(
                                            color: AppColors.whiteColor
                                                .withOpacity(0.7))),
                                    playerText(
                                        batsmanStrikerfours,
                                        30.w,
                                        Appstyle.textStyle12regular.copyWith(
                                            color: AppColors.whiteColor
                                                .withOpacity(0.7))),
                                    playerText(
                                        batsmanStrikerStrikeSix,
                                        30.w,
                                        Appstyle.textStyle12regular.copyWith(
                                            color: AppColors.whiteColor
                                                .withOpacity(0.7))),
                                    playerText(
                                        batsmanStrikerStrikeRate,
                                        50.w,
                                        Appstyle.textStyle12regular.copyWith(
                                            color: AppColors.whiteColor
                                                .withOpacity(0.7))),
                                  ],
                                ),
                              ),
                              Padding(
                                padding:
                                    EdgeInsets.only(left: 8.0.w, right: 8.0.w),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    playerText(
                                        batsmanNonStriker.toString(),
                                        100.w,
                                        Appstyle.textStyle12.copyWith(
                                            color: AppColors.primaryText
                                                .withOpacity(0.7))),
                                    playerText(
                                        batsmanNonStrikerRun.toString(),
                                        40.w,
                                        Appstyle.textStyle12regular.copyWith(
                                            color: AppColors.whiteColor
                                                .withOpacity(0.7))),
                                    playerText(
                                        batsmanNonStrikerBalls,
                                        40.w,
                                        Appstyle.textStyle12regular.copyWith(
                                            color: AppColors.whiteColor
                                                .withOpacity(0.7))),
                                    playerText(
                                        batsmanNonStrikerfours,
                                        30.w,
                                        Appstyle.textStyle12regular.copyWith(
                                            color: AppColors.whiteColor
                                                .withOpacity(0.7))),
                                    playerText(
                                        batsmanNonStrikerStrikeSix,
                                        30.w,
                                        Appstyle.textStyle12regular.copyWith(
                                            color: AppColors.whiteColor
                                                .withOpacity(0.7))),
                                    playerText(
                                        batsmanNonStrikerStrikeRate,
                                        50.w,
                                        Appstyle.textStyle12regular.copyWith(
                                            color: AppColors.whiteColor
                                                .withOpacity(0.7))),
                                  ],
                                ),
                              ),
                            ]),
                        8.verticalSpace,
                        Container(
                          height: 95.h,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                              border: const GradientBoxBorder(
                                gradient: AppColors.blowerCoveragegradient,
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(35.r)),
                          child: Column(
                            children: [
                              4.verticalSpace,
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    headerText("BOWLER", 90.w),
                                    headerText("R", 40.w),
                                    headerText("O", 30.w),
                                    headerText("M", 30.w),
                                    headerText("W", 30.w),
                                    headerText("ECO", 50.w),
                                  ],
                                ),
                              ),
                              5.verticalSpace,
                              const CostumeDivider(),
                              10.verticalSpace,
                              Padding(
                                padding:
                                    EdgeInsets.only(left: 8.0.w, right: 8.0.w),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    playerText(
                                        bowlername.toString(),
                                        100.w,
                                        Appstyle.textStyle12.copyWith(
                                            color: AppColors.primaryText
                                                .withOpacity(0.7))),
                                    playerText(
                                        bowlerrun.toString(),
                                        40.w,
                                        Appstyle.textStyle12regular.copyWith(
                                            color: AppColors.whiteColor
                                                .withOpacity(0.7))),
                                    playerText(
                                        bowlerover,
                                        40.w,
                                        Appstyle.textStyle12regular.copyWith(
                                            color: AppColors.whiteColor
                                                .withOpacity(0.7))),
                                    playerText(
                                        '1',
                                        30.w,
                                        Appstyle.textStyle12regular.copyWith(
                                            color: AppColors.whiteColor
                                                .withOpacity(0.7))),
                                    playerText(
                                        bowlerwickets,
                                        30.w,
                                        Appstyle.textStyle12regular.copyWith(
                                            color: AppColors.whiteColor
                                                .withOpacity(0.7))),
                                    playerText(
                                        bowlereconomy,
                                        50.w,
                                        Appstyle.textStyle12regular.copyWith(
                                            color: AppColors.whiteColor
                                                .withOpacity(0.7))),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ])));
      }),
    );
  }

  Widget headerText(String title, double size) {
    return SizedBox(
      width: size,
      child: Padding(
        padding: EdgeInsets.only(left: 15.w),
        child: Text(
          title,
          style:
              Appstyle.textStyle12regular.copyWith(color: AppColors.whiteColor),
        ),
      ),
    );
  }

  Widget playerText(String title, double size, TextStyle style) {
    return SizedBox(
      width: size,
      child: Padding(
        padding: EdgeInsets.only(left: 8.w),
        child: Text(
          title,
          style: style,
          maxLines: 2,
        ),
      ),
    );
  }
}
