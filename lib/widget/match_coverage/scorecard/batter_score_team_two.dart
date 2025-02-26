import 'package:hcricket/bloc/bloc_exports.dart';
import 'package:hcricket/bloc/score_card_bloc/score_card_bloc.dart';
import 'package:hcricket/bloc/score_card_bloc/score_card_event.dart';
import 'package:hcricket/bloc/score_card_bloc/score_card_state.dart';
import 'package:hcricket/repositery/match_http_api_repository.dart';
import 'package:hcricket/utils/textstyle.dart';
import 'package:hcricket/utils/utils_exports.dart';
import 'package:hcricket/widget/costume_divider.dart';

class BatterScoreTeamTwo extends StatefulWidget {
  const BatterScoreTeamTwo({super.key});

  @override
  State<BatterScoreTeamTwo> createState() => _BatterScoreTeamTwoState();
}

class _BatterScoreTeamTwoState extends State<BatterScoreTeamTwo> {
  late ScoreCardBloc scoreCardBloc;

  @override
  void initState() {
    super.initState();
    scoreCardBloc =
        ScoreCardBloc(scoreCardRepository: MatchHttpApiRepository());
  }

  // Player data row
  Widget playerRow({
    required String name,
    required String runs,
    required String balls,
    required String fours,
    required String sixers,
    required String strikeRate,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        playerData(name, 100.w,
            Appstyle.textStyle11.copyWith(color: const Color(0xFF8E8FFF))),
        playerData(runs, 40.w,
            Appstyle.textStyle11.copyWith(color: AppColors.whiteColor)),
        playerData(balls, 30.w,
            Appstyle.textstyle11Regular.copyWith(color: AppColors.whiteColor)),
        playerData(fours, 30.w,
            Appstyle.textstyle11Regular.copyWith(color: AppColors.whiteColor)),
        playerData(sixers, 30.w,
            Appstyle.textstyle11Regular.copyWith(color: AppColors.whiteColor)),
        playerData(strikeRate, 50.w,
            Appstyle.textstyle11Regular.copyWith(color: AppColors.whiteColor)),
      ],
    );
  }

  // Player data widget
  Widget playerData(String name, double size, TextStyle style) {
    return SizedBox(
      width: size,
      child: Padding(
        padding: EdgeInsets.only(left: 6.w),
        child: Text(name, style: style),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => scoreCardBloc..add(GetScoreCard()),
      child:
          BlocBuilder<ScoreCardBloc, ScoreCardState>(builder: (context, state) {
        return Column(
          children: [
            if (state.scoreCard.data?.scoreCard?[0].batTeamDetails
                    ?.batsmenData !=
                null)
              Padding(
                padding: EdgeInsets.symmetric(vertical: 10.h),
                child: Column(
                  children: [
                    if (state.scoreCard.data?.scoreCard?[0].batTeamDetails
                            ?.batsmenData?.bat1 !=
                        null)
                      Padding(
                        padding: EdgeInsets.all(3.0.h),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            playerRow(
                              name: state
                                      .scoreCard
                                      .data
                                      ?.scoreCard?[0]
                                      .batTeamDetails
                                      ?.batsmenData
                                      ?.bat1
                                      ?.batName ??
                                  'Salt (w/k)',
                              runs: state.scoreCard.data?.scoreCard?[0]
                                      .batTeamDetails?.batsmenData?.bat1?.runs
                                      .toString() ??
                                  '',
                              balls: state.scoreCard.data?.scoreCard?[0]
                                      .batTeamDetails?.batsmenData?.bat1?.balls
                                      .toString() ??
                                  '',
                              fours: state.scoreCard.data?.scoreCard?[0]
                                      .batTeamDetails?.batsmenData?.bat1?.fours
                                      .toString() ??
                                  '',
                              sixers: state.scoreCard.data?.scoreCard?[0]
                                      .batTeamDetails?.batsmenData?.bat1?.sixers
                                      .toString() ??
                                  '',
                              strikeRate: state
                                      .scoreCard
                                      .data
                                      ?.scoreCard?[0]
                                      .batTeamDetails
                                      ?.batsmenData
                                      ?.bat1
                                      ?.strikeRate
                                      .toString() ??
                                  '89.69',
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                left: 8.w,
                                bottom: 4.h,
                              ),
                              child: Text(
                                state
                                        .scoreCard
                                        .data
                                        ?.scoreCard?[0]
                                        .batTeamDetails
                                        ?.batsmenData
                                        ?.bat1
                                        ?.outDesc
                                        ?.toString() ??
                                    'C Ravindra Jadeja b Varun Chakravarthy',
                                style: Appstyle.textstyle10Regular,
                              ),
                            ),
                            4.verticalSpace,
                            const CostumeDivider(),
                            4.verticalSpace,
                            playerRow(
                              name: state
                                      .scoreCard
                                      .data
                                      ?.scoreCard?[0]
                                      .batTeamDetails
                                      ?.batsmenData
                                      ?.bat2
                                      ?.batName ??
                                  'Salt (w/k)',
                              runs: state.scoreCard.data?.scoreCard?[0]
                                      .batTeamDetails?.batsmenData?.bat2?.runs
                                      .toString() ??
                                  '',
                              balls: state.scoreCard.data?.scoreCard?[0]
                                      .batTeamDetails?.batsmenData?.bat2?.balls
                                      .toString() ??
                                  '',
                              fours: state.scoreCard.data?.scoreCard?[0]
                                      .batTeamDetails?.batsmenData?.bat2?.fours
                                      .toString() ??
                                  '',
                              sixers: state.scoreCard.data?.scoreCard?[0]
                                      .batTeamDetails?.batsmenData?.bat2?.sixers
                                      .toString() ??
                                  '',
                              strikeRate: state
                                      .scoreCard
                                      .data
                                      ?.scoreCard?[0]
                                      .batTeamDetails
                                      ?.batsmenData
                                      ?.bat2
                                      ?.strikeRate
                                      .toString() ??
                                  '89.69',
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 8.w, bottom: 4.h),
                              child: Text(
                                state
                                        .scoreCard
                                        .data
                                        ?.scoreCard?[0]
                                        .batTeamDetails
                                        ?.batsmenData
                                        ?.bat2
                                        ?.outDesc
                                        ?.toString() ??
                                    'C Ravindra Jadeja b Varun Chakravarthy',
                                style: Appstyle.textstyle10Regular,
                              ),
                            ),
                            4.verticalSpace,
                            const CostumeDivider(),
                            4.verticalSpace,
                            playerRow(
                              name: state
                                      .scoreCard
                                      .data
                                      ?.scoreCard?[0]
                                      .batTeamDetails
                                      ?.batsmenData
                                      ?.bat3
                                      ?.batName ??
                                  'Salt (w/k)',
                              runs: state.scoreCard.data?.scoreCard?[0]
                                      .batTeamDetails?.batsmenData?.bat3?.runs
                                      .toString() ??
                                  '',
                              balls: state.scoreCard.data?.scoreCard?[0]
                                      .batTeamDetails?.batsmenData?.bat3?.balls
                                      .toString() ??
                                  '',
                              fours: state.scoreCard.data?.scoreCard?[0]
                                      .batTeamDetails?.batsmenData?.bat3?.fours
                                      .toString() ??
                                  '',
                              sixers: state.scoreCard.data?.scoreCard?[0]
                                      .batTeamDetails?.batsmenData?.bat3?.sixers
                                      .toString() ??
                                  '',
                              strikeRate: state
                                      .scoreCard
                                      .data
                                      ?.scoreCard?[0]
                                      .batTeamDetails
                                      ?.batsmenData
                                      ?.bat3
                                      ?.strikeRate
                                      .toString() ??
                                  '89.69',
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 8.w, bottom: 4.h),
                              child: Text(
                                state
                                        .scoreCard
                                        .data
                                        ?.scoreCard?[0]
                                        .batTeamDetails
                                        ?.batsmenData
                                        ?.bat3
                                        ?.outDesc
                                        ?.toString() ??
                                    'C Ravindra Jadeja b Varun Chakravarthy',
                                style: Appstyle.textstyle10Regular,
                              ),
                            ),
                            4.verticalSpace,
                            const CostumeDivider(),
                            4.verticalSpace,
                            playerRow(
                              name: state
                                      .scoreCard
                                      .data
                                      ?.scoreCard?[0]
                                      .batTeamDetails
                                      ?.batsmenData
                                      ?.bat4
                                      ?.batName ??
                                  'Salt (w/k)',
                              runs: state.scoreCard.data?.scoreCard?[0]
                                      .batTeamDetails?.batsmenData?.bat4?.runs
                                      .toString() ??
                                  '',
                              balls: state.scoreCard.data?.scoreCard?[0]
                                      .batTeamDetails?.batsmenData?.bat4?.balls
                                      .toString() ??
                                  '',
                              fours: state.scoreCard.data?.scoreCard?[0]
                                      .batTeamDetails?.batsmenData?.bat4?.fours
                                      .toString() ??
                                  '',
                              sixers: state.scoreCard.data?.scoreCard?[0]
                                      .batTeamDetails?.batsmenData?.bat4?.sixers
                                      .toString() ??
                                  '',
                              strikeRate: state
                                      .scoreCard
                                      .data
                                      ?.scoreCard?[0]
                                      .batTeamDetails
                                      ?.batsmenData
                                      ?.bat4
                                      ?.strikeRate
                                      .toString() ??
                                  '89.69',
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 8.w, bottom: 4.h),
                              child: Text(
                                state
                                        .scoreCard
                                        .data
                                        ?.scoreCard?[0]
                                        .batTeamDetails
                                        ?.batsmenData
                                        ?.bat4
                                        ?.outDesc
                                        ?.toString() ??
                                    'C Ravindra Jadeja b Varun Chakravarthy',
                                style: Appstyle.textstyle10Regular,
                              ),
                            ),
                            4.verticalSpace,
                            const CostumeDivider(),
                            4.verticalSpace,
                            playerRow(
                              name: state
                                      .scoreCard
                                      .data
                                      ?.scoreCard?[0]
                                      .batTeamDetails
                                      ?.batsmenData
                                      ?.bat5
                                      ?.batName ??
                                  'Salt (w/k)',
                              runs: state.scoreCard.data?.scoreCard?[0]
                                      .batTeamDetails?.batsmenData?.bat5?.runs
                                      .toString() ??
                                  '',
                              balls: state.scoreCard.data?.scoreCard?[0]
                                      .batTeamDetails?.batsmenData?.bat5?.balls
                                      .toString() ??
                                  '',
                              fours: state.scoreCard.data?.scoreCard?[0]
                                      .batTeamDetails?.batsmenData?.bat5?.fours
                                      .toString() ??
                                  '',
                              sixers: state.scoreCard.data?.scoreCard?[0]
                                      .batTeamDetails?.batsmenData?.bat5?.sixers
                                      .toString() ??
                                  '',
                              strikeRate: state
                                      .scoreCard
                                      .data
                                      ?.scoreCard?[0]
                                      .batTeamDetails
                                      ?.batsmenData
                                      ?.bat5
                                      ?.strikeRate
                                      .toString() ??
                                  '89.69',
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 8.w, bottom: 4.h),
                              child: Text(
                                state
                                        .scoreCard
                                        .data
                                        ?.scoreCard?[0]
                                        .batTeamDetails
                                        ?.batsmenData
                                        ?.bat5
                                        ?.outDesc
                                        ?.toString() ??
                                    'C Ravindra Jadeja b Varun Chakravarthy',
                                style: Appstyle.textstyle10Regular,
                              ),
                            ),
                            4.verticalSpace,
                            const CostumeDivider(),
                            4.verticalSpace,
                            playerRow(
                              name: state
                                      .scoreCard
                                      .data
                                      ?.scoreCard?[0]
                                      .batTeamDetails
                                      ?.batsmenData
                                      ?.bat6
                                      ?.batName ??
                                  'Salt (w/k)',
                              runs: state.scoreCard.data?.scoreCard?[0]
                                      .batTeamDetails?.batsmenData?.bat6?.runs
                                      .toString() ??
                                  '',
                              balls: state.scoreCard.data?.scoreCard?[0]
                                      .batTeamDetails?.batsmenData?.bat6?.balls
                                      .toString() ??
                                  '',
                              fours: state.scoreCard.data?.scoreCard?[0]
                                      .batTeamDetails?.batsmenData?.bat6?.fours
                                      .toString() ??
                                  '',
                              sixers: state.scoreCard.data?.scoreCard?[0]
                                      .batTeamDetails?.batsmenData?.bat6?.sixers
                                      .toString() ??
                                  '',
                              strikeRate: state
                                      .scoreCard
                                      .data
                                      ?.scoreCard?[0]
                                      .batTeamDetails
                                      ?.batsmenData
                                      ?.bat6
                                      ?.strikeRate
                                      .toString() ??
                                  '89.69',
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 8.w, bottom: 4.h),
                              child: Text(
                                state
                                        .scoreCard
                                        .data
                                        ?.scoreCard?[0]
                                        .batTeamDetails
                                        ?.batsmenData
                                        ?.bat6
                                        ?.outDesc
                                        ?.toString() ??
                                    'C Ravindra Jadeja b Varun Chakravarthy',
                                style: Appstyle.textstyle10Regular,
                              ),
                            ),
                            4.verticalSpace,
                            const CostumeDivider(),
                            4.verticalSpace,
                            playerRow(
                              name: state
                                      .scoreCard
                                      .data
                                      ?.scoreCard?[0]
                                      .batTeamDetails
                                      ?.batsmenData
                                      ?.bat6
                                      ?.batName ??
                                  'Salt (w/k)',
                              runs: state.scoreCard.data?.scoreCard?[0]
                                      .batTeamDetails?.batsmenData?.bat6?.runs
                                      .toString() ??
                                  '',
                              balls: state.scoreCard.data?.scoreCard?[0]
                                      .batTeamDetails?.batsmenData?.bat6?.balls
                                      .toString() ??
                                  '',
                              fours: state.scoreCard.data?.scoreCard?[0]
                                      .batTeamDetails?.batsmenData?.bat6?.fours
                                      .toString() ??
                                  '',
                              sixers: state.scoreCard.data?.scoreCard?[0]
                                      .batTeamDetails?.batsmenData?.bat6?.sixers
                                      .toString() ??
                                  '',
                              strikeRate: state
                                      .scoreCard
                                      .data
                                      ?.scoreCard?[0]
                                      .batTeamDetails
                                      ?.batsmenData
                                      ?.bat6
                                      ?.strikeRate
                                      .toString() ??
                                  '89.69',
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 8.w, bottom: 4.h),
                              child: Text(
                                state
                                        .scoreCard
                                        .data
                                        ?.scoreCard?[0]
                                        .batTeamDetails
                                        ?.batsmenData
                                        ?.bat6
                                        ?.outDesc
                                        ?.toString() ??
                                    'C Ravindra Jadeja b Varun Chakravarthy',
                                style: Appstyle.textstyle10Regular,
                              ),
                            ),
                            4.verticalSpace,
                            const CostumeDivider(),
                            4.verticalSpace,
                            playerRow(
                              name: state
                                      .scoreCard
                                      .data
                                      ?.scoreCard?[0]
                                      .batTeamDetails
                                      ?.batsmenData
                                      ?.bat8
                                      ?.batName ??
                                  'Salt (w/k)',
                              runs: state.scoreCard.data?.scoreCard?[0]
                                      .batTeamDetails?.batsmenData?.bat8?.runs
                                      .toString() ??
                                  '',
                              balls: state.scoreCard.data?.scoreCard?[0]
                                      .batTeamDetails?.batsmenData?.bat8?.balls
                                      .toString() ??
                                  '',
                              fours: state.scoreCard.data?.scoreCard?[0]
                                      .batTeamDetails?.batsmenData?.bat8?.fours
                                      .toString() ??
                                  '',
                              sixers: state.scoreCard.data?.scoreCard?[0]
                                      .batTeamDetails?.batsmenData?.bat8?.sixers
                                      .toString() ??
                                  '',
                              strikeRate: state
                                      .scoreCard
                                      .data
                                      ?.scoreCard?[0]
                                      .batTeamDetails
                                      ?.batsmenData
                                      ?.bat8
                                      ?.strikeRate
                                      .toString() ??
                                  '89.69',
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 8.w, bottom: 4.h),
                              child: Text(
                                state
                                        .scoreCard
                                        .data
                                        ?.scoreCard?[0]
                                        .batTeamDetails
                                        ?.batsmenData
                                        ?.bat8
                                        ?.outDesc
                                        ?.toString() ??
                                    'C Ravindra Jadeja b Varun Chakravarthy',
                                style: Appstyle.textstyle10Regular,
                              ),
                            ),
                            4.verticalSpace,
                            const CostumeDivider(),
                            4.verticalSpace,
                            playerRow(
                              name: state
                                      .scoreCard
                                      .data
                                      ?.scoreCard?[0]
                                      .batTeamDetails
                                      ?.batsmenData
                                      ?.bat9
                                      ?.batName ??
                                  'Salt (w/k)',
                              runs: state.scoreCard.data?.scoreCard?[0]
                                      .batTeamDetails?.batsmenData?.bat9?.runs
                                      .toString() ??
                                  '',
                              balls: state.scoreCard.data?.scoreCard?[0]
                                      .batTeamDetails?.batsmenData?.bat9?.balls
                                      .toString() ??
                                  '',
                              fours: state.scoreCard.data?.scoreCard?[0]
                                      .batTeamDetails?.batsmenData?.bat9?.fours
                                      .toString() ??
                                  '',
                              sixers: state.scoreCard.data?.scoreCard?[0]
                                      .batTeamDetails?.batsmenData?.bat9?.sixers
                                      .toString() ??
                                  '',
                              strikeRate: state
                                      .scoreCard
                                      .data
                                      ?.scoreCard?[0]
                                      .batTeamDetails
                                      ?.batsmenData
                                      ?.bat9
                                      ?.strikeRate
                                      .toString() ??
                                  '89.69',
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 8.w, bottom: 4.h),
                              child: Text(
                                state
                                        .scoreCard
                                        .data
                                        ?.scoreCard?[0]
                                        .batTeamDetails
                                        ?.batsmenData
                                        ?.bat9
                                        ?.outDesc
                                        ?.toString() ??
                                    'C Ravindra Jadeja b Varun Chakravarthy',
                                style: Appstyle.textstyle10Regular,
                              ),
                            ),
                            4.verticalSpace,
                            const CostumeDivider(),
                            4.verticalSpace,
                            playerRow(
                              name: state
                                      .scoreCard
                                      .data
                                      ?.scoreCard?[0]
                                      .batTeamDetails
                                      ?.batsmenData
                                      ?.bat10
                                      ?.batName ??
                                  'Salt (w/k)',
                              runs: state.scoreCard.data?.scoreCard?[0]
                                      .batTeamDetails?.batsmenData?.bat10?.runs
                                      .toString() ??
                                  '',
                              balls: state.scoreCard.data?.scoreCard?[0]
                                      .batTeamDetails?.batsmenData?.bat10?.balls
                                      .toString() ??
                                  '',
                              fours: state.scoreCard.data?.scoreCard?[0]
                                      .batTeamDetails?.batsmenData?.bat10?.fours
                                      .toString() ??
                                  '',
                              sixers: state
                                      .scoreCard
                                      .data
                                      ?.scoreCard?[0]
                                      .batTeamDetails
                                      ?.batsmenData
                                      ?.bat10
                                      ?.sixers
                                      .toString() ??
                                  '',
                              strikeRate: state
                                      .scoreCard
                                      .data
                                      ?.scoreCard?[0]
                                      .batTeamDetails
                                      ?.batsmenData
                                      ?.bat10
                                      ?.strikeRate
                                      .toString() ??
                                  '89.69',
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 8.w, bottom: 4.h),
                              child: Text(
                                state
                                        .scoreCard
                                        .data
                                        ?.scoreCard?[0]
                                        .batTeamDetails
                                        ?.batsmenData
                                        ?.bat10
                                        ?.outDesc
                                        ?.toString() ??
                                    'C Ravindra Jadeja b Varun Chakravarthy',
                                style: Appstyle.textstyle10Regular,
                              ),
                            ),
                            4.verticalSpace,
                            const CostumeDivider(),
                            4.verticalSpace,
                            playerRow(
                              name: state
                                      .scoreCard
                                      .data
                                      ?.scoreCard?[0]
                                      .batTeamDetails
                                      ?.batsmenData
                                      ?.bat11
                                      ?.batName ??
                                  'Salt (w/k)',
                              runs: state.scoreCard.data?.scoreCard?[0]
                                      .batTeamDetails?.batsmenData?.bat11?.runs
                                      .toString() ??
                                  '',
                              balls: state.scoreCard.data?.scoreCard?[0]
                                      .batTeamDetails?.batsmenData?.bat11?.balls
                                      .toString() ??
                                  '',
                              fours: state.scoreCard.data?.scoreCard?[0]
                                      .batTeamDetails?.batsmenData?.bat11?.fours
                                      .toString() ??
                                  '',
                              sixers: state
                                      .scoreCard
                                      .data
                                      ?.scoreCard?[0]
                                      .batTeamDetails
                                      ?.batsmenData
                                      ?.bat11
                                      ?.sixers
                                      .toString() ??
                                  '',
                              strikeRate: state
                                      .scoreCard
                                      .data
                                      ?.scoreCard?[0]
                                      .batTeamDetails
                                      ?.batsmenData
                                      ?.bat11
                                      ?.strikeRate
                                      .toString() ??
                                  '89.69',
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 8.w, bottom: 4.h),
                              child: Text(
                                state
                                        .scoreCard
                                        .data
                                        ?.scoreCard?[0]
                                        .batTeamDetails
                                        ?.batsmenData
                                        ?.bat11
                                        ?.outDesc
                                        ?.toString() ??
                                    'C Ravindra Jadeja b Varun Chakravarthy',
                                style: Appstyle.textstyle10Regular,
                              ),
                            ),
                          ],
                        ),
                      ),
                  ],
                ),
              ),
          ],
        );
      }),
    );
  }
}
