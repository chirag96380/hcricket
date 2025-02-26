import 'package:hcricket/views/view.dart';

class NewsDetailPage extends StatefulWidget {
  final int newsId;

  const NewsDetailPage({required this.newsId, super.key});

  @override
  State<NewsDetailPage> createState() => _NewsDetailPageState();
}

class _NewsDetailPageState extends State<NewsDetailPage> {
  late NewsDetailBloc newsDetailBloc;

  @override
  void initState() {
    super.initState();
    newsDetailBloc =
        NewsDetailBloc(newsDetailRepository: MatchHttpApiRepository());

    newsDetailBloc.add(GetAllDetailNews(widget.newsId));
  }

  final String heroImage =
      'https://images.unsplash.com/photo-1508100134119-f93388e60d95?q=80&w=1587&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D';

  final String title = 'South Africa seal 10-wicket win to complete whitewash';

  final String description = 'Published on Mon, Jan 6, 2025, 10:21 PM';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) =>
            newsDetailBloc..add(GetAllDetailNews(widget.newsId)),
        child: BlocBuilder<NewsDetailBloc, NewsDetailState>(
          builder: (context, state) {
            if (state.allNewsDetail.status == ApiStatus.loading) {
              return const Center(
                  child: CircularProgressIndicator()); // Show loader
            } else if (state.allNewsDetail.data == null ||
                state.allNewsDetail.data!.getAllContentAsString().isEmpty) {
              return const Center(child: Text("No content available"));
            } else {
              final newsDetail = state.allNewsDetail.data!;
              return CustomScrollView(
                slivers: [
                  SliverPersistentHeader(
                    delegate: CustomSliverAppBarDelegate(
                      expandedHeight: 550,
                      image:
                          GetImage().FlagImage(flagId: newsDetail.coverImageId),
                      title: newsDetail.headline,
                      description: newsDetail.intro,
                    ),
                    pinned: true,
                  ),
                  SliverList(
                    delegate: SliverChildListDelegate(
                      [
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Text(
                            newsDetail.getAllContentAsString(),
                            style: const TextStyle(color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              );
            }
          },
        ),
      ),
    );
  }
}

class CustomSliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  final double expandedHeight;
  final String image;
  final String title;
  final String description;

  CustomSliverAppBarDelegate({
    required this.expandedHeight,
    required this.image,
    required this.title,
    required this.description,
  });

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    final top = expandedHeight - shrinkOffset - 300;

    return Stack(
      fit: StackFit.expand,
      children: [
        buildBackground(shrinkOffset),
        buildAppBar(shrinkOffset, context),
        Positioned(
          top: top,
          left: 20,
          right: 20,
          child: buildFloatingContent(shrinkOffset, context),
        ),
      ],
    );
  }

  double appear(double shrinkOffset) => shrinkOffset / expandedHeight;

  double disappear(double shrinkOffset) => 1 - shrinkOffset / expandedHeight;

  Widget buildAppBar(double shrinkOffset, context) => Opacity(
        opacity: appear(shrinkOffset),
        child: AppBar(
          leading: IconButton(
            icon: SvgPicture.asset(AppImagepath.backIcon),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          backgroundColor: AppColors.primarycolor,
          title: Text(
            "News",
            style: Appstyle.textstyle17,
          ),
          centerTitle: true,
        ),
      );

  Widget buildBackground(double shrinkOffset) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(image),
          fit: BoxFit.cover,
        ),
      ),
      child: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.transparent,
              AppColors.backgroundColor,
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
      ),
    );
  }

  Widget buildFloatingContent(double shrinkOffset, BuildContext context) {
    return Opacity(
      opacity: disappear(shrinkOffset),
      child: Padding(
        padding: EdgeInsets.only(top: 100.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: Appstyle.textstyle25bold,
            ),
            const SizedBox(height: 8),
            Text(
              description,
              style: Appstyle.textstyle12Regular,
            ),
          ],
        ),
      ),
    );
  }

  @override
  double get maxExtent => expandedHeight;

  @override
  double get minExtent => kToolbarHeight + 30;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) => true;
}
