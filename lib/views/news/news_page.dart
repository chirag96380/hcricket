import 'package:hcricket/views/view.dart';

class NewsPage extends StatefulWidget {
  const NewsPage({super.key});

  @override
  State<NewsPage> createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  late NewsBloc newsBloc;
  late ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    newsBloc = NewsBloc(newsRepository: MatchHttpApiRepository());
    _scrollController = ScrollController();

    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        newsBloc.add(GetAllNews()); // Fetch more news
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BlocProvider(
            create: (_) => newsBloc..add(GetAllNews()),
            child: BlocBuilder<NewsBloc, NewsState>(builder: (context, state) {
              return Padding(
                padding: EdgeInsets.only(left: 12.w, right: 12.w, bottom: 35.h),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      6.verticalSpace,
                      Text(
                        AppString.get_the_latest_updates,
                        style: Appstyle.textstyle15,
                      ),
                      12.verticalSpace,
                      Expanded(
                        child: ListView.builder(
                          itemCount: state.allListNews.data?.storyList.length,
                          controller: _scrollController,
                          itemBuilder: (BuildContext context, int index) {
                            if (index ==
                                (state.allListNews.data?.storyList.length ??
                                    0)) {
                              return Center(
                                child: Padding(
                                  padding: EdgeInsets.all(10.h),
                                  child: CircularProgressIndicator(), // Loader
                                ),
                              );
                            }

                            var newsImage = state.allListNews.data
                                    ?.storyList[index].story?.imageId
                                    .toString() ??
                                '';

                            final item =
                                state.allListNews.data?.storyList[index];
                            if (item?.ad != null) {
                              return const SizedBox.shrink();
                            }

                            return GestureDetector(
                                onTap: () {
                                  Navigator.pushNamed(
                                      context, RoutesName.newsDetailScreen,
                                      arguments: {
                                        "newsId": state.allListNews.data
                                            ?.storyList[index].story?.id,
                                      });
                                },
                                child: Stack(
                                  children: [
                                    Container(
                                        height: 120.h,
                                        decoration: const BoxDecoration(
                                            image: DecorationImage(
                                                image: AssetImage(AppImagepath
                                                    .detailnewsBg))),
                                        child: Row(
                                          children: [
                                            Container(
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height /
                                                  MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  120,
                                              width: 125.h,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.only(
                                                    topLeft: Radius.circular(
                                                      MediaQuery.of(context)
                                                              .size
                                                              .height *
                                                          0.035.r,
                                                    ),
                                                    bottomLeft: Radius.circular(
                                                      MediaQuery.of(context)
                                                              .size
                                                              .height *
                                                          0.035.r,
                                                    ),
                                                  ),
                                                  image: DecorationImage(
                                                      image: NetworkImage(
                                                        GetImage().FlagImage(
                                                            flagId: newsImage
                                                                .toString()),
                                                      ),
                                                      filterQuality:
                                                          FilterQuality.high,
                                                      fit: BoxFit.cover)),
                                            ),
                                            Column(
                                              children: [
                                                6.verticalSpace,
                                                SizedBox(
                                                  height: 63.h,
                                                  width: 155.h,
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsets.all(8.0.h),
                                                    child: Text(
                                                      state
                                                              .allListNews
                                                              .data
                                                              ?.storyList[index]
                                                              .story
                                                              ?.hline
                                                              .toString() ??
                                                          '',
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      maxLines: 3,
                                                      style:
                                                          Appstyle.textstyle13,
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 24.h,
                                                  width: 165.h,
                                                  child: Padding(
                                                    padding: EdgeInsets.only(
                                                        left: 12.0.w),
                                                    child: Text(
                                                      state
                                                              .allListNews
                                                              .data
                                                              ?.storyList[index]
                                                              .story
                                                              ?.context
                                                              .toString() ??
                                                          '',
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      maxLines: 1,
                                                      style: Appstyle
                                                          .textstyle10Regular,
                                                    ),
                                                  ),
                                                ),
                                                Text(
                                                  textAlign: TextAlign.right,
                                                  NewsDateFormatter()
                                                      .formatTimestamp((state
                                                          .allListNews
                                                          .data
                                                          ?.storyList[index]
                                                          .story
                                                          ?.pubTime)),
                                                  style: Appstyle
                                                      .textstyle11Regular,
                                                ),
                                              ],
                                            )
                                          ],
                                        )),
                                    Container(
                                      height: 120.h,
                                      decoration: const BoxDecoration(
                                          image: DecorationImage(
                                              image: AssetImage(
                                                  AppImagepath.detailnewsBg))),
                                    )
                                  ],
                                ));
                          },
                        ),
                      ),
                    ]),
              );
              // }
            })));
  }
}
