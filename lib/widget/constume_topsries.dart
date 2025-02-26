import 'package:hcricket/widget/widgets_exports.dart';

class ConstumeTopsries extends StatefulWidget {
  const ConstumeTopsries({super.key});

  @override
  State<ConstumeTopsries> createState() => _ConstumeTopsriesState();
}

class _ConstumeTopsriesState extends State<ConstumeTopsries> {
  late TopStoriesBloc topStoriesBloc;
  late NewsBloc newsBloc;

  @override
  void initState() {
    super.initState();

    newsBloc = NewsBloc(newsRepository: MatchHttpApiRepository());

    // topStoriesBloc =
    //     TopStoriesBloc(topStoriesRepository: MatchHttpApiRepository());
  }

  @override
  Widget build(BuildContext context) {
    return

        //  BlocProvider(
        //     create: (_) => topStoriesBloc..add(GetTopSeries()),
        //     child:
        // BlocBuilder<TopStoriesBloc, TopStoriesState>(
        //     builder: (context, state) {
        //   return

        BlocProvider(
            create: (_) => newsBloc..add(GetAllNews()),
            child: BlocBuilder<NewsBloc, NewsState>(
              builder: (context, state) {
                return SizedBox(
                  height: 103.h,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    // itemCount: state.topSeries.data?.homepage.length ?? 3,
                    // itemCount: state.allListNews.data?.storyList.length ?? 3,
                    itemCount: 6,

                    itemBuilder: (BuildContext context, int index) {
                      final item = state.allListNews.data?.storyList[index];

                      var newsImage = state
                              .allListNews.data?.storyList[index].story?.imageId
                              .toString() ??
                          '';

                      var intro = state
                              .allListNews.data?.storyList[index].story?.hline
                              .toString() ??
                          '';

                      var pubTime = state
                          .allListNews.data?.storyList[index].story?.pubTime;

                      // var pubTime =
                      //     state.topSeries.data?.homepage[index].stories?.publishedTime;

                      var newsId =
                          state.allListNews.data?.storyList[index].story?.id;

                      if (item?.ad != null) {
                        return const SizedBox.shrink();
                      }

                      return GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(
                                context, RoutesName.newsDetailScreen,
                                arguments: {"newsId": newsId});
                          },
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 8.0.w),
                            child: Stack(
                              children: [
                                Container(
                                    width: 300.w,
                                    decoration: const BoxDecoration(
                                      image: DecorationImage(
                                        image: AssetImage(
                                          AppImagepath.newsBg,
                                        ),
                                      ),
                                    ),
                                    child: Row(
                                      children: [
                                        Container(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height /
                                              MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              112,
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.17,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(
                                                  MediaQuery.of(context)
                                                          .size
                                                          .height *
                                                      0.035),
                                              bottomLeft: Radius.circular(
                                                  MediaQuery.of(context)
                                                          .size
                                                          .height *
                                                      0.035),
                                            ),
                                            image: DecorationImage(
                                              image: NetworkImage(
                                                GetImage().FlagImage(
                                                    flagId:
                                                        newsImage.toString()),
                                              ),
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            SizedBox(
                                              height: 80.h,
                                              width: 140.h,
                                              child: Padding(
                                                padding: EdgeInsets.only(
                                                    left: 8.w, top: 4.h),
                                                child: Text(
                                                  intro.toString(),
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  maxLines: 4,
                                                  style: Appstyle
                                                      .textstyle13Regular,
                                                ),
                                              ),
                                            ),
                                            Text(
                                              NewsDateFormatter()
                                                  .formatTimestamp((pubTime)),
                                              textAlign: TextAlign.right,
                                              style: Appstyle.textstyle11Regular
                                                  .copyWith(
                                                      color: AppColors
                                                          .whiteColor
                                                          .withOpacity(0.4)),
                                            )
                                          ],
                                        )
                                      ],
                                    )),
                                Container(
                                  width: 300.w,
                                  decoration: const BoxDecoration(
                                    image: DecorationImage(
                                      image: AssetImage(
                                        AppImagepath.newsBg,
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ));
                    },
                  ),
                );
              },
            ));
  }
}
