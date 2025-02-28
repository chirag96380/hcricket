import 'package:flutter/material.dart';
import 'package:hcricket/views/game/game_earn_page.dart';
import 'package:hcricket/views/match_coverage/match_coverage_screen.dart';
import 'package:hcricket/views/news/news_details.dart';
import 'package:hcricket/views/onboard.dart';
import 'package:hcricket/views/recent_match_more/recent_match.dart';
import 'package:hcricket/views/squads/squads_screen.dart';
import 'package:hcricket/widget/bottombar/bottom_navigation_bar.dart';
import '../views/view.dart';

class Routes {
  static Route<dynamic> genreteRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutesName.Splashscreen:
        return MaterialPageRoute(builder: (context) => const SpalshScreen());
      case RoutesName.BottomNav:
        return MaterialPageRoute(
            builder: (context) => const BottomNavigation());
      case RoutesName.HomeScreen:
        return MaterialPageRoute(builder: (context) => const HomePage());
      case RoutesName.Onboarding:
        return MaterialPageRoute(builder: (context) => const Onboard());
      case RoutesName.GameScreen:
        return MaterialPageRoute(builder: (context) => const GameEarnPage());
      case RoutesName.newsDetailScreen:
        final args = settings.arguments as Map<String, dynamic>;
        final newsId = args['newsId'] as int;
        return MaterialPageRoute(
            builder: (context) => NewsDetailPage(newsId: newsId));
      case RoutesName.matchCoverageScreen:
        final args = settings.arguments as Map<String, dynamic>;

        return MaterialPageRoute(
            builder: (context) => MatchCoverageScreen(
                  team1score: args['team1run'],
                  team2score: args['team2run'],
                  team1over: args['team1over'],
                  team2over: args['team2over'],
                  team1wic: args['team1wic'],
                  team2wic: args['team2wic'],
                  team1: args['team1'],
                  team2: args['team2'],
                  tem1flag: args['tem1flag']?.toString() ?? "",
                  tem2flag: args['tem2flag']?.toString() ?? "",
                  seriesName: args['seriesName']?.toString() ?? "",
                  matchId: args['matchId'],
                  teamName: args['teamName'],
                  matchDesc: args['matchDesc'],
                  endDate: int.tryParse(args['endDate'].toString()),
                  inning: int.tryParse(args['inning'].toString()),
                ));
      case RoutesName.recentMatchScreen:
        return MaterialPageRoute(
            builder: (context) => const RecentMatchScreen());

      case RoutesName.iplSquadScreen:
        final args = settings.arguments as Map<String, dynamic>;

        return MaterialPageRoute(
            builder: (context) => IplSquadScreen(
                imageId: args['imageId'].toString(),
                teamName: args['teamName'].toString(),
                teamSName: args['teamSName'].toString(),
                teamId: int.tryParse(args['teamId'].toString()) ?? 0));

      default:
        return MaterialPageRoute(builder: (context) {
          return const Scaffold(
            body: Text("Routes is Not Found"),
          );
        });
    }
  }
}
