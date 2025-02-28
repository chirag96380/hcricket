import 'package:hcricket/models/ipl_team_squad_model/ipl_team_squad_model.dart';
import 'package:hcricket/models/league_model/league_model.dart';
import 'package:hcricket/models/match_info_model/match_info_model.dart';
import 'package:hcricket/models/match_over_model/match_over_model.dart';
import 'package:hcricket/models/matche_leadback_model/matche_leadback_model.dart';
import 'package:hcricket/models/score_card_model/score_card_model.dart';
import 'package:hcricket/models/squads_model/squads_model.dart';
import 'package:hcricket/models/top_stories_model/top_stories_model.dart';
import 'package:hcricket/models/upcoming_matches_model/upcoming_matches_model.dart';
import 'package:hcricket/repositery/repositerys_exports.dart';

import '../models/news_model/news_model.dart';
import '../models/recent_model/recent_model.dart';
import '../models/upcoming_model/upcoming_model.dart';

abstract class MatchRepository {
  Future<SeriesModel> getAllSeriesApi();
}

abstract class NewsRepository {
  Future<NewsModel> getAllNewsApi({String? lastId});
}

abstract class NewsDetailRepository {
  Future<CricketNewsDetail> getAllDetailNewsApi(int newsId);
}

abstract class TopStoriesRepository {
  Future<TopStoriesModel> getTopSeriesApi();
}

abstract class RecentMatchesRepository {
  Future<RecentModel> getRecentApi();
}

abstract class UpcomingMatchesRepository {
  Future<UpcomingModel> getUpcomingApi();
}

abstract class LiveScoreRepository {
  Future<LiveScoreModel> getLiveScroreApi();
  //  Stream<LiveScoreModel> getLiveScoreStream();
}

abstract class UpcomingMatchesTabRepository {
  Future<UpcomingMatchesModel> getUpcomingMatchesApi();
}

abstract class LeadbackMatcheRepository {
  Future<LeanbackModel> getLeadbackMatcheApi(int matchId);
}

abstract class MatcheInfoRepository {
  Future<MatchInfoModel> getMatchInfoApi(int matchId);
}

abstract class SquadsRepository {
  Future<SquadsModel> getSquadsApi(int matchId);
}

abstract class ScoreCardRepository {
  Future<scoreCardModel> getScoreCardApi();
}

abstract class OverRepository {
  Future<MatchOverModel> getOverApi(int matchId, int endDate, int inning);
}

abstract class LeagueRepository {
  Future<LeagueModel> getLeagueApi();
}

abstract class IplSquadRepository {
  Future<IplSquads> getIplSquadsApi(int matchId);
}
