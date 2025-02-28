import 'package:flutter/material.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:hcricket/bloc/bloc_exports.dart';
import 'package:hcricket/bloc/squads_bloc/squads_bloc.dart';
import 'package:hcricket/bloc/squads_bloc/squads_event.dart';
import 'package:hcricket/bloc/squads_bloc/squads_state.dart';
import 'package:hcricket/repositery/match_http_api_repository.dart';
import 'package:hcricket/utils/path/image_path.dart';
import 'package:hcricket/utils/textstyle.dart';
import 'package:hcricket/utils/utils_exports.dart';
import 'package:hcricket/widget/widgets_exports.dart';

class CostumeSquadsBar extends StatefulWidget {
  final int matchId;

  const CostumeSquadsBar({super.key, required this.matchId});

  @override
  State<CostumeSquadsBar> createState() => _CostumeSquadsBarState();
}

class _CostumeSquadsBarState extends State<CostumeSquadsBar> {
  late SquadsBloc squadsBloc;

  @override
  void initState() {
    super.initState();
    squadsBloc = SquadsBloc(squadsRepository: MatchHttpApiRepository());
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => squadsBloc..add(GetSquads(widget.matchId)),
      child: BlocBuilder<SquadsBloc, SquadsState>(builder: (context, state) {
        var team1 = state.squadsList.data?.team1?.team?.teamSName;
        var team2 = state.squadsList.data?.team2?.team?.teamSName;

        var team1img = state.squadsList.data?.team1?.team?.imageId;
        var team2img = state.squadsList.data?.team2?.team?.imageId;

        return Padding(
          padding:
              EdgeInsets.only(top: 15.h, left: 10.w, right: 10.w, bottom: 10.w),
          child: Container(
            height: 90.h,
            width: 80.w,
            decoration: BoxDecoration(
                border: const GradientBoxBorder(
                  gradient: AppColors.matchCoveragegradient,
                  width: 1,
                ),
                borderRadius: BorderRadius.circular(30.r)),
            child: Padding(
              padding: EdgeInsets.only(left: 12.w, right: 12.w, top: 12.h),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 15.0.w, right: 15.0.w),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              SizedBox(
                                  height: 19.h,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(3.r),
                                    child: Image.network(
                                      GetImage().FlagImage(
                                          flagId: team1img.toString()),
                                      height: 40.h,
                                      fit: BoxFit.cover,
                                      errorBuilder:
                                          (context, error, stackTrace) {
                                        return const Icon(Icons.error);
                                      },
                                    ),
                                  )),
                              10.horizontalSpace,
                              Text(
                                team1.toString(),
                                style: Appstyle.textstyle13,
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                team2.toString(),
                                style: Appstyle.textstyle13,
                              ),
                              10.horizontalSpace,
                              SizedBox(
                                  height: 19.h,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(3.r),
                                    child: Image.network(
                                      GetImage().FlagImage(
                                          flagId: team2img.toString()),
                                      height: 40.h,
                                      fit: BoxFit.cover,
                                      errorBuilder:
                                          (context, error, stackTrace) {
                                        return const Icon(Icons.error);
                                      },
                                    ),
                                  )),
                            ],
                          )
                        ]),
                  ),
                  12.verticalSpace,
                  Expanded(
                    child: ListView.builder(
                      itemCount: 3,
                      itemBuilder: (BuildContext context, int index) {
                        List<dynamic>? sectionData;
                        List<dynamic>? sectionData2;

                        String title = "";

                        // Playing XI
                        if (index == 0) {
                          sectionData =
                              state.squadsList.data?.team1?.players?.playingXi;
                          sectionData2 =
                              state.squadsList.data?.team2?.players?.playingXi;
                          title = "Playing XI";
                        }
                        // Bench Players
                        else if (index == 1) {
                          sectionData =
                              state.squadsList.data?.team1?.players?.bench;
                          sectionData2 =
                              state.squadsList.data?.team2?.players?.bench;
                          title = "Bench";
                        }
// Support Staff
                        else if (index == 2) {
                          sectionData = state.squadsList.data?.team1?.players
                              ?.supportStaff; // ✅ Corrected
                          sectionData2 = state.squadsList.data?.team2?.players
                              ?.supportStaff; // ✅ Corrected
                          title = "Support Staff";
                        }
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(
                                  left: 15.w,
                                  right: 15.w,
                                  top: 7.h,
                                  bottom: 7.h),
                              child: _headerText(headertitle: title),
                            ),
                            if ((index == 0 || index == 1 || index == 2) &&
                                sectionData != null &&
                                sectionData2 != null)
                              ListView.builder(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount: sectionData.length,
                                itemBuilder: (BuildContext context, int index) {
                                  var player = sectionData?[index];
                                  var player2 = sectionData2?[index];
                                  return Column(
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.only(top: 5.h),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            SizedBox(
                                              height: 40.h,
                                              width: 150.w,
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(3.0),
                                                child: Row(
                                                  children: [
                                                    CircleAvatar(
                                                      backgroundImage:
                                                          NetworkImage(
                                                        GetSquadImage()
                                                            .FlagImage(
                                                          flagId: player
                                                                  .faceImageId
                                                                  .toString() ??
                                                              '',
                                                        ),
                                                      ),
                                                    ),
                                                    5.horizontalSpace,
                                                    Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                          "${(player.nickName?.length ?? 0) > 13 ? player.nickName!.substring(0, 13) : player.nickName ?? ''}"
                                                          "${state.squadsList.data?.team1?.players?.playingXi[index].captain == true ? ' (C)' : ''}"
                                                          "${state.squadsList.data?.team1?.players?.playingXi[index].keeper == true ? ' (WK)' : ''}",
                                                          style: Appstyle
                                                              .textstyle10Regular
                                                              .copyWith(
                                                                  color: AppColors
                                                                      .whiteColor),
                                                          maxLines: 1,
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                        ),
                                                        Text(
                                                          player.role
                                                                  .toString() ??
                                                              '',
                                                          maxLines: 1,
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                          style: Appstyle
                                                              .textstyle10Regular,
                                                        ),
                                                      ],
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              height: 40.h,
                                              width: 160.w,
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(3.0),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.end,
                                                  children: [
                                                    Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .end,
                                                      children: [
                                                        Text(
                                                          "${(player.nickName?.length ?? 0) > 13 ? player.nickName!.substring(0, 13) : player2.nickName ?? ''}"
                                                          "${state.squadsList.data?.team2?.players?.playingXi[index].captain == true ? ' (C)' : ''}"
                                                          "${state.squadsList.data?.team2?.players?.playingXi[index].keeper == true ? ' (WK)' : ''}",

                                                          // player2.nickName
                                                          //         .toString() ??
                                                          //     '',
                                                          style: Appstyle
                                                              .textstyle10Regular
                                                              .copyWith(
                                                                  color: AppColors
                                                                      .whiteColor),
                                                          maxLines: 1,
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                        ),
                                                        Text(
                                                          player2.role
                                                                  .toString() ??
                                                              '',
                                                          maxLines: 1,
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                          style: Appstyle
                                                              .textstyle10Regular,
                                                        ),
                                                      ],
                                                    ),
                                                    5.horizontalSpace,
                                                    CircleAvatar(
                                                      backgroundImage:
                                                          NetworkImage(
                                                        GetSquadImage()
                                                            .FlagImage(
                                                          flagId: player2
                                                                  .faceImageId
                                                                  .toString() ??
                                                              '',
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(
                                            left: 10.w,
                                            right: 10.w,
                                            top: 6.h,
                                            bottom: 6.h),
                                        height: 1.h,
                                        decoration: BoxDecoration(
                                            gradient: LinearGradient(colors: [
                                          const Color(0xff999999)
                                              .withOpacity(0.3),
                                          const Color(0xffFFFFFF),
                                          const Color(0xff999999)
                                              .withOpacity(0.3),
                                        ])),
                                      ),
                                    ],
                                  );
                                },
                              ),
                          ],
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }

  Widget _headerText({
    required String headertitle,
  }) {
    return Container(
      decoration: ShapeDecoration(
          gradient: AppColors.seriesgradient,
          shape:
              BeveledRectangleBorder(borderRadius: BorderRadius.circular(7.r))),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.h, vertical: 4.h),
        child: Text(
          headertitle,
          style: Appstyle.textStyle11
              .copyWith(color: AppColors.whiteColor.withOpacity(0.7)),
        ),
      ),
    );
  }
}
