import 'package:hcricket/models/ipl_team_squad_model/ipl_team_squad_model.dart';
import 'package:hcricket/models/league_model/league_model.dart';
import 'package:hcricket/models/match_info_model/match_info_model.dart';
import 'package:hcricket/models/match_over_model/match_over_model.dart';
import 'package:hcricket/models/matche_leadback_model/matche_leadback_model.dart';
import 'package:hcricket/models/score_card_model/score_card_model.dart';
import 'package:hcricket/models/squads_model/squads_model.dart';
import 'package:hcricket/models/upcoming_matches_model/upcoming_matches_model.dart';
import 'package:hcricket/repositery/repositerys_exports.dart';

import '../models/news_model/news_model.dart';
import '../models/recent_model/recent_model.dart';
import '../models/top_stories_model/top_stories_model.dart';
import '../models/upcoming_model/upcoming_model.dart';
import 'match_repository.dart';

class MatchHttpApiRepository
    implements
        MatchRepository,
        NewsRepository,
        NewsDetailRepository,
        TopStoriesRepository,
        RecentMatchesRepository,
        UpcomingMatchesRepository,
        LiveScoreRepository,
        UpcomingMatchesTabRepository,
        LeadbackMatcheRepository,
        MatcheInfoRepository,
        SquadsRepository,
        ScoreCardRepository,
        OverRepository,
        LeagueRepository,
        IplSquadRepository {
  final _apiServices = NetworkApiService();

  @override
  Future<SeriesModel> getAllSeriesApi() async {
    final response = await _apiServices.getApi(AppUrl.series);
    return SeriesModel.fromJson(response);
  }

  @override
  Future<NewsModel> getAllNewsApi({String? lastId}) async {
    final url =
        lastId != null ? "${AppUrl.newsUrl}?lastId=$lastId" : AppUrl.newsUrl;
    final response = await _apiServices.getApi(url);
    return NewsModel.fromJson(response);
  }

  @override
  Future<CricketNewsDetail> getAllDetailNewsApi(int newsId) async {
    final response = await _apiServices.getApi(AppUrl.newsDetailUrl(newsId));
    return CricketNewsDetail.fromJson(response);
  }

  @override
  Future<TopStoriesModel> getTopSeriesApi() async {
    final response = await _apiServices.getApi(AppUrl.topStoriesUrl);
    return TopStoriesModel.fromJson(response);
  }

  @override
  Future<RecentModel> getRecentApi() async {
    try {
      final response = await _apiServices.getApi(AppUrl.recentUrl);
      return RecentModel.fromJson(response);
    } catch (e) {
      throw Exception("Something went wrong: $e");
    }
  }

  @override
  Future<UpcomingModel> getUpcomingApi() async {
    try {
      final response = await _apiServices.getApi(AppUrl.upcomingUrl);
      return UpcomingModel.fromJson(response);
    } catch (e) {
      throw Exception("Something went wrong: $e");
    }
  }

  @override
  Future<LiveScoreModel> getLiveScroreApi() async {
    try {
      final response = await _apiServices.getApi(AppUrl.livescoreUrl);
      return LiveScoreModel.fromJson(response);
    } catch (e) {
      throw Exception("Something went wrong: $e");
    }
  }

  @override
  Stream<LiveScoreModel> getLiveScoreStream() async* {
    while (true) {
      try {
        final response = await _apiServices.getApi(AppUrl.livescoreUrl);
        yield LiveScoreModel.fromJson(response);
      } catch (e) {
        // If you wish, you can yield an error value or simply log the error.
        yield* Stream.error("Something went wrong: $e");
      }
      // Delay between each API call for polling (adjust as needed)
      await Future.delayed(const Duration(seconds: 10));
    }
  }

  @override
  Future<UpcomingMatchesModel> getUpcomingMatchesApi() async {
    try {
      final response = await _apiServices.getApi(AppUrl.upcomingMatchesUrl);

      if (response == null || response.isEmpty) {
        throw Exception("API returned null or empty data");
      }

      if (response is! Map<String, dynamic>) {
        throw Exception("Invalid API response format");
      }

      return UpcomingMatchesModel.fromJson(response);
    } catch (e) {
      throw Exception("Something went wrong: $e");
    }
  }

  @override
  Future<LeanbackModel> getLeadbackMatcheApi(int matchId) async {
    try {
      final response =
          await _apiServices.getApi(AppUrl.leanbackMatchesUrl(matchId));
      return LeanbackModel.fromJson(response);
    } catch (e) {
      throw Exception("Something went wrong: $e");
    }
  }

  @override
  Future<MatchInfoModel> getMatchInfoApi() async {
    try {
      final response = await _apiServices.getApi(AppUrl.matchesInfoUrl);
      return MatchInfoModel.fromJson(response);
    } catch (e) {
      throw Exception("Something went wrong: $e");
    }
  }

  @override
  Future<SquadsModel> getSquadsApi() async {
    try {
      final response = await _apiServices.getApi(AppUrl.squadsUrl);
      return SquadsModel.fromJson(response);
    } catch (e) {
      throw Exception("Something went wrong: $e");
    }
  }

  @override
  Future<scoreCardModel> getScoreCardApi() async {
    final response = await _apiServices.getApi(AppUrl.scoreCardUrl);
    return scoreCardModel.fromJson(response);
  }

  @override
  Future<MatchOverModel> getOverApi() async {
    try {
      final response = await _apiServices.getApi(AppUrl.overUrl);
      return MatchOverModel.fromJson(response);
    } catch (e) {
      throw Exception("Something went wrong: $e");
    }
  }

  @override
  Future<LeagueModel> getLeagueApi() async {
    try {
      final response = await _apiServices.getApi(AppUrl.leagueUrl);
      return LeagueModel.fromJson(response);
    } catch (e) {
      throw Exception("Something went wrong: $e");
    }
  }

  @override
  Future<IplSquads> getIplSquadsApi(int matchId) async {
    try {
      final response = await _apiServices.getApi(AppUrl.iplSquadsUrl(matchId));
      return IplSquads.fromJson(response);
    } catch (e) {
      throw Exception("Something went wrong: $e");
    }
  }
}
