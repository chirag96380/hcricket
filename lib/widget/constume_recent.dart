// import 'package:flutter/cupertino.dart';
// import 'package:hcricket/widget/widgets_exports.dart';

// class CostumeRecent extends StatefulWidget {
//   const CostumeRecent({super.key});

//   @override
//   State<CostumeRecent> createState() => _CostumeRecentState();
// }

// class _CostumeRecentState extends State<CostumeRecent> {
//   late RecentBloc recentBloc;

//   @override
//   void initState() {
//     super.initState();
//     recentBloc = RecentBloc(recentMatchesRepository: MatchHttpApiRepository());
//   }

//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (_) => recentBloc..add(GetRecent()),
//       child: BlocBuilder<RecentBloc, RecentState>(builder: (context, state) {
//         var data = state.recentMatches.data;
//         if (data == null ||
//             data.typeMatches == null ||
//             data.typeMatches!.isEmpty) {
//           return const Center(child: Text('No recent matches available.'));
//         }

//         switch (state.recentMatches.status) {
//           case ApiStatus.loading:
//             return const Center(child: CupertinoActivityIndicator());
//           case ApiStatus.completed:
//             if (state.recentMatches.data == null) {
//               return const Center(child: Text('No Series Found'));
//             }

//             return SizedBox(
//               height: 125.h,
//               child: ListView.builder(
//                 scrollDirection: Axis.horizontal,
//                 itemCount: data.typeMatches?.length ?? 0,
//                 itemBuilder: (BuildContext context, int index) {
//                   var match = data.typeMatches?[index];
//                   var seriesMatches = match?.seriesMatches;
//                   if (seriesMatches == null || seriesMatches.isEmpty) {
//                     return const SizedBox.shrink();
//                   }

//                   var matchData = seriesMatches[0];
//                   var inngs1run = matchData.seriesAdWrapper?.matches?[0]
//                           .matchScore?.team1Score?.inngs1?.runs
//                           ?.toString() ??
//                       '';
//                   var inngs2run = matchData.seriesAdWrapper?.matches?[0]
//                           .matchScore?.team2Score?.inngs1?.runs
//                           ?.toString() ??
//                       '';
//                   var inngs1wicket = matchData.seriesAdWrapper?.matches?[0]
//                           .matchScore?.team1Score?.inngs1?.wickets
//                           ?.toString() ??
//                       '';
//                   var inngs2wicket = matchData.seriesAdWrapper?.matches?[0]
//                           .matchScore?.team2Score?.inngs1?.wickets
//                           ?.toString() ??
//                       '';

//                   var inngs1over = matchData.seriesAdWrapper?.matches?[0]
//                           .matchScore?.team1Score?.inngs1?.overs
//                           ?.toString() ??
//                       '';

//                   var inngs2over = matchData.seriesAdWrapper?.matches?[0]
//                           .matchScore?.team2Score?.inngs1?.overs
//                           ?.toString() ??
//                       '';

//                   var status = matchData
//                           .seriesAdWrapper?.matches?[0].matchInfo?.status
//                           ?.toString() ??
//                       '';
//                   var teamSName1 = matchData.seriesAdWrapper?.matches?[0]
//                           .matchInfo?.team1?.teamSName
//                           ?.toString() ??
//                       '';
//                   var teamSName2 = matchData.seriesAdWrapper?.matches?[0]
//                           .matchInfo?.team2?.teamSName
//                           ?.toString() ??
//                       '';

//                   var matchDesc = matchData
//                           .seriesAdWrapper?.matches?[0].matchInfo?.matchDesc
//                           ?.toString() ??
//                       '';

//                   var city = matchData.seriesAdWrapper?.matches?[0].matchInfo
//                           ?.venueInfo?.city
//                           ?.toString() ??
//                       '';

//                   var team1 = matchData
//                       .seriesAdWrapper?.matches?[0].matchInfo?.team1?.imageId
//                       .toString();
//                   '';

//                   var team2 = matchData
//                       .seriesAdWrapper?.matches?[0].matchInfo?.team2?.imageId
//                       .toString();
//                   '';

//                   return GestureDetector(
//                     onTap: () {
//                       Navigator.pushNamed(
//                           context, RoutesName.recentMatchScreen);
//                     },
//                     child: Padding(
//                       padding: EdgeInsets.symmetric(horizontal: 6.0.w),
//                       child: Container(
//                         width: MediaQuery.of(context).size.width * 0.79,
//                         decoration: const BoxDecoration(
//                           image: DecorationImage(
//                             image: AssetImage(AppImagepath.recentBg),
//                           ),
//                         ),
//                         child: Padding(
//                           padding: EdgeInsets.symmetric(horizontal: 25.0.w),
//                           child: Column(
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Text(
//                                 " $matchDesc | $city",
//                                 style: Appstyle.textstyle10Regular.copyWith(
//                                     color: Colors.white.withOpacity(0.5)),
//                               ),
//                               SizedBox(height: 6.h),
//                               Row(
//                                 mainAxisAlignment:
//                                     MainAxisAlignment.spaceBetween,
//                                 children: [
//                                   Row(
//                                     children: [
//                                       ClipRRect(
//                                         borderRadius:
//                                             BorderRadius.circular(5.r),
//                                         child: Image.network(
//                                           GetImage().FlagImage(
//                                               flagId: team1.toString()),
//                                           height: 22.h,
//                                           fit: BoxFit.cover,
//                                           errorBuilder:
//                                               (context, error, stackTrace) {
//                                             return const Icon(Icons.error);
//                                           },
//                                         ),
//                                       ),
//                                       Padding(
//                                         padding: EdgeInsets.only(left: 12.w),
//                                         child: Text(teamSName1,
//                                             style: Appstyle.textstyle13Regular,
//                                             textAlign: TextAlign.left),
//                                       ),
//                                     ],
//                                   ),
//                                   Row(
//                                     children: [
//                                       Text(inngs1run,
//                                           style: Appstyle.textstyle16bold),
//                                       Text("/$inngs1wicket",
//                                           style: Appstyle.textstyle16bold),
//                                       Text("  ($inngs1over)",
//                                           style: Appstyle.textstyle13Regular)
//                                     ],
//                                   ),
//                                 ],
//                               ),
//                               SizedBox(height: 4.h),
//                               SizedBox(
//                                 width: 43.w,
//                                 child: Center(
//                                   child: Text(
//                                     "V/s",
//                                     style: Appstyle.textstyle15.copyWith(
//                                         fontSize: 8.h,
//                                         color: AppColors.whiteColor
//                                             .withOpacity(0.4)),
//                                   ),
//                                 ),
//                               ),
//                               SizedBox(height: 4.h),
//                               Row(
//                                 mainAxisAlignment:
//                                     MainAxisAlignment.spaceBetween,
//                                 children: [
//                                   Row(
//                                     children: [
//                                       ClipRRect(
//                                         borderRadius:
//                                             BorderRadius.circular(5.r),
//                                         child: Image.network(
//                                           GetImage().FlagImage(
//                                               flagId: team2.toString()),
//                                           height: 22.h,
//                                           fit: BoxFit.cover,
//                                           errorBuilder:
//                                               (context, error, stackTrace) {
//                                             return const Icon(Icons.error);
//                                           },
//                                         ),
//                                       ),
//                                       Padding(
//                                         padding: EdgeInsets.only(left: 12.w),
//                                         child: Text(
//                                           teamSName2,
//                                           style: Appstyle.textstyle13Regular,
//                                           textAlign: TextAlign.left,
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                   Row(
//                                     children: [
//                                       Text(inngs2run,
//                                           style: Appstyle.textstyle16bold),
//                                       Text("/$inngs2wicket",
//                                           style: Appstyle.textstyle16bold),
//                                       Text("  ($inngs2over)",
//                                           style: Appstyle.textstyle13Regular)
//                                     ],
//                                   ),
//                                 ],
//                               ),
//                               SizedBox(height: 8.h),
//                               Text(
//                                 maxLines: 1,
//                                 overflow: TextOverflow.ellipsis,
//                                 status,
//                                 style: Appstyle.textstyle12Regular.copyWith(
//                                     color: Colors.white.withOpacity(0.5)),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ),
//                     ),
//                   );
//                 },
//               ),
//             );
//         }
//       }),
//     );
//   }
// }

import 'package:flutter/cupertino.dart';
import 'package:hcricket/widget/widgets_exports.dart';

class CostumeRecent extends StatefulWidget {
  const CostumeRecent({super.key});

  @override
  State<CostumeRecent> createState() => _CostumeRecentState();
}

class _CostumeRecentState extends State<CostumeRecent> {
  late RecentBloc recentBloc;

  @override
  void initState() {
    super.initState();
    recentBloc = RecentBloc(recentMatchesRepository: MatchHttpApiRepository());
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => recentBloc..add(GetRecent()),
      child: BlocBuilder<RecentBloc, RecentState>(builder: (context, state) {
        var data = state.recentMatches.data;

        if (data == null ||
            data.typeMatches == null ||
            data.typeMatches!.isEmpty) {
          return const Center(child: Text('No recent matches available.'));
        }

        switch (state.recentMatches.status) {
          case ApiStatus.loading:
            return const Center(child: CupertinoActivityIndicator());

          case ApiStatus.completed:
            var allMatches = data.typeMatches!
                .expand((type) => type.seriesMatches ?? [])
                .expand((series) => series.seriesAdWrapper?.matches ?? [])
                .take(6)
                .toList();

            return SizedBox(
              height: 125.h,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: allMatches.length,
                itemBuilder: (BuildContext context, int index) {
                  var matchData = allMatches[index];
                  var matchInfo = matchData.matchInfo;

                  if (matchInfo == null) {
                    return const SizedBox.shrink();
                  }

                  var inngs1run = matchData.matchScore?.team1Score?.inngs1?.runs
                          ?.toString() ??
                      '';
                  var inngs2run = matchData.matchScore?.team2Score?.inngs1?.runs
                          ?.toString() ??
                      '';
                  var inngs1wicket = matchData
                          .matchScore?.team1Score?.inngs1?.wickets
                          ?.toString() ??
                      '';
                  var inngs2wicket = matchData
                          .matchScore?.team2Score?.inngs1?.wickets
                          ?.toString() ??
                      '';
                  var inngs1over = matchData
                          .matchScore?.team1Score?.inngs1?.overs
                          ?.toString() ??
                      '';
                  var inngs2over = matchData
                          .matchScore?.team2Score?.inngs1?.overs
                          ?.toString() ??
                      '';
                  var status = matchInfo.status?.toString() ?? '';
                  var teamSName1 = matchInfo.team1?.teamSName?.toString() ?? '';
                  var teamSName2 = matchInfo.team2?.teamSName?.toString() ?? '';
                  var matchDesc = matchInfo.matchDesc?.toString() ?? '';
                  var city = matchInfo.venueInfo?.city?.toString() ?? '';
                  var team1 = matchInfo.team1?.imageId?.toString() ?? '';
                  var team2 = matchInfo.team2?.imageId?.toString() ?? '';

                  return GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(
                          context, RoutesName.recentMatchScreen);
                    },
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 6.0.w),
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.79,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(AppImagepath.recentBg),
                          ),
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 25.0.w),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "$matchDesc | $city",
                                style: Appstyle.textstyle10Regular.copyWith(
                                    color: Colors.white.withOpacity(0.5)),
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
                                            BorderRadius.circular(5.r),
                                        child: Image.network(
                                          GetImage().FlagImage(flagId: team1),
                                          height: 22.h,
                                          fit: BoxFit.cover,
                                          errorBuilder:
                                              (context, error, stackTrace) {
                                            return const Icon(Icons.error);
                                          },
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(left: 12.w),
                                        child: Text(teamSName1,
                                            style: Appstyle.textstyle13Regular,
                                            textAlign: TextAlign.left),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Text(inngs1run,
                                          style: Appstyle.textstyle16bold),
                                      Text("/$inngs1wicket",
                                          style: Appstyle.textstyle16bold),
                                      Text("  ($inngs1over)",
                                          style: Appstyle.textstyle13Regular),
                                    ],
                                  ),
                                ],
                              ),
                              SizedBox(height: 4.h),
                              Center(
                                child: Text(
                                  "V/s",
                                  style: Appstyle.textstyle15.copyWith(
                                      fontSize: 8.h,
                                      color: AppColors.whiteColor
                                          .withOpacity(0.4)),
                                ),
                              ),
                              SizedBox(height: 4.h),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(5.r),
                                        child: Image.network(
                                          GetImage().FlagImage(flagId: team2),
                                          height: 22.h,
                                          fit: BoxFit.cover,
                                          errorBuilder:
                                              (context, error, stackTrace) {
                                            return const Icon(Icons.error);
                                          },
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(left: 12.w),
                                        child: Text(teamSName2,
                                            style: Appstyle.textstyle13Regular,
                                            textAlign: TextAlign.left),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Text(inngs2run,
                                          style: Appstyle.textstyle16bold),
                                      Text("/$inngs2wicket",
                                          style: Appstyle.textstyle16bold),
                                      Text("  ($inngs2over)",
                                          style: Appstyle.textstyle13Regular),
                                    ],
                                  ),
                                ],
                              ),
                              SizedBox(height: 8.h),
                              Text(
                                status,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: Appstyle.textstyle12Regular.copyWith(
                                    color: Colors.white.withOpacity(0.5)),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            );
        }
      }),
    );
  }
}
