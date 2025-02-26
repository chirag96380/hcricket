import 'package:flutter/cupertino.dart';
import 'package:hcricket/bloc/recent_bloc/recent_bloc.dart';
import 'package:hcricket/bloc/recent_bloc/recent_event.dart';
import 'package:hcricket/bloc/recent_bloc/recent_state.dart';
import 'package:hcricket/utils/path/image_path.dart';
import 'package:hcricket/utils/utils_exports.dart';
import 'package:hcricket/views/view.dart';
import 'package:hcricket/widget/costume_score_appbar.dart';

class RecentMatchScreen extends StatefulWidget {
  const RecentMatchScreen({super.key});

  @override
  State<RecentMatchScreen> createState() => _RecentMatchScreenState();
}

class _RecentMatchScreenState extends State<RecentMatchScreen>
    with SingleTickerProviderStateMixin {
  late RecentBloc recentBloc;

  @override
  void initState() {
    super.initState();
    recentBloc = RecentBloc(recentMatchesRepository: MatchHttpApiRepository());
  }

  @override
  Widget build(BuildContext context) {
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
            child: BlocProvider(
                create: (_) => recentBloc..add(GetRecent()),
                child: BlocBuilder<RecentBloc, RecentState>(
                    builder: (context, state) {
                  var data = state.recentMatches.data;

                  if (data == null ||
                      data.typeMatches == null ||
                      data.typeMatches!.isEmpty) {
                    return const Center(child: CupertinoActivityIndicator());
                  }

                  switch (state.recentMatches.status) {
                    case ApiStatus.loading:
                      return const Center(child: CupertinoActivityIndicator());

                    case ApiStatus.completed:
                      var allMatches = data.typeMatches!
                          .expand((type) => type.seriesMatches ?? [])
                          .expand(
                              (series) => series.seriesAdWrapper?.matches ?? [])
                          .take(60)
                          .toList();

                      return Column(
                        children: [
                          CostumeScoreAppbar(
                            AppBarName: AppString.recentMatch,
                          ),
                          8.verticalSpace,
                          Expanded(
                            child: ListView.builder(
                              itemCount: allMatches.length,
                              itemBuilder: (BuildContext context, int index) {
                                var matchData = allMatches[index];
                                var matchInfo = matchData.matchInfo;

                                if (matchInfo == null) {
                                  return const SizedBox.shrink();
                                }
                                var inngs1run = matchData
                                        .matchScore?.team1Score?.inngs1?.runs
                                        ?.toString() ??
                                    '';
                                var inngs1run2 = matchData
                                        .matchScore?.team1Score?.inngs2?.runs
                                        ?.toString() ??
                                    '';
                                var inngs2run = matchData
                                        .matchScore?.team2Score?.inngs1?.runs
                                        ?.toString() ??
                                    '';
                                var inngs2run2 = matchData
                                        .matchScore?.team2Score?.inngs2?.runs
                                        ?.toString() ??
                                    '';
                                var inngs1wicket = matchData
                                        .matchScore?.team1Score?.inngs1?.wickets
                                        ?.toString() ??
                                    '';

                                var inngs1wicket2 = matchData
                                        .matchScore?.team1Score?.inngs2?.wickets
                                        ?.toString() ??
                                    '';

                                var inngs2wicket = matchData
                                        .matchScore?.team2Score?.inngs1?.wickets
                                        ?.toString() ??
                                    '';

                                var inngs2wicket2 = matchData
                                        .matchScore?.team2Score?.inngs2?.wickets
                                        ?.toString() ??
                                    '';

                                var inngs1over = matchData
                                        .matchScore?.team1Score?.inngs1?.overs
                                        ?.toString() ??
                                    '';
                                var inngs1over2 = matchData
                                        .matchScore?.team1Score?.inngs2?.overs
                                        ?.toString() ??
                                    '';

                                var inngs2over = matchData
                                        .matchScore?.team2Score?.inngs1?.overs
                                        ?.toString() ??
                                    '';

                                var inngs2over2 = matchData
                                        .matchScore?.team2Score?.inngs2?.overs
                                        ?.toString() ??
                                    '';

                                var status = matchInfo.status?.toString() ?? '';
                                var teamSName1 =
                                    matchInfo.team1?.teamSName?.toString() ??
                                        '';
                                var teamSName2 =
                                    matchInfo.team2?.teamSName?.toString() ??
                                        '';
                                var matchDesc =
                                    matchInfo.matchDesc?.toString() ?? '';
                                var city =
                                    matchInfo.venueInfo?.city?.toString() ?? '';
                                var team1 =
                                    matchInfo.team1?.imageId?.toString() ?? '';
                                var team2 =
                                    matchInfo.team2?.imageId?.toString() ?? '';

                                return Padding(
                                  padding: EdgeInsets.only(
                                      left: 6.0.w, right: 6.w, bottom: 8.h),
                                  child: Container(
                                    height: MediaQuery.of(context).size.height /
                                        MediaQuery.of(context).size.height *
                                        150,
                                    width: MediaQuery.of(context).size.width *
                                        0.79,
                                    decoration: const BoxDecoration(
                                      image: DecorationImage(
                                        image: AssetImage(
                                            "assest/images/recent_match_bg.png"),
                                      ),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 25.0.w),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            // "asjdhajksdjhash",
                                            " $matchDesc | $city",
                                            style: Appstyle.textstyle11Regular
                                                .copyWith(
                                                    color: Colors.white
                                                        .withOpacity(0.5)),
                                          ),
                                          SizedBox(height: 6.h),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Row(
                                                children: [
                                                  ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5.r),
                                                    child: Image.network(
                                                      // AppImagepath.flagCa,
                                                      GetImage().FlagImage(
                                                          flagId: team1),
                                                      height: 22.h,
                                                      fit: BoxFit.cover,
                                                      errorBuilder: (context,
                                                          error, stackTrace) {
                                                        return const Icon(
                                                            Icons.error);
                                                      },
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding: EdgeInsets.only(
                                                        left: 12.w),
                                                    child: Text(teamSName1,
                                                        // teamSName1,
                                                        style: Appstyle
                                                            .textstyle13Regular,
                                                        textAlign:
                                                            TextAlign.left),
                                                  ),
                                                ],
                                              ),
                                              if (inngs1over.isNotEmpty)
                                                Row(
                                                  children: [
                                                    Row(
                                                      children: [
                                                        Text(
                                                            // "123",
                                                            inngs1run,
                                                            style: inngs1run2
                                                                    .isEmpty
                                                                ? Appstyle
                                                                    .textstyle16bold
                                                                : Appstyle
                                                                    .textstyle13Regular),
                                                        Text(
                                                            // "/3",
                                                            "/$inngs1wicket",
                                                            style: inngs1run2
                                                                    .isEmpty
                                                                ? Appstyle
                                                                    .textstyle16bold
                                                                : Appstyle
                                                                    .textstyle13Regular),
                                                        Text(
                                                            // "(4)",
                                                            "  ($inngs1over)",
                                                            style: inngs1run2
                                                                    .isEmpty
                                                                ? Appstyle
                                                                    .textstyle13Regular
                                                                : Appstyle
                                                                    .textstyle11Regular)
                                                      ],
                                                    ),
                                                    if (inngs1over.isNotEmpty)
                                                      Row(
                                                        children: [
                                                          if (inngs1run2
                                                              .isNotEmpty)
                                                            Text(
                                                                "  &  $inngs1run2",
                                                                style: Appstyle
                                                                    .textstyle16bold),
                                                          if (inngs1wicket2
                                                              .isNotEmpty)
                                                            Text(
                                                                "/$inngs1wicket2",
                                                                style: Appstyle
                                                                    .textstyle16bold),
                                                          if (inngs1over2
                                                              .isNotEmpty)
                                                            Text(
                                                                "  ($inngs1over2)",
                                                                style: Appstyle
                                                                    .textstyle13Regular),
                                                        ],
                                                      ),
                                                  ],
                                                ),
                                            ],
                                          ),
                                          SizedBox(height: 4.h),
                                          _buildVsText(),
                                          SizedBox(height: 4.h),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Row(
                                                children: [
                                                  ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5.r),
                                                    child: Image.network(
                                                      // AppImagepath.flagAu,

                                                      GetImage().FlagImage(
                                                          flagId:
                                                              team2.toString()),
                                                      height: 22.h,
                                                      fit: BoxFit.cover,
                                                      errorBuilder: (context,
                                                          error, stackTrace) {
                                                        return const Icon(
                                                            Icons.error);
                                                      },
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding: EdgeInsets.only(
                                                        left: 12.w),
                                                    child: Text(
                                                      teamSName2,
                                                      style: Appstyle
                                                          .textstyle13Regular,
                                                      textAlign: TextAlign.left,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              if (inngs1over.isNotEmpty)
                                                Row(
                                                  children: [
                                                    Row(
                                                      children: [
                                                        Text(
                                                            // "344",
                                                            inngs2run,
                                                            style: inngs2run2
                                                                    .isEmpty
                                                                ? Appstyle
                                                                    .textstyle16bold
                                                                : Appstyle
                                                                    .textstyle13Regular),
                                                        Text(
                                                            // "/5",
                                                            "/$inngs2wicket",
                                                            style: inngs2run2
                                                                    .isEmpty
                                                                ? Appstyle
                                                                    .textstyle16bold
                                                                : Appstyle
                                                                    .textstyle13Regular),
                                                        Text(
                                                            // "(5)",
                                                            "  ($inngs2over)",
                                                            style: inngs2run2
                                                                    .isEmpty
                                                                ? Appstyle
                                                                    .textstyle13Regular
                                                                : Appstyle
                                                                    .textstyle11Regular)
                                                      ],
                                                    ),
                                                    if (inngs1over.isNotEmpty)
                                                      Row(
                                                        children: [
                                                          if (inngs2run2
                                                              .isNotEmpty)
                                                            Text(
                                                                "  &  $inngs2run2",
                                                                style: Appstyle
                                                                    .textstyle16bold),
                                                          if (inngs2wicket2
                                                              .isNotEmpty)
                                                            Text(
                                                                "/$inngs2wicket2",
                                                                style: Appstyle
                                                                    .textstyle16bold),
                                                          if (inngs2over2
                                                              .isNotEmpty)
                                                            Text(
                                                                "  ($inngs2over2)",
                                                                style: Appstyle
                                                                    .textstyle13Regular),
                                                        ],
                                                      ),
                                                  ],
                                                ),
                                            ],
                                          ),
                                          SizedBox(height: 8.h),
                                          Text(
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                            status,
                                            style: Appstyle.textStyle12
                                                .copyWith(
                                                    color:
                                                        AppColors.primaryText),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      );
                  }
                })))
      ]),
    );
  }

  Widget _buildVsText() {
    return SizedBox(
      width: 43,
      child: Center(
        child: Text(
          "V/s",
          style: Appstyle.textstyle15.copyWith(
            fontSize: 8,
            color: AppColors.whiteColor.withOpacity(0.4),
          ),
        ),
      ),
    );
  }
}
