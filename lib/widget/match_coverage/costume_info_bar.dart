import 'package:flutter/material.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:hcricket/bloc/bloc_exports.dart';
import 'package:hcricket/bloc/matche_info_bloc/matche_info_bloc.dart';
import 'package:hcricket/bloc/matche_info_bloc/matche_info_event.dart';
import 'package:hcricket/bloc/matche_info_bloc/matche_info_state.dart';
import 'package:hcricket/repositery/match_http_api_repository.dart';
import 'package:hcricket/services/news_date_formatter.dart';
import 'package:hcricket/services/time_formatter.dart';
import 'package:hcricket/services/upcoming_matches_date_formatter.dart';
import 'package:hcricket/utils/textstyle.dart';
import 'package:hcricket/utils/utils_exports.dart';

class CostumeInfoBar extends StatefulWidget {
  const CostumeInfoBar({super.key});

  @override
  State<CostumeInfoBar> createState() => _CostumeInfoBarState();
}

class _CostumeInfoBarState extends State<CostumeInfoBar> {
  late MatchInfoBloc matchInfoBloc;

  @override
  void initState() {
    super.initState();
    matchInfoBloc =
        MatchInfoBloc(matcheInfoRepository: MatchHttpApiRepository());
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => matchInfoBloc..add(GetMatcheInfo()),
      child:
          BlocBuilder<MatchInfoBloc, MatchInfoState>(builder: (context, state) {
        var matchFormat = state.allMatchInfoList.data?.matchInfo?.matchFormat;
        var series = state.allMatchInfoList.data?.matchInfo?.series?.name;
        var date = state.allMatchInfoList.data?.matchInfo?.series?.startDate;
        var time = state.allMatchInfoList.data?.matchInfo?.series?.startDate;
        var toss = state.allMatchInfoList.data?.matchInfo?.status;
        var venue = state.allMatchInfoList.data?.venueInfo?.ground;
        var umpire = state.allMatchInfoList.data?.matchInfo?.umpire1?.name;
        var umpire2 = state.allMatchInfoList.data?.matchInfo?.umpire2?.name;
        var city = state.allMatchInfoList.data?.venueInfo?.city;
        var country = state.allMatchInfoList.data?.venueInfo?.country;
        var thiredrdumpire =
            state.allMatchInfoList.data?.matchInfo?.umpire3?.name;
        var referee = state.allMatchInfoList.data?.matchInfo?.referee?.name;
        var stadium = state.allMatchInfoList.data?.venueInfo?.ground;
        var capacity = state.allMatchInfoList.data?.venueInfo?.capacity;
        var ends = state.allMatchInfoList.data?.venueInfo?.ends;
        // var streaming = state.allMatchInfoList.data?.broadcastInfo["value"].;
        // var tv = state.allMatchInfoList.data?.broadcastInfo[1];

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
                borderRadius: BorderRadius.circular(30.r)),
            child: Padding(
              padding: EdgeInsets.only(
                  left: 20.0.w, top: 12.h, bottom: 12.h, right: 20.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: ListView(
                      children: [
                        8.verticalSpace,
                        _headerText(headertitle: "Info"),
                        8.verticalSpace,
                        _infoText(title: "Match", info: matchFormat.toString()),
                        _infoText(title: "Series", info: series.toString()),
                        _infoText(
                            title: "Date",
                            info: UpcomingMatchesDateFormatter()
                                .formatTimestamp(time)),
                        _infoText(
                            title: "Time",
                            info:
                                TimeFormatter.formatMatchTime(date.toString())),
                        _infoText(title: "Toss", info: toss.toString()),
                        _infoText(title: "Venue", info: "${venue}, ${city}"),
                        _infoText(
                            title: "Umpire", info: "${umpire}, ${umpire2}"),
                        _infoText(
                            title: "3rd Umpire",
                            info: thiredrdumpire.toString()),
                        _infoText(title: "Referee", info: referee.toString()),
                        8.verticalSpace,
                        _headerText(headertitle: "Venue Guide"),
                        8.verticalSpace,
                        _infoText(title: "Stadium", info: stadium.toString()),
                        _infoText(title: "City", info: city.toString()),
                        // _infoText(title: "Capacity", info: capacity.toString()),
                        // _infoText(title: "Ends", info: ends.toString()),
                        _infoText(
                            title: "Hosts to", info: "${city}, ${country}"),
                        8.verticalSpace,
                        // _headerText(headertitle: "Tv Guide-IN"),
                        // 8.verticalSpace,
                        // _infoText(
                        //     title: "Streaming", info: streaming.toString()),
                        // _infoText(title: "Tv", info: tv ?? ''),
                      ],
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
      margin: EdgeInsets.only(right: 120.w),
      decoration: ShapeDecoration(
          gradient: AppColors.seriesgradient,
          shape:
              BeveledRectangleBorder(borderRadius: BorderRadius.circular(7.r))),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.h, vertical: 5.h),
        child: Text(
          headertitle,
          style: Appstyle.textStyle12.copyWith(color: AppColors.whiteColor),
        ),
      ),
    );
  }

  Widget _infoText({required String title, required String info}) {
    return Padding(
      padding: const EdgeInsets.only(top: 4.0, bottom: 8.0),
      child: Row(
        children: [
          SizedBox(
            width: 90.w,
            child: Text(title,
                style: Appstyle.textstyle13
                    .copyWith(color: AppColors.whiteColor.withOpacity(0.8))),
          ),
          SizedBox(
            width: 190.w,
            child: Text(info,
                style: Appstyle.textstyle13Regular
                    .copyWith(color: AppColors.whiteColor.withOpacity(0.7))),
          ),
        ],
      ),
    );
  }
}
