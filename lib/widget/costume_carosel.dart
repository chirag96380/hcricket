import 'package:flutter/cupertino.dart';
import 'package:hcricket/widget/widgets_exports.dart';

// class CostumeCarosel extends StatefulWidget {
//   const CostumeCarosel({super.key});

//   @override
//   State<CostumeCarosel> createState() => _CostumeCaroselState();
// }

// class _CostumeCaroselState extends State<CostumeCarosel> {
//   final CarouselSliderController _carouselController =
//       CarouselSliderController();

//   @override
//   Widget build(BuildContext context) {
//     return
//         BlocBuilder<LiveScoreBloc, LiveScoreState>(builder: (context, state) {
//       var allMatches = state.liveScoreList.data?.typeMatches
//               ?.expand((typeMatch) => typeMatch.seriesMatches ?? [])
//               .expand(
//                   (seriesMatch) => seriesMatch.seriesAdWrapper?.matches ?? [])
//               .toList() ??
//           [];

//       switch (state.liveScoreList.status) {
//         case ApiStatus.loading:
//           return const Center(child: CupertinoActivityIndicator());
//         case ApiStatus.completed:
//           if (state.liveScoreList.data == null) {
//             return const Center(child: Text('No Series Found'));
//           }

//           return Column(
//             children: [
//               CarouselSlider.builder(
//                   carouselController: _carouselController,
//                   itemCount: allMatches.length,
//                   itemBuilder: (context, index, realIndex) {
//                     var match = allMatches[index].matchInfo;
//                     if (match == null) return const SizedBox();

//                     var seriesName = match.seriesName ?? 'No Series Name';
//                     var status = match.status ?? '';
//                     var team1photo = match.team1?.imageId;
//                     var team2photo = match.team2?.imageId;
//                     var team1 = match.team1?.teamSName;
//                     var team2 = match.team2?.teamSName;
//                     var run = allMatches[index].matchScore;
//                     var team1run = run?.team1Score?.inngs1?.runs ?? "0";
//                     var team1wic = run?.team1Score?.inngs1?.wickets ?? "0";
//                     var team1over = run?.team1Score?.inngs1?.overs ?? "0";
//                     var team2run = run?.team2Score?.inngs1?.runs ?? "0";
//                     var team2wic = run?.team2Score?.inngs1?.wickets ?? "0";
//                     var team2over = run?.team2Score?.inngs1?.overs ?? '0.0';
//                     var matchId =
//                         allMatches[index].matchInfo.matchId ?? 'No Series Name';

//                     return GestureDetector(
//                       onTap: () {
//                         Navigator.pushNamed(
//                             context, RoutesName.matchCoverageScreen,
//                             arguments: {
//                               "team1run": team1run,
//                               "team2run": team2run,
//                               "team1over": team1over,
//                               "team2over": team2over,
//                               "team1wic": team1wic,
//                               "team2wic": team2wic,
//                               "team1": team1,
//                               "team2": team2,
//                               "tem1flag": team1photo ??
//                                   "", // Ensure String, default empty
//                               "tem2flag": team2photo ??
//                                   "", // Ensure String, default empty
//                               "seriesName": seriesName ?? "",
//                               "matchId": matchId ?? '',
//                               "teamName":
//                                   allMatches[index].matchInfo.team1.teamSName,
//                               "matchDesc":
//                                   allMatches[index].matchInfo.matchFormat
//                             });
//                       },
//                       child: Padding(
//                           padding: EdgeInsets.all(5.0.h),
//                           child: Container(
//                             height: 200.h,
//                             decoration: const BoxDecoration(
//                                 image: DecorationImage(
//                                     image: AssetImage(AppImagepath.liveBg))),
//                             child: Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 15.verticalSpace,
//                                 Container(
//                                   margin: EdgeInsets.only(left: 30.w),
//                                   height: 18.h,
//                                   width: 56.w,
//                                   decoration: BoxDecoration(
//                                     color: AppColors.cricektColor,
//                                     borderRadius: BorderRadius.circular(12.r),
//                                   ),
//                                   child: Row(
//                                     mainAxisAlignment: MainAxisAlignment.center,
//                                     children: [
//                                       LottieBuilder.asset(
//                                         Applottiepath.livestatus,
//                                         height: 10.h,
//                                       ),
//                                       5.horizontalSpace,
//                                       Text(
//                                         AppString.live,
//                                         style: Appstyle.textstyle8,
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                                 6.verticalSpace,
//                                 Center(
//                                   child: Text(
//                                     seriesName.toString(),
//                                     style: Appstyle.textstyle11Regular,
//                                   ),
//                                 ),
//                                 12.verticalSpace,
//                                 Padding(
//                                   padding: EdgeInsets.only(
//                                       left: 18.0.w, right: 18.0.w),
//                                   child: Row(
//                                     mainAxisAlignment:
//                                         MainAxisAlignment.spaceEvenly,
//                                     children: [
//                                       SizedBox(
//                                         width: 120.w,
//                                         child: Column(
//                                           children: [
//                                             ClipRRect(
//                                               borderRadius:
//                                                   BorderRadius.circular(5.r),
//                                               child: Image.network(
//                                                 GetImage().FlagImage(
//                                                     flagId:
//                                                         team1photo.toString()),
//                                                 height: 27.h,
//                                                 fit: BoxFit.cover,
//                                                 errorBuilder: (context, error,
//                                                     stackTrace) {
//                                                   return const Icon(
//                                                       Icons.error);
//                                                 },
//                                               ),
//                                             ),
//                                             5.verticalSpace,
//                                             Text(
//                                               team1.toString(),
//                                               style: Appstyle.sptextstyle
//                                                   .copyWith(
//                                                       fontSize: 13.sp,
//                                                       color: AppColors
//                                                           .whiteColor
//                                                           .withOpacity(0.8)),
//                                             ),
//                                             3.verticalSpace,
//                                             Text(
//                                               "${team1run.toString()}/${team1wic.toString()} ($team1over) ",
//                                               style: Appstyle.textstyle14bold,
//                                             ),
//                                           ],
//                                         ),
//                                       ),
//                                       Text(
//                                         "V/S",
//                                         style: Appstyle.textstyle15Bold
//                                             .copyWith(
//                                                 color: AppColors.whiteColor
//                                                     .withOpacity(0.4)),
//                                       ),
//                                       SizedBox(
//                                         width: 120.w,
//                                         child: Column(
//                                           children: [
//                                             ClipRRect(
//                                               borderRadius:
//                                                   BorderRadius.circular(5.r),
//                                               child: Image.network(
//                                                 GetImage().FlagImage(
//                                                     flagId:
//                                                         team2photo.toString()),
//                                                 height: 27.h,
//                                                 fit: BoxFit.cover,
//                                                 errorBuilder: (context, error,
//                                                     stackTrace) {
//                                                   return const Icon(
//                                                       Icons.error);
//                                                 },
//                                               ),
//                                             ),
//                                             5.verticalSpace,
//                                             Text(
//                                               team2.toString(),
//                                               style: Appstyle.sptextstyle
//                                                   .copyWith(
//                                                       fontSize: 13.sp,
//                                                       color: AppColors
//                                                           .whiteColor
//                                                           .withOpacity(0.8)),
//                                             ),
//                                             3.verticalSpace,
//                                             Text(
//                                               "${team2run.toString()}/${team2wic.toString()} ($team2over) ",
//                                               style: Appstyle.textstyle14bold,
//                                             ),
//                                           ],
//                                         ),
//                                       )
//                                     ],
//                                   ),
//                                 ),
//                                 8.verticalSpace,
//                                 Padding(
//                                   padding: EdgeInsets.only(
//                                       left: 20.0.w, right: 20.w),
//                                   child: Center(
//                                     child: Text(
//                                       status,
//                                       style: Appstyle.textStyle11,
//                                       maxLines: 1,
//                                       overflow: TextOverflow.ellipsis,
//                                     ),
//                                   ),
//                                 )
//                               ],
//                             ),
//                           )),
//                     );
//                   },
//                   options: CarouselOptions(
//                     viewportFraction: 1.0,
//                     // autoPlay: (allMatches.length) > 1,
//                     onPageChanged: (index, reason) {
//                       context
//                           .read<LiveScoreBloc>()
//                           .add(UpdateCarouselIndex(index));
//                     },
//                   )),
//               3.verticalSpace,
//               BlocBuilder<LiveScoreBloc, LiveScoreState>(
//                   builder: (context, state) {
//                 return Center(
//                     child: SmoothPageIndicator(
//                         controller: PageController(),
//                         count: allMatches.length,
//                         effect: ExpandingDotsEffect(
//                             dotHeight: 5.h,
//                             dotWidth: 9.h,
//                             strokeWidth: 1.5,
//                             dotColor: AppColors.whiteColor.withOpacity(0.4),
//                             activeDotColor: AppColors.whiteColor),
//                         onDotClicked: (index) {
//                           _carouselController.animateToPage(index);
//                           context
//                               .read<LiveScoreBloc>()
//                               .add(UpdateCarouselIndex(index));
//                         }));
//               }),
//             ],
//           );
//       }
//     });
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';

class CostumeCarosel extends StatefulWidget {
  const CostumeCarosel({super.key});

  @override
  State<CostumeCarosel> createState() => _CostumeCaroselState();
}

class _CostumeCaroselState extends State<CostumeCarosel> {
  final CarouselSliderController _carouselController =
      CarouselSliderController();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LiveScoreBloc, LiveScoreState>(
      builder: (context, state) {
        var allMatches = state.liveScoreList.data?.typeMatches
                ?.expand((typeMatch) => typeMatch.seriesMatches ?? [])
                .expand(
                    (seriesMatch) => seriesMatch.seriesAdWrapper?.matches ?? [])
                .toList() ??
            [];

        // Handling loading state and error can be expanded as needed.
        if (state.liveScoreList.status == ApiStatus.loading) {
          return const Center(child: CupertinoActivityIndicator());
        }

        if (state.liveScoreList.data == null) {
          return const Center(child: Text('No Series Found'));
        }

        return Column(
          children: [
            CarouselSlider.builder(
              carouselController: _carouselController,
              itemCount: allMatches.length,
              itemBuilder: (context, index, realIndex) {
                var match = allMatches[index].matchInfo;
                if (match == null) return const SizedBox();

                var seriesName = match.seriesName ?? 'No Series Name';
                var status = match.status ?? '';
                var team1photo = match.team1?.imageId;
                var team2photo = match.team2?.imageId;
                var team1 = match.team1?.teamSName;
                var team2 = match.team2?.teamSName;
                var run = allMatches[index].matchScore;
                var team1run = run?.team1Score?.inngs1?.runs ?? "0";
                var team1wic = run?.team1Score?.inngs1?.wickets ?? "0";
                var team1over = run?.team1Score?.inngs1?.overs ?? "0";
                var team2run = run?.team2Score?.inngs1?.runs ?? "0";
                var team2wic = run?.team2Score?.inngs1?.wickets ?? "0";
                var team2over = run?.team2Score?.inngs1?.overs ?? '0.0';
                var matchId = match.matchId ?? 'No Series Name';

                return GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, RoutesName.matchCoverageScreen,
                        arguments: {
                          "team1run": team1run,
                          "team2run": team2run,
                          "team1over": team1over,
                          "team2over": team2over,
                          "team1wic": team1wic,
                          "team2wic": team2wic,
                          "team1": team1,
                          "team2": team2,
                          "tem1flag": team1photo ?? "",
                          "tem2flag": team2photo ?? "",
                          "seriesName": seriesName,
                          "matchId": matchId,
                          "teamName": match.team1?.teamSName,
                          "matchDesc": match.matchFormat,
                        });
                  },
                  child: Padding(
                    padding: EdgeInsets.all(5.0.h),
                    child: Container(
                      height: 200.h,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(AppImagepath.liveBg),
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          15.verticalSpace,
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
                          6.verticalSpace,
                          Center(
                            child: Text(
                              seriesName,
                              style: Appstyle.textstyle11Regular,
                            ),
                          ),
                          12.verticalSpace,
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 18.0.w),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                SizedBox(
                                  width: 120.w,
                                  child: Column(
                                    children: [
                                      ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(5.r),
                                        child: Image.network(
                                          GetImage().FlagImage(
                                              flagId: team1photo.toString()),
                                          height: 27.h,
                                          fit: BoxFit.cover,
                                          errorBuilder:
                                              (context, error, stackTrace) {
                                            return const Icon(Icons.error);
                                          },
                                        ),
                                      ),
                                      5.verticalSpace,
                                      Text(
                                        team1.toString(),
                                        style: Appstyle.sptextstyle.copyWith(
                                          fontSize: 13.sp,
                                          color: AppColors.whiteColor
                                              .withOpacity(0.8),
                                        ),
                                      ),
                                      3.verticalSpace,
                                      Text(
                                        "$team1run/$team1wic ($team1over)",
                                        style: Appstyle.textstyle14bold,
                                      ),
                                    ],
                                  ),
                                ),
                                Text(
                                  "V/S",
                                  style: Appstyle.textstyle15Bold.copyWith(
                                    color:
                                        AppColors.whiteColor.withOpacity(0.4),
                                  ),
                                ),
                                SizedBox(
                                  width: 120.w,
                                  child: Column(
                                    children: [
                                      ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(5.r),
                                        child: Image.network(
                                          GetImage().FlagImage(
                                              flagId: team2photo.toString()),
                                          height: 27.h,
                                          fit: BoxFit.cover,
                                          errorBuilder:
                                              (context, error, stackTrace) {
                                            return const Icon(Icons.error);
                                          },
                                        ),
                                      ),
                                      5.verticalSpace,
                                      Text(
                                        team2.toString(),
                                        style: Appstyle.sptextstyle.copyWith(
                                          fontSize: 13.sp,
                                          color: AppColors.whiteColor
                                              .withOpacity(0.8),
                                        ),
                                      ),
                                      3.verticalSpace,
                                      Text(
                                        "$team2run/$team2wic ($team2over)",
                                        style: Appstyle.textstyle14bold,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          8.verticalSpace,
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20.0.w),
                            child: Center(
                              child: Text(
                                status,
                                style: Appstyle.textStyle11,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                );
              },
              options: CarouselOptions(
                viewportFraction: 1.0,
                onPageChanged: (index, reason) {
                  context.read<LiveScoreBloc>().add(UpdateCarouselIndex(index));
                },
              ),
            ),
            3.verticalSpace,
            Center(
              child: SmoothPageIndicator(
                controller: PageController(),
                count: allMatches.length,
                effect: ExpandingDotsEffect(
                  dotHeight: 5.h,
                  dotWidth: 9.h,
                  strokeWidth: 1.5,
                  dotColor: AppColors.whiteColor.withOpacity(0.4),
                  activeDotColor: AppColors.whiteColor,
                ),
                onDotClicked: (index) {
                  _carouselController.animateToPage(index);
                  context.read<LiveScoreBloc>().add(UpdateCarouselIndex(index));
                },
              ),
            ),
          ],
        );
      },
    );
  }
}
