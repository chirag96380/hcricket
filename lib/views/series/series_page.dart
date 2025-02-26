import 'package:hcricket/views/view.dart';

class SeriesPage extends StatefulWidget {
  const SeriesPage({super.key});

  @override
  State<SeriesPage> createState() => _SeriesPageState();
}

class _SeriesPageState extends State<SeriesPage> {
  // late MatchSeriesBloc matchSeriesBloc;

  @override
  void initState() {
    super.initState();
    // matchSeriesBloc =
    //     MatchSeriesBloc(matchRepository: MatchHttpApiRepository());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:
            //   BlocProvider(
            // create: (_) => matchSeriesBloc..add(GetAllSeriesList()),
            // child: BlocBuilder<MatchSeriesBloc, MatchSeriesState>(
            // builder: (context, state) {
            // switch (state.allSeriesList.status) {
            //   case ApiStatus.loading:
            //     return const Center(child: CircularProgressIndicator());
            // case ApiStatus.completed:
            // if (state.allSeriesList.data == null) {
            //   return const Center(child: Text('No Series Found'));
            // }
            // log('state length ${state.allSeriesList.data?.response?.length}');
            // final seriesDate = state.allSeriesList.data?.response;
            // return
            ListView.builder(
                itemCount: 9,
                itemBuilder: (context, groupIndex) {
                  return Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 16.0),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              decoration: ShapeDecoration(
                                  gradient: AppColors.seriesgradient,
                                  shape: BeveledRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(7.r))),
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 10.h, vertical: 5.h),
                                child: Text(
                                  'Feb 15 - Mar 30',
                                  // "Feb 15 - Mar 30",
                                  style: Appstyle.textstyle12Regular
                                      .copyWith(color: AppColors.whiteColor),
                                ),
                              ),
                            ),
                            SizedBox(height: 10.h),
                            ListView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: 5,
                              itemBuilder: (context, eventIndex) {
                                return Padding(
                                  padding: const EdgeInsets.only(top: 8.0),
                                  child: Container(
                                      height: 60.h,
                                      decoration: const BoxDecoration(
                                          image: DecorationImage(
                                              image: AssetImage(
                                                  'assest/images/series_bg.png'))),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.only(
                                                left: 10.0.w, right: 10.0.w),
                                            child: Text(
                                              "  seriesDate?[groupIndex] ",
                                              style:
                                                  Appstyle.textstyle13Regular,
                                            ),
                                          ),
                                          3.verticalSpace,
                                          Align(
                                            alignment: Alignment.bottomRight,
                                            child: Padding(
                                              padding:
                                                  EdgeInsets.only(right: 30.w),
                                              child: Text(
                                                "seriesDate?[groupIndex]",
                                                style: Appstyle
                                                    .textstyle11Regular
                                                    .copyWith(
                                                        color: AppColors
                                                            .primaryText),
                                              ),
                                            ),
                                          ),
                                        ],
                                      )),
                                );
                              },
                            )
                          ]));
                }));
  }
  // }
  // ),
  // )
  // );
}
// }
