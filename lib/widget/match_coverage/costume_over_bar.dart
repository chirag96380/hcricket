import 'package:flutter/material.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:hcricket/bloc/match_over_bloc/match_over_bloc.dart';
import 'package:hcricket/bloc/match_over_bloc/match_over_event.dart';
import 'package:hcricket/bloc/match_over_bloc/match_over_state.dart';
import 'package:hcricket/utils/textstyle.dart';
import 'package:hcricket/utils/utils_exports.dart';
import 'package:hcricket/widget/costume_divider.dart';
import 'package:hcricket/widget/widgets_exports.dart';

class CostumeOverBar extends StatefulWidget {
  final int matchId;
  final int endDate;
  final int inning;

  const CostumeOverBar(
      {super.key,
      required this.matchId,
      required this.endDate,
      required this.inning});

  @override
  State<CostumeOverBar> createState() => _CostumeOverBarState();
}

class _CostumeOverBarState extends State<CostumeOverBar> {
  late MatchOverBloc matchOverBloc;

  @override
  void initState() {
    super.initState();
    matchOverBloc = MatchOverBloc(overRepository: MatchHttpApiRepository());
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => matchOverBloc
        ..add(GetAllOverList(widget.matchId, widget.endDate, widget.inning)),
      child:
          BlocBuilder<MatchOverBloc, MatchOverState>(builder: (context, state) {
        print("widget.inning ${widget.inning}");
        return Padding(
          padding:
              EdgeInsets.only(top: 10.h, left: 10.w, right: 10.w, bottom: 10.w),
          child: Container(
            height: 95.h,
            width: 80.w,
            decoration: BoxDecoration(
              border: const GradientBoxBorder(
                gradient: AppColors.matchCoveragegradient,
                width: 1,
              ),
              borderRadius: BorderRadius.circular(30.r),
            ),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(
                      top: 15.h, left: 10.w, right: 10.w, bottom: 10.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                const CostumeDivider(),
                5.verticalSpace,
                Padding(
                  padding: EdgeInsets.only(right: 8.0.w, top: 5.h, bottom: 5.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 3.0),
                        child: playerData(
                            state.allOverList.data?.miniscore?.bowlerStriker
                                    ?.name
                                    .toString() ??
                                '',
                            100.w,
                            Appstyle.textStyle11
                                .copyWith(color: AppColors.primaryText)),
                      ),
                      playerData(
                          state.allOverList.data?.miniscore?.bowlerStriker
                                  ?.runsConceded
                                  .toString() ??
                              '',
                          40.w,
                          Appstyle.textStyle11
                              .copyWith(color: AppColors.whiteColor)),
                      playerData(
                          state.allOverList.data?.miniscore?.bowlerStriker
                                  ?.oversBowled
                                  .toString() ??
                              '',
                          40.w,
                          Appstyle.textStyle11
                              .copyWith(color: AppColors.whiteColor)),
                      playerData(
                          state.allOverList.data?.miniscore?.bowlerStriker
                                  ?.wicketsTaken
                                  .toString() ??
                              '0',
                          30.w,
                          Appstyle.textStyle11
                              .copyWith(color: AppColors.whiteColor)),
                      playerData(
                          state.allOverList.data?.miniscore?.bowlerStriker
                                  ?.wicketsTaken
                                  .toString() ??
                              '0',
                          30.w,
                          Appstyle.textStyle11
                              .copyWith(color: AppColors.whiteColor)),
                      playerData(
                          state.allOverList.data?.miniscore?.bowlerStriker
                                  ?.economy
                                  .toString() ??
                              '0',
                          50.w,
                          Appstyle.textStyle11
                              .copyWith(color: AppColors.whiteColor)),
                    ],
                  ),
                ),
                5.verticalSpace,
                Container(
                    height: 205.h,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        border: const GradientBoxBorder(
                          gradient: AppColors.blowerCoveragegradient,
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(35.r)),
                    child: ListView.builder(
                      itemCount:
                          state.allOverList.data?.overSepList?.overSep?.length,
                      itemBuilder: (context, index) {
                        var batter =
                            "${state.allOverList.data?.overSepList?.overSep?[index].ovrBatNames.toString()} ${state.allOverList.data?.overSepList?.overSep?[index].ovrBowlNames.toString()}";
                        String cleanedbatter =
                            batter.replaceAll("[", "").replaceAll("]", "");

                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left: 5.0.w),
                              child: SizedBox(
                                height: 70.h,
                                width: 300.w,
                                child: Row(
                                  children: [
                                    SizedBox(
                                      width: 70.w,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                              "Ov ${state.allOverList.data?.overSepList?.overSep?[index].overNum.toString()} ",
                                              style: Appstyle.textStyle12
                                                  .copyWith(
                                                      color: AppColors
                                                          .whiteColor)),
                                          Text(
                                              "${state.allOverList.data?.overSepList?.overSep?[index].runs.toString()} runs",
                                              style:
                                                  Appstyle.textstyle12Regular),
                                        ],
                                      ),
                                    ),
                                    6.horizontalSpace,
                                    Expanded(
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(cleanedbatter,
                                                style: Appstyle
                                                    .textstyle12Regular
                                                    .copyWith(
                                                        color: AppColors
                                                            .whiteColor)),
                                            3.horizontalSpace,
                                            Wrap(
                                              spacing: 4.0,
                                              children: (state
                                                          .allOverList
                                                          .data
                                                          ?.overSepList
                                                          ?.overSep?[index]
                                                          .overSummary
                                                          ?.trim()
                                                          .split(" ") ??
                                                      [])
                                                  .map((ball) => Container(
                                                        height: 16.h,
                                                        width: 16.h,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: getBallColor(
                                                              ball), // Dynamic color
                                                          shape:
                                                              BoxShape.circle,
                                                        ),
                                                        child: Center(
                                                          child: Text(
                                                            ball,
                                                            style: Appstyle
                                                                .textStyle10
                                                                .copyWith(
                                                                    color: Colors
                                                                        .white),
                                                          ),
                                                        ),
                                                      ))
                                                  .toList(),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            const CostumeSecondDivider()
                          ],
                        );
                      },
                    )),
                Container(
                  height: 50.h,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    border: const GradientBoxBorder(
                      gradient: AppColors.blowerCoveragegradient,
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(35.r),
                  ),
                  child: Padding(
                    padding:
                        EdgeInsets.only(top: 12.0.h, left: 8.w, right: 8.w),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: formatOverStats(state
                                    .allOverList.data?.miniscore?.curOvsStats ??
                                "")
                            .split(" ")
                            .where((ball) => ball.isNotEmpty)
                            .map((ball) {
                          if (ball == "|") {
                            // If it's "|", just show text without a container
                            return Padding(
                              padding: EdgeInsets.symmetric(horizontal: 2.w),
                              child: Text(
                                "|",
                                style: Appstyle.textstyle18bold.copyWith(
                                    color: Colors.white), // Separator style
                              ),
                            );
                          } else {
                            return Padding(
                              padding: EdgeInsets.symmetric(horizontal: 2.w),
                              child: Container(
                                height: 40.h,
                                width: 40.h,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: AppColors.notificationbgColor
                                      .withOpacity(0.5),
                                ),
                                child: Center(
                                  child: Text(
                                    ball,
                                    style: Appstyle.textstyle18bold
                                        .copyWith(color: Colors.white),
                                  ),
                                ),
                              ),
                            );
                          }
                        }).toList(),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      }),
    );
  }
}

Widget headerText(String title, double size) {
  return SizedBox(
    width: size,
    child: Padding(
      padding: EdgeInsets.only(left: 6.w),
      child: Text(title,
          style: Appstyle.textStyle11.copyWith(color: AppColors.whiteColor)),
    ),
  );
}

Widget playerData(String name, double size, TextStyle style) {
  return SizedBox(
    width: size,
    child: Padding(
      padding: EdgeInsets.only(left: 6.w),
      child: Text(name, style: style),
    ),
  );
}

Color getBallColor(String ball) {
  switch (ball) {
    case '4':
      return AppColors.redColor;
    case '6':
      return AppColors.orangeColor;
    case '1':
      return AppColors.blueColor;
    case '2':
      return AppColors.purpleColor;
    case '3':
      return AppColors.cyanColor;
    case '0':
      return AppColors.greenColor;
    case 'W':
      return AppColors.deepPurpleColor;
    case 'Nb':
      return AppColors.yellowColor;
    case 'Wd':
      return AppColors.pinkColor;
    case 'B':
      return AppColors.brownColor;
    case 'Lb':
      return AppColors.tealColor;
    default:
      return AppColors.greyColor;
  }
}

String formatOverStats(String curOvsStats) {
  // Remove "..." and trim extra spaces
  curOvsStats = curOvsStats.replaceAll("...", "").trim();

  // Ensure the spacing is consistent and return the formatted string
  return curOvsStats;
}
