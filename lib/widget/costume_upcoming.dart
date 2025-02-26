import 'package:flutter/cupertino.dart';
import 'package:hcricket/widget/widgets_exports.dart';

class CostumeUpcoming extends StatefulWidget {
  const CostumeUpcoming({super.key});

  @override
  State<CostumeUpcoming> createState() => _CostumeUpcomingState();
}

class _CostumeUpcomingState extends State<CostumeUpcoming> {
  late UpcomingBloc upcomingBloc;

  @override
  void initState() {
    super.initState();
    upcomingBloc = UpcomingBloc(
      upcomingMatchesRepository: MatchHttpApiRepository(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => upcomingBloc..add(GetUpcoming()),
      child: BlocBuilder<UpcomingBloc, UpcomingState>(
        builder: (context, state) {
          var data = state.upcomingMatches.data;

          if (data == null ||
              data.typeMatches == null ||
              data.typeMatches!.isEmpty) {
            return const Center(child: Text('No recent matches available.'));
          }

          switch (state.upcomingMatches.status) {
            case ApiStatus.loading:
              return const Center(child: CupertinoActivityIndicator());
            case ApiStatus.completed:
              var allMatches = data.typeMatches!
                  .expand((type) => type.seriesMatches ?? [])
                  .expand((series) => series.seriesAdWrapper?.matches ?? [])
                  .take(6)
                  .toList();

              return SizedBox(
                height: 112.h,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: allMatches.length,
                  itemBuilder: (BuildContext context, int index) {
                    var matchInfo = allMatches[index].matchInfo;
                    if (matchInfo == null) return const SizedBox.shrink();

                    var matchDesc = matchInfo.matchDesc ?? '';
                    var matchFormat = matchInfo.matchFormat ?? '';
                    var matchTime = matchInfo.startDate ?? '';
                    var matchDate = matchInfo.startDate ?? '';
                    var city = matchInfo.venueInfo?.city ?? '';
                    var team1 = matchInfo.team1?.imageId?.toString() ?? '';
                    var team2 = matchInfo.team2?.imageId?.toString() ?? '';

                    return Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8.0.w),
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.60,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(AppImagepath.upcomingBg),
                          ),
                        ),
                        child: Stack(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left: 15.w, right: 15.w),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
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
                                      5.verticalSpace,
                                      Text(
                                        "V/s",
                                        style: Appstyle.textstyle15.copyWith(
                                          fontSize: 10.h,
                                          color: AppColors.whiteColor
                                              .withOpacity(0.4),
                                        ),
                                      ),
                                      3.verticalSpace,
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
                                    ],
                                  ),
                                  14.horizontalSpace,
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Text(
                                        " $matchDesc | $matchFormat ",
                                        style: Appstyle.textstyle10Regular,
                                      ),
                                      Text(
                                        TimeFormatter.formatMatchTime(
                                            matchTime),
                                        style: Appstyle.textstyle17bold,
                                      ),
                                      10.verticalSpace,
                                      Text(
                                        UpcomingMatchesDateFormatter()
                                            .formatTimestamp(matchDate),
                                        style: Appstyle.textstyle12Regular,
                                      ),
                                      Text(
                                        city,
                                        style: Appstyle.textstyle11Regular
                                            .copyWith(
                                          color: Colors.white.withOpacity(0.5),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              );
          }
        },
      ),
    );
  }
}
