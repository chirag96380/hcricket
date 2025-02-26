import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:hcricket/bloc/bloc_exports.dart';
import 'package:hcricket/bloc/top_stories/top_stories_bloc.dart';
import 'package:hcricket/bloc/top_stories/top_stories_event.dart';
import 'package:hcricket/bloc/top_stories/top_stories_state.dart';
import 'package:hcricket/config/routes_name.dart';
import 'package:hcricket/repositery/match_http_api_repository.dart';
import 'package:hcricket/services/image_services.dart';
import 'package:hcricket/utils/textstyle.dart';
import 'package:hcricket/utils/utils_exports.dart';
import 'package:hcricket/widget/costume_divider.dart';

// class ConstumeLatestNews extends StatefulWidget {
//   const ConstumeLatestNews({super.key});

//   @override
//   State<ConstumeLatestNews> createState() => _ConstumeLatestNewsState();
// }

// class _ConstumeLatestNewsState extends State<ConstumeLatestNews> {
//   late TopStoriesBloc topStoriesBloc;

//   @override
//   void initState() {
//     super.initState();
//     // Initialize the bloc
//     topStoriesBloc =
//         TopStoriesBloc(topStoriesRepository: MatchHttpApiRepository());
//     topStoriesBloc.add(GetTopSeries());
//   }

//   @override
//   void dispose() {
//     topStoriesBloc.close();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     // Provide the existing bloc instance using BlocProvider.value
//     return BlocProvider(
//       create: (_) => topStoriesBloc..add(GetTopSeries()),
//       child: BlocBuilder<TopStoriesBloc, TopStoriesState>(
//         builder: (context, state) {
//           final itemCount = state.topSeries.data?.homepage.length ?? 3;
//           return ListView.builder(
//             shrinkWrap: true,
//             physics: const NeverScrollableScrollPhysics(),
//             itemCount: itemCount,
//             itemBuilder: (context, index) {
//               if (index % 4 == 0) {
//                 var newsImage = state
//                         .topSeries.data?.homepage[index].stories?.imageId
//                         .toString() ??
//                     '';
//                 return LargeNewsCard(
//                     title: state.topSeries.data?.homepage[index].stories
//                             ?.headline ??
//                         '',
//                     intro:
//                         state.topSeries.data?.homepage[index].stories?.intro ??
//                             '',
//                     image: GetImage().FlagImage(flagId: newsImage));
//               } else {
//                 return SmallNewsCard(
//                   title:
//                       state.topSeries.data?.homepage[index].stories?.headline ??
//                           '',
//                   image: GetImage().FlagImage(flagId: newsImage),
//                 );
//               }
//             },
//           );
//         },
//       ),
//     );
//   }
// }

// class LargeNewsCard extends StatelessWidget {
//   final String title;
//   final String intro;
//   final String image;

//   const LargeNewsCard(
//       {required this.title, required this.intro, required this.image});

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: EdgeInsets.all(10.0.h),
//       child: Column(
//         children: [
//           Container(
//             height: 200.h,
//             decoration: BoxDecoration(
//               border: const GradientBoxBorder(
//                   gradient: AppColors.matchCoveragegradient),
//               image: DecorationImage(
//                   image: NetworkImage(image), fit: BoxFit.cover),
//               borderRadius: BorderRadius.circular(30.r),
//             ),
//           ),
//           Column(
//             children: [
//               Padding(
//                 padding: EdgeInsets.all(8.0.w),
//                 child: Text(
//                   title,
//                   style: Appstyle.textstyle15Bold,
//                 ),
//               ),
//               Padding(
//                 padding: EdgeInsets.only(left: 8.0.w, right: 8.0.w),
//                 child: Text(
//                   intro,
//                   style: Appstyle.textstyle12Regular,
//                 ),
//               )
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }

// class SmallNewsCard extends StatelessWidget {
//   final String title;
//   final String image;

//   const SmallNewsCard({required this.title, required this.image});

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: EdgeInsets.symmetric(horizontal: 12.0.w),
//       child: Column(
//         children: [
//           const CostumeSecondDivider(),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.start,
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Container(
//                 margin: EdgeInsets.only(
//                     left: 6.h, right: 6.h, bottom: 8.h, top: 8.h),
//                 height: 55.h,
//                 width: 90.w,
//                 decoration: BoxDecoration(
//                   border: const GradientBoxBorder(
//                     gradient: AppColors.matchCoveragegradient,
//                   ),
//                   borderRadius: BorderRadius.circular(12.r),
//                   image: DecorationImage(
//                     image: NetworkImage(
//                       image,
//                     ),
//                     fit: BoxFit.cover,
//                   ),
//                 ),
//               ),
//               // Expanded Text widget to allow proper overflow handling
//               Expanded(
//                 child: Padding(
//                   padding: EdgeInsets.only(left: 4.0.w, right: 8.w, top: 8.h),
//                   child: Text(
//                     title,
//                     style: Appstyle.textstyle13,
//                     maxLines: 3,
//                     overflow: TextOverflow.ellipsis,
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }

class ConstumeLatestNews extends StatefulWidget {
  const ConstumeLatestNews({super.key});

  @override
  State<ConstumeLatestNews> createState() => _ConstumeLatestNewsState();
}

class _ConstumeLatestNewsState extends State<ConstumeLatestNews> {
  late TopStoriesBloc topStoriesBloc;

  @override
  void initState() {
    super.initState();
    // Initialize the bloc and fetch the top series once.
    topStoriesBloc =
        TopStoriesBloc(topStoriesRepository: MatchHttpApiRepository());
    topStoriesBloc.add(GetTopSeries());
  }

  @override
  void dispose() {
    topStoriesBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Provide the existing bloc instance using BlocProvider.value
    return BlocProvider(
      create: (_)=> topStoriesBloc..add(GetTopSeries()),
      child: BlocBuilder<TopStoriesBloc, TopStoriesState>(
        builder: (context, state) {
          final itemCount = state.topSeries.data?.homepage.length ?? 3;
          return ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: itemCount,
            itemBuilder: (context, index) {
              final item = state.topSeries.data?.homepage[index];

              // Skip if it's an ad.
              if (item?.ad != null) {
                return const SizedBox.shrink();
              }

              // Retrieve the image id from the state
              var newsImage = item?.stories?.imageId.toString() ?? '';

              // Create a navigation callback for the card.
              VoidCallback onTapCard = () {
                // Pass the newsId, assuming item?.stories?.newsId is available.
                var newsId =
                    state.topSeries.data?.homepage[index].stories?.itemId;
                if (newsId != null) {
                  Navigator.pushNamed(context, RoutesName.newsDetailScreen,
                      arguments: {"newsId": newsId});
                }
              };

              // Use LargeNewsCard for every 4th item, else SmallNewsCard.
              if (index % 4 == 0) {
                return LargeNewsCard(
                  title: item?.stories?.headline ?? '',
                  intro: item?.stories?.intro ?? '',
                  image: GetImage().FlagImage(flagId: newsImage),
                  onTap: onTapCard,
                );
              } else {
                return SmallNewsCard(
                  title: item?.stories?.headline ?? '',
                  image: GetImage().FlagImage(flagId: newsImage),
                  onTap: onTapCard,
                );
              }
            },
          );
        },
      ),
    );
  }
}

class LargeNewsCard extends StatelessWidget {
  final String title;
  final String intro;
  final String image;
  final VoidCallback onTap;

  const LargeNewsCard({
    required this.title,
    required this.intro,
    required this.image,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10.0.h),
      child: Column(
        children: [
          GestureDetector(
            onTap: onTap,
            child: Container(
              height: 180.h,
              decoration: BoxDecoration(
                border: const GradientBoxBorder(
                  gradient: AppColors.matchCoveragegradient,
                ),
                image: DecorationImage(
                  image: NetworkImage(image),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(30.r),
              ),
            ),
          ),
          Column(
            children: [
              Padding(
                padding: EdgeInsets.all(8.0.w),
                child: Text(
                  title,
                  style: Appstyle.textstyle15Bold,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.0.w),
                child: Text(
                  intro,
                  style: Appstyle.textstyle12Regular,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class SmallNewsCard extends StatelessWidget {
  final String title;
  final String image;
  final VoidCallback onTap;

  const SmallNewsCard({
    required this.title,
    required this.image,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 12.0.w),
      child: Column(
        children: [
          const CostumeSecondDivider(),
          GestureDetector(
            onTap: onTap,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.only(
                      left: 6.h, right: 6.h, bottom: 8.h, top: 8.h),
                  height: 55.h,
                  width: 90.w,
                  decoration: BoxDecoration(
                    border: const GradientBoxBorder(
                      gradient: AppColors.matchCoveragegradient,
                    ),
                    borderRadius: BorderRadius.circular(12.r),
                    image: DecorationImage(
                      image: NetworkImage(image),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                // Expanded Text widget to allow proper overflow handling
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(left: 4.0.w, right: 8.w, top: 8.h),
                    child: Text(
                      title,
                      style: Appstyle.textstyle13,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
