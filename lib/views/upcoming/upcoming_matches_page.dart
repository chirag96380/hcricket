import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hcricket/bloc/upcoming_matches_bloc/upcoming_matches_bloc.dart';
import 'package:hcricket/bloc/upcoming_matches_bloc/upcoming_matches_event.dart';
import 'package:hcricket/bloc/upcoming_matches_bloc/upcoming_matches_state.dart';
import 'package:hcricket/services/time_formatter.dart';
import 'package:hcricket/utils/text_string.dart';
import 'package:hcricket/views/view.dart';

class UpcomingPage extends StatefulWidget {
  const UpcomingPage({super.key});

  @override
  State<UpcomingPage> createState() => _UpcomingPageState();
}

class _UpcomingPageState extends State<UpcomingPage> {
  late UpcomingMatchesBloc upcomingMatchesBloc;

  @override
  void initState() {
    super.initState();
    upcomingMatchesBloc = UpcomingMatchesBloc(
      upcomingMatchesTabRepository: MatchHttpApiRepository(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (_) => upcomingMatchesBloc..add(GetUpcomingMatcehs()),
        child: BlocBuilder<UpcomingMatchesBloc, UpcomingMatchesState>(
          builder: (context, state) {
            var data = state.upcomingmatchList.data;

            if (data == null ||
                data.typeMatches == null ||
                data.typeMatches!.isEmpty) {
              return const Center(child: Text('No recent matches available.'));
            }

            return SizedBox(
              height: 550.h,
              width: MediaQuery.of(context).size.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 12.w, bottom: 5.h),
                    child: Text(
                      AppString.upcomingMatchs,
                      style: Appstyle.textstyle15Bold,
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                      padding: EdgeInsets.only(bottom: 50.h),
                      itemCount: data.typeMatches?.length ?? 0,
                      itemBuilder: (context, groupIndex) {
                        var match = data.typeMatches?[groupIndex];
                        var seriesMatches = match?.seriesMatches;

                        if (seriesMatches == null || seriesMatches.isEmpty) {
                          return const SizedBox.shrink();
                        }

                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ...seriesMatches.map((matchData) {
                              var matches =
                                  matchData.seriesAdWrapper?.matches ?? [];

                              return Column(
                                children: matches.map((matchDetail) {
                                  var matchInfo = matchDetail.matchInfo;
                                  if (matchInfo == null) {
                                    return const SizedBox.shrink();
                                  }

                                  var teamSName1 =
                                      matchInfo.team1?.teamSName ?? "Team 1";
                                  var teamSName2 =
                                      matchInfo.team2?.teamSName ?? "Team 2";

                                  var team1 = matchInfo.team1?.imageId ?? "";
                                  var team2 = matchInfo.team2?.imageId ?? "";
                                  var venue = matchInfo.venueInfo?.ground ??
                                      "Unknown Venue";
                                  var city = matchInfo.venueInfo?.city ??
                                      "Unknown City";
                                  var matchTime = NewsDateFormatter()
                                      .formatTimestamp(matchInfo.startDate);

                                  return Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 6.h, vertical: 8.h),
                                    child: Container(
                                      height: 115.h,
                                      decoration: const BoxDecoration(
                                        image: DecorationImage(
                                          image: AssetImage(
                                              AppImagepath.tabUpcomingBg),
                                        ),
                                      ),
                                      child: Center(
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            SizedBox(height: 3.h),
                                            Text(
                                              matchInfo.seriesName ?? "",
                                              style: Appstyle.textstyle12Regular
                                                  .copyWith(
                                                color: AppColors.whiteColor
                                                    .withOpacity(0.6),
                                              ),
                                            ),
                                            SizedBox(height: 7.h),
                                            Padding(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 30.w),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  _team1Widget(team1.toString(),
                                                      teamSName1),
                                                  Text(
                                                    "V/S",
                                                    style: Appstyle
                                                        .textstyle15Bold
                                                        .copyWith(
                                                      color: AppColors
                                                          .whiteColor
                                                          .withOpacity(0.4),
                                                    ),
                                                  ),
                                                  _team2Widget(team2.toString(),
                                                      teamSName2),
                                                ],
                                              ),
                                            ),
                                            SizedBox(height: 10.h),
                                            Text(
                                              "$venue - $city",
                                              style: Appstyle.textstyle11Regular
                                                  .copyWith(
                                                color: AppColors.whiteColor
                                                    .withOpacity(0.6),
                                              ),
                                            ),
                                            Text(
                                              matchTime,
                                              style: Appstyle.textstyle10Regular
                                                  .copyWith(
                                                color: AppColors.whiteColor
                                                    .withOpacity(0.6),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                }).toList(),
                              );
                            }),
                          ],
                        );
                      },
                    ),
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _team1Widget(String teamId, String teamName) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(5.r),
          child: Image.network(
            GetImage().FlagImage(flagId: teamId),
            height: 25.h,
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) {
              return const Icon(Icons.error);
            },
          ),
        ),
        SizedBox(width: 10.w),
        Text(
          teamName,
          style: Appstyle.textstyle15,
          overflow: TextOverflow.ellipsis, // Prevent text overflow
        ),
      ],
    );
  }

  Widget _team2Widget(String teamId, String teamName) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          teamName,
          style: Appstyle.textstyle15,
          overflow: TextOverflow.ellipsis,
        ),
        SizedBox(width: 10.w),
        ClipRRect(
          borderRadius: BorderRadius.circular(5.r),
          child: Image.network(
            GetImage().FlagImage(flagId: teamId),
            height: 25.h,
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) {
              return const Icon(Icons.error);
            },
          ),
        ),
      ],
    );
  }
}
