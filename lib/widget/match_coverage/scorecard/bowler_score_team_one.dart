import 'package:hcricket/bloc/bloc_exports.dart';
import 'package:hcricket/bloc/score_card_bloc/score_card_bloc.dart';
import 'package:hcricket/bloc/score_card_bloc/score_card_event.dart';
import 'package:hcricket/bloc/score_card_bloc/score_card_state.dart';
import 'package:hcricket/repositery/match_http_api_repository.dart';
import 'package:hcricket/utils/textstyle.dart';
import 'package:hcricket/utils/utils_exports.dart';
import 'package:hcricket/widget/costume_divider.dart';

class BowlerScoreTeamOne extends StatefulWidget {
  const BowlerScoreTeamOne({super.key});

  @override
  State<BowlerScoreTeamOne> createState() => _BowlerScoreTeamOneState();
}

class _BowlerScoreTeamOneState extends State<BowlerScoreTeamOne> {
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
    required String over,
    required String middle,
    required String wicket,
    required String economy,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        playerData(name, 100.w,
            Appstyle.textStyle11.copyWith(color: const Color(0xFF8E8FFF))),
        playerData(runs, 40.w,
            Appstyle.textStyle11.copyWith(color: AppColors.whiteColor)),
        playerData(over, 30.w,
            Appstyle.textstyle11Regular.copyWith(color: AppColors.whiteColor)),
        playerData(middle, 30.w,
            Appstyle.textstyle11Regular.copyWith(color: AppColors.whiteColor)),
        playerData(wicket, 30.w,
            Appstyle.textstyle11Regular.copyWith(color: AppColors.whiteColor)),
        playerData(economy, 50.w,
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
            if (state.scoreCard.data?.scoreCard?[1].bowlTeamDetails
                    ?.bowlersData !=
                null)
              Padding(
                padding: EdgeInsets.symmetric(vertical: 10.h),
                child: Column(
                  children: [
                    if (state.scoreCard.data?.scoreCard?[1].bowlTeamDetails
                            ?.bowlersData?.bowl1 !=
                        null)
                      Padding(
                        padding: EdgeInsets.all(3.0.h),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            if (state.scoreCard.data?.scoreCard?[1]
                                    .bowlTeamDetails?.bowlersData?.bowl1 !=
                                null)
                              playerRow(
                                name: state
                                        .scoreCard
                                        .data
                                        ?.scoreCard?[1]
                                        .bowlTeamDetails
                                        ?.bowlersData
                                        ?.bowl1
                                        ?.bowlName ??
                                    '',
                                runs: state
                                        .scoreCard
                                        .data
                                        ?.scoreCard?[1]
                                        .bowlTeamDetails
                                        ?.bowlersData
                                        ?.bowl1
                                        ?.runs
                                        .toString() ??
                                    '',
                                over: state
                                        .scoreCard
                                        .data
                                        ?.scoreCard?[1]
                                        .bowlTeamDetails
                                        ?.bowlersData
                                        ?.bowl1
                                        ?.balls
                                        .toString() ??
                                    '',
                                middle: state
                                        .scoreCard
                                        .data
                                        ?.scoreCard?[1]
                                        .bowlTeamDetails
                                        ?.bowlersData
                                        ?.bowl1
                                        ?.maidens
                                        .toString() ??
                                    '',
                                wicket: state
                                        .scoreCard
                                        .data
                                        ?.scoreCard?[1]
                                        .bowlTeamDetails
                                        ?.bowlersData
                                        ?.bowl1
                                        ?.wickets
                                        .toString() ??
                                    '',
                                economy: state
                                        .scoreCard
                                        .data
                                        ?.scoreCard?[1]
                                        .bowlTeamDetails
                                        ?.bowlersData
                                        ?.bowl1
                                        ?.economy
                                        .toString() ??
                                    '',
                              ),
                            8.verticalSpace,
                            if (state.scoreCard.data?.scoreCard?[1]
                                    .bowlTeamDetails?.bowlersData?.bowl1 !=
                                null)
                              const CostumeDivider(),
                            8.verticalSpace,
                            if (state.scoreCard.data?.scoreCard?[1]
                                    .bowlTeamDetails?.bowlersData?.bowl2 !=
                                null)
                              playerRow(
                                name: state
                                        .scoreCard
                                        .data
                                        ?.scoreCard?[1]
                                        .bowlTeamDetails
                                        ?.bowlersData
                                        ?.bowl2
                                        ?.bowlName ??
                                    '',
                                runs: state
                                        .scoreCard
                                        .data
                                        ?.scoreCard?[1]
                                        .bowlTeamDetails
                                        ?.bowlersData
                                        ?.bowl2
                                        ?.runs
                                        .toString() ??
                                    '',
                                over: state
                                        .scoreCard
                                        .data
                                        ?.scoreCard?[1]
                                        .bowlTeamDetails
                                        ?.bowlersData
                                        ?.bowl2
                                        ?.balls
                                        .toString() ??
                                    '',
                                middle: state
                                        .scoreCard
                                        .data
                                        ?.scoreCard?[1]
                                        .bowlTeamDetails
                                        ?.bowlersData
                                        ?.bowl2
                                        ?.maidens
                                        .toString() ??
                                    '',
                                wicket: state
                                        .scoreCard
                                        .data
                                        ?.scoreCard?[1]
                                        .bowlTeamDetails
                                        ?.bowlersData
                                        ?.bowl2
                                        ?.wickets
                                        .toString() ??
                                    '',
                                economy: state
                                        .scoreCard
                                        .data
                                        ?.scoreCard?[1]
                                        .bowlTeamDetails
                                        ?.bowlersData
                                        ?.bowl2
                                        ?.economy
                                        .toString() ??
                                    '',
                              ),
                            8.verticalSpace,
                            if (state.scoreCard.data?.scoreCard?[1]
                                    .bowlTeamDetails?.bowlersData?.bowl2 !=
                                null)
                              const CostumeDivider(),
                            8.verticalSpace,
                            if (state.scoreCard.data?.scoreCard?[1]
                                    .bowlTeamDetails?.bowlersData?.bowl3 !=
                                null)
                              playerRow(
                                name: state
                                        .scoreCard
                                        .data
                                        ?.scoreCard?[1]
                                        .bowlTeamDetails
                                        ?.bowlersData
                                        ?.bowl3
                                        ?.bowlName ??
                                    '',
                                runs: state
                                        .scoreCard
                                        .data
                                        ?.scoreCard?[1]
                                        .bowlTeamDetails
                                        ?.bowlersData
                                        ?.bowl3
                                        ?.runs
                                        .toString() ??
                                    '',
                                over: state
                                        .scoreCard
                                        .data
                                        ?.scoreCard?[1]
                                        .bowlTeamDetails
                                        ?.bowlersData
                                        ?.bowl3
                                        ?.balls
                                        .toString() ??
                                    '',
                                middle: state
                                        .scoreCard
                                        .data
                                        ?.scoreCard?[1]
                                        .bowlTeamDetails
                                        ?.bowlersData
                                        ?.bowl3
                                        ?.maidens
                                        .toString() ??
                                    '',
                                wicket: state
                                        .scoreCard
                                        .data
                                        ?.scoreCard?[1]
                                        .bowlTeamDetails
                                        ?.bowlersData
                                        ?.bowl3
                                        ?.wickets
                                        .toString() ??
                                    '',
                                economy: state
                                        .scoreCard
                                        .data
                                        ?.scoreCard?[1]
                                        .bowlTeamDetails
                                        ?.bowlersData
                                        ?.bowl3
                                        ?.economy
                                        .toString() ??
                                    '',
                              ),
                            8.verticalSpace,
                            if (state.scoreCard.data?.scoreCard?[1]
                                    .bowlTeamDetails?.bowlersData?.bowl3 !=
                                null)
                              const CostumeDivider(),
                            8.verticalSpace,
                            if (state.scoreCard.data?.scoreCard?[1]
                                    .bowlTeamDetails?.bowlersData?.bowl4 !=
                                null)
                              playerRow(
                                name: state
                                        .scoreCard
                                        .data
                                        ?.scoreCard?[1]
                                        .bowlTeamDetails
                                        ?.bowlersData
                                        ?.bowl4
                                        ?.bowlName ??
                                    '',
                                runs: state
                                        .scoreCard
                                        .data
                                        ?.scoreCard?[1]
                                        .bowlTeamDetails
                                        ?.bowlersData
                                        ?.bowl4
                                        ?.runs
                                        .toString() ??
                                    '',
                                over: state
                                        .scoreCard
                                        .data
                                        ?.scoreCard?[1]
                                        .bowlTeamDetails
                                        ?.bowlersData
                                        ?.bowl4
                                        ?.balls
                                        .toString() ??
                                    '',
                                middle: state
                                        .scoreCard
                                        .data
                                        ?.scoreCard?[1]
                                        .bowlTeamDetails
                                        ?.bowlersData
                                        ?.bowl4
                                        ?.maidens
                                        .toString() ??
                                    '',
                                wicket: state
                                        .scoreCard
                                        .data
                                        ?.scoreCard?[1]
                                        .bowlTeamDetails
                                        ?.bowlersData
                                        ?.bowl4
                                        ?.wickets
                                        .toString() ??
                                    '',
                                economy: state
                                        .scoreCard
                                        .data
                                        ?.scoreCard?[1]
                                        .bowlTeamDetails
                                        ?.bowlersData
                                        ?.bowl4
                                        ?.economy
                                        .toString() ??
                                    '',
                              ),
                            8.verticalSpace,
                            if (state.scoreCard.data?.scoreCard?[1]
                                    .bowlTeamDetails?.bowlersData?.bowl4 !=
                                null)
                              const CostumeDivider(),
                            8.verticalSpace,
                            if (state.scoreCard.data?.scoreCard?[1]
                                    .bowlTeamDetails?.bowlersData?.bowl5 !=
                                null)
                              playerRow(
                                name: state
                                        .scoreCard
                                        .data
                                        ?.scoreCard?[1]
                                        .bowlTeamDetails
                                        ?.bowlersData
                                        ?.bowl5
                                        ?.bowlName ??
                                    '',
                                runs: state
                                        .scoreCard
                                        .data
                                        ?.scoreCard?[1]
                                        .bowlTeamDetails
                                        ?.bowlersData
                                        ?.bowl5
                                        ?.runs
                                        .toString() ??
                                    '',
                                over: state
                                        .scoreCard
                                        .data
                                        ?.scoreCard?[1]
                                        .bowlTeamDetails
                                        ?.bowlersData
                                        ?.bowl5
                                        ?.balls
                                        .toString() ??
                                    '',
                                middle: state
                                        .scoreCard
                                        .data
                                        ?.scoreCard?[1]
                                        .bowlTeamDetails
                                        ?.bowlersData
                                        ?.bowl5
                                        ?.maidens
                                        .toString() ??
                                    '',
                                wicket: state
                                        .scoreCard
                                        .data
                                        ?.scoreCard?[1]
                                        .bowlTeamDetails
                                        ?.bowlersData
                                        ?.bowl5
                                        ?.wickets
                                        .toString() ??
                                    '',
                                economy: state
                                        .scoreCard
                                        .data
                                        ?.scoreCard?[1]
                                        .bowlTeamDetails
                                        ?.bowlersData
                                        ?.bowl5
                                        ?.economy
                                        .toString() ??
                                    '',
                              ),
                            8.verticalSpace,
                            if (state.scoreCard.data?.scoreCard?[1]
                                    .bowlTeamDetails?.bowlersData?.bowl5 !=
                                null)
                              const CostumeDivider(),
                            8.verticalSpace,
                            if (state.scoreCard.data?.scoreCard?[1]
                                    .bowlTeamDetails?.bowlersData?.bowl6 !=
                                null)
                              playerRow(
                                name: state
                                        .scoreCard
                                        .data
                                        ?.scoreCard?[1]
                                        .bowlTeamDetails
                                        ?.bowlersData
                                        ?.bowl6
                                        ?.bowlName ??
                                    '',
                                runs: state
                                        .scoreCard
                                        .data
                                        ?.scoreCard?[1]
                                        .bowlTeamDetails
                                        ?.bowlersData
                                        ?.bowl6
                                        ?.runs
                                        .toString() ??
                                    '',
                                over: state
                                        .scoreCard
                                        .data
                                        ?.scoreCard?[1]
                                        .bowlTeamDetails
                                        ?.bowlersData
                                        ?.bowl6
                                        ?.balls
                                        .toString() ??
                                    '',
                                middle: state
                                        .scoreCard
                                        .data
                                        ?.scoreCard?[1]
                                        .bowlTeamDetails
                                        ?.bowlersData
                                        ?.bowl6
                                        ?.maidens
                                        .toString() ??
                                    '',
                                wicket: state
                                        .scoreCard
                                        .data
                                        ?.scoreCard?[1]
                                        .bowlTeamDetails
                                        ?.bowlersData
                                        ?.bowl6
                                        ?.wickets
                                        .toString() ??
                                    '',
                                economy: state
                                        .scoreCard
                                        .data
                                        ?.scoreCard?[1]
                                        .bowlTeamDetails
                                        ?.bowlersData
                                        ?.bowl6
                                        ?.economy
                                        .toString() ??
                                    '',
                              ),
                            8.verticalSpace,
                            if (state.scoreCard.data?.scoreCard?[1]
                                    .bowlTeamDetails?.bowlersData?.bowl6 !=
                                null)
                              const CostumeDivider(),
                            8.verticalSpace,
                            playerRow(
                              name: state
                                      .scoreCard
                                      .data
                                      ?.scoreCard?[1]
                                      .bowlTeamDetails
                                      ?.bowlersData
                                      ?.bowl7
                                      ?.bowlName ??
                                  '',
                              runs: state.scoreCard.data?.scoreCard?[1]
                                      .bowlTeamDetails?.bowlersData?.bowl7?.runs
                                      .toString() ??
                                  '',
                              over: state
                                      .scoreCard
                                      .data
                                      ?.scoreCard?[1]
                                      .bowlTeamDetails
                                      ?.bowlersData
                                      ?.bowl7
                                      ?.balls
                                      .toString() ??
                                  '',
                              middle: state
                                      .scoreCard
                                      .data
                                      ?.scoreCard?[1]
                                      .bowlTeamDetails
                                      ?.bowlersData
                                      ?.bowl7
                                      ?.maidens
                                      .toString() ??
                                  '',
                              wicket: state
                                      .scoreCard
                                      .data
                                      ?.scoreCard?[1]
                                      .bowlTeamDetails
                                      ?.bowlersData
                                      ?.bowl7
                                      ?.wickets
                                      .toString() ??
                                  '',
                              economy: state
                                      .scoreCard
                                      .data
                                      ?.scoreCard?[1]
                                      .bowlTeamDetails
                                      ?.bowlersData
                                      ?.bowl7
                                      ?.economy
                                      .toString() ??
                                  '',
                            ),
                            if (state.scoreCard.data?.scoreCard?[1]
                                    .bowlTeamDetails?.bowlersData?.bowl7 !=
                                null)
                              const CostumeDivider(),
                            8.verticalSpace,
                            if (state.scoreCard.data?.scoreCard?[1]
                                    .bowlTeamDetails?.bowlersData?.bowl8 !=
                                null)
                              playerRow(
                                name: state
                                        .scoreCard
                                        .data
                                        ?.scoreCard?[1]
                                        .bowlTeamDetails
                                        ?.bowlersData
                                        ?.bowl8
                                        ?.bowlName ??
                                    '',
                                runs: state
                                        .scoreCard
                                        .data
                                        ?.scoreCard?[1]
                                        .bowlTeamDetails
                                        ?.bowlersData
                                        ?.bowl8
                                        ?.runs
                                        .toString() ??
                                    '',
                                over: state
                                        .scoreCard
                                        .data
                                        ?.scoreCard?[1]
                                        .bowlTeamDetails
                                        ?.bowlersData
                                        ?.bowl8
                                        ?.balls
                                        .toString() ??
                                    '',
                                middle: state
                                        .scoreCard
                                        .data
                                        ?.scoreCard?[1]
                                        .bowlTeamDetails
                                        ?.bowlersData
                                        ?.bowl8
                                        ?.maidens
                                        .toString() ??
                                    '',
                                wicket: state
                                        .scoreCard
                                        .data
                                        ?.scoreCard?[1]
                                        .bowlTeamDetails
                                        ?.bowlersData
                                        ?.bowl8
                                        ?.wickets
                                        .toString() ??
                                    '',
                                economy: state
                                        .scoreCard
                                        .data
                                        ?.scoreCard?[1]
                                        .bowlTeamDetails
                                        ?.bowlersData
                                        ?.bowl8
                                        ?.economy
                                        .toString() ??
                                    '',
                              ),
                            if (state.scoreCard.data?.scoreCard?[1]
                                    .bowlTeamDetails?.bowlersData?.bowl8 !=
                                null)
                              const CostumeDivider(),
                            8.verticalSpace,
                            if (state.scoreCard.data?.scoreCard?[1]
                                    .bowlTeamDetails?.bowlersData?.bowl9 !=
                                null)
                              playerRow(
                                name: state
                                        .scoreCard
                                        .data
                                        ?.scoreCard?[1]
                                        .bowlTeamDetails
                                        ?.bowlersData
                                        ?.bowl9
                                        ?.bowlName ??
                                    '',
                                runs: state
                                        .scoreCard
                                        .data
                                        ?.scoreCard?[1]
                                        .bowlTeamDetails
                                        ?.bowlersData
                                        ?.bowl9
                                        ?.runs
                                        .toString() ??
                                    '',
                                over: state
                                        .scoreCard
                                        .data
                                        ?.scoreCard?[1]
                                        .bowlTeamDetails
                                        ?.bowlersData
                                        ?.bowl9
                                        ?.balls
                                        .toString() ??
                                    '',
                                middle: state
                                        .scoreCard
                                        .data
                                        ?.scoreCard?[1]
                                        .bowlTeamDetails
                                        ?.bowlersData
                                        ?.bowl9
                                        ?.maidens
                                        .toString() ??
                                    '',
                                wicket: state
                                        .scoreCard
                                        .data
                                        ?.scoreCard?[1]
                                        .bowlTeamDetails
                                        ?.bowlersData
                                        ?.bowl9
                                        ?.wickets
                                        .toString() ??
                                    '',
                                economy: state
                                        .scoreCard
                                        .data
                                        ?.scoreCard?[1]
                                        .bowlTeamDetails
                                        ?.bowlersData
                                        ?.bowl9
                                        ?.economy
                                        .toString() ??
                                    '',
                              ),
                            if (state.scoreCard.data?.scoreCard?[1]
                                    .bowlTeamDetails?.bowlersData?.bowl9 !=
                                null)
                              const CostumeDivider(),
                            8.verticalSpace,
                            if (state.scoreCard.data?.scoreCard?[1]
                                    .bowlTeamDetails?.bowlersData?.bowl10 !=
                                null)
                              playerRow(
                                name: state
                                        .scoreCard
                                        .data
                                        ?.scoreCard?[1]
                                        .bowlTeamDetails
                                        ?.bowlersData
                                        ?.bowl10
                                        ?.bowlName ??
                                    '',
                                runs: state
                                        .scoreCard
                                        .data
                                        ?.scoreCard?[1]
                                        .bowlTeamDetails
                                        ?.bowlersData
                                        ?.bowl10
                                        ?.runs
                                        .toString() ??
                                    '',
                                over: state
                                        .scoreCard
                                        .data
                                        ?.scoreCard?[1]
                                        .bowlTeamDetails
                                        ?.bowlersData
                                        ?.bowl10
                                        ?.balls
                                        .toString() ??
                                    '',
                                middle: state
                                        .scoreCard
                                        .data
                                        ?.scoreCard?[1]
                                        .bowlTeamDetails
                                        ?.bowlersData
                                        ?.bowl10
                                        ?.maidens
                                        .toString() ??
                                    '',
                                wicket: state
                                        .scoreCard
                                        .data
                                        ?.scoreCard?[1]
                                        .bowlTeamDetails
                                        ?.bowlersData
                                        ?.bowl10
                                        ?.wickets
                                        .toString() ??
                                    '',
                                economy: state
                                        .scoreCard
                                        .data
                                        ?.scoreCard?[1]
                                        .bowlTeamDetails
                                        ?.bowlersData
                                        ?.bowl10
                                        ?.economy
                                        .toString() ??
                                    '',
                              ),
                            if (state.scoreCard.data?.scoreCard?[1]
                                    .bowlTeamDetails?.bowlersData?.bowl10 !=
                                null)
                              const CostumeDivider(),
                            8.verticalSpace,
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
