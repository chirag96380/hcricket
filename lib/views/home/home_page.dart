import 'package:flutter/cupertino.dart';
import 'package:gradient_borders/gradient_borders.dart';
import 'package:hcricket/bloc/live_score_bloc/live_score_bloc.dart';
import 'package:hcricket/bloc/live_score_bloc/live_score_event.dart';
import 'package:hcricket/views/view.dart';
import 'package:hcricket/widget/constume_latest_news.dart';
import 'package:hcricket/widget/constume_league_team.dart';

// class HomePage extends StatefulWidget {
//   const HomePage({super.key});

//   @override
//   State<HomePage> createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   int currentIndex = 0;
//   late LiveScoreBloc liveScoreBloc;

//   @override
//   void initState() {
//     super.initState();
//     liveScoreBloc =
//         LiveScoreBloc(liveScoreRepository: MatchHttpApiRepository());
//     liveScoreBloc.add(GetLiveScore());
//   }

//   Future<void> _refreshData() async {
//     liveScoreBloc.add(GetLiveScore());
//   }

//   @override
//   Widget build(BuildContext context) {
//     return

//         BlocProvider(
//       create: (_) => liveScoreBloc..add(GetLiveScore()),
//       child: Scaffold(
//         body: SizedBox(
//           height: 500.h,
//           child: RefreshIndicator(
//             onRefresh: _refreshData,
//             child: ListView(
//               physics: const AlwaysScrollableScrollPhysics(),
//               padding: EdgeInsets.only(
//                 top: 12.h,
//               ),
//               children: [
//                 Padding(
//                   padding: EdgeInsets.only(left: 12.w),
//                   child: Text(
//                     AppString.matches,
//                     style: Appstyle.textstyle15Bold,
//                   ),
//                 ),
//                 10.verticalSpace,
//                 const CostumeCarosel(),
//                 12.verticalSpace,
//                 Padding(
//                   padding: EdgeInsets.only(left: 12.w),
//                   child: Text(
//                     AppString.upcomingMatchs,
//                     style: Appstyle.textstyle15Bold,
//                   ),
//                 ),
//                 10.verticalSpace,
//                 const CostumeUpcoming(),
//                 10.verticalSpace,
//                 Padding(
//                   padding: EdgeInsets.only(left: 12.w),
//                   child: Text(
//                     AppString.recentMatchs,
//                     style: Appstyle.textstyle15Bold,
//                   ),
//                 ),
//                 10.verticalSpace,
//                 const CostumeRecent(),
//                 12.verticalSpace,
//                 Padding(
//                   padding: EdgeInsets.only(left: 12.w, right: 12.w),
//                   child: Row(
//                     children: [
//                       Text(
//                         AppString.ipl,
//                         style: Appstyle.textstyle15Bold,
//                       ),
//                       Text(
//                         " ${AppString.indianpremierleague}",
//                         style: Appstyle.textstyle15Bold,
//                       ),
//                     ],
//                   ),
//                 ),
//                 15.verticalSpace,
//                 const ConstumeLeagueTeam(),
//                 Padding(
//                   padding: EdgeInsets.only(left: 12.w, right: 12.w),
//                   child: Row(
//                     children: [
//                       Text(
//                         AppString.topSotries,
//                         style: Appstyle.textstyle15Bold,
//                       ),
//                     ],
//                   ),
//                 ),
//                 10.verticalSpace,
//                 const ConstumeTopsries(),
//                 50.verticalSpace,
//                 ListView.builder(
//                   itemCount: 9,
//                   itemBuilder: (context, index) {
//                     if (index % 3 == 0) {
//                       // Har 3rd item pe ek bada news card
//                       return LargeNewsCard(title: "jknasndmasndma,s");
//                     } else {
//                       return SmallNewsCard(
//                           title: "fpvgkfmvlv,fl;v,pwclpweopkfrjgvlkemrk");
//                     }
//                   },
//                 )
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentIndex = 0;
  late LiveScoreBloc liveScoreBloc;

  @override
  void initState() {
    super.initState();
    liveScoreBloc =
        LiveScoreBloc(liveScoreRepository: MatchHttpApiRepository());
    liveScoreBloc.add(GetLiveScore());
  }

  Future<void> _refreshData() async {
    liveScoreBloc.add(GetLiveScore());
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => liveScoreBloc..add(GetLiveScore()),
      child: Scaffold(
        body: RefreshIndicator(
          onRefresh: _refreshData,
          child: SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Matches Section
                Padding(
                  padding: const EdgeInsets.only(left: 12),
                  child:
                      Text(AppString.matches, style: Appstyle.textstyle15Bold),
                ),
                const SizedBox(height: 10),
                const CostumeCarosel(),

                // Upcoming Matches
                Padding(
                  padding: const EdgeInsets.only(left: 12),
                  child: Text(AppString.upcomingMatchs,
                      style: Appstyle.textstyle15Bold),
                ),
                const SizedBox(height: 10),
                const CostumeUpcoming(),

                // Recent Matches
                Padding(
                  padding: const EdgeInsets.only(left: 12),
                  child: Text(AppString.recentMatchs,
                      style: Appstyle.textstyle15Bold),
                ),
                const SizedBox(height: 10),
                const CostumeRecent(),
                const SizedBox(height: 10),

                // League Section
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: Row(
                    children: [
                      Text(AppString.ipl, style: Appstyle.textstyle15Bold),
                      Text(" ${AppString.indianpremierleague}",
                          style: Appstyle.textstyle15Bold),
                    ],
                  ),
                ),
                const SizedBox(height: 15),
                const ConstumeLeagueTeam(),

                // Top Stories Section
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: Text(AppString.topSotries,
                      style: Appstyle.textstyle15Bold),
                ),
                const SizedBox(height: 10),
                const ConstumeTopsries(),
                const SizedBox(height: 15),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: Text("Latest News", style: Appstyle.textstyle15Bold),
                ),
                const SizedBox(height: 5),

                const ConstumeLatestNews(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
