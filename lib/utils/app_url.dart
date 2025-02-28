class AppUrl {
  static var demo = "https://dummyjson.com/todos";

  static var baseUrl = "https://cricbuzz-cricket2.p.rapidapi.com/";
  static var series = "${baseUrl}cricket-series";
  static var crschedule = "${baseUrl}cricket-schedule";

  static var newsUrl = "${baseUrl}news/v1/index";
  static String newsDetailUrl(int newsId) => "${baseUrl}news/v1/detail/$newsId";

  static var topStoriesUrl = "${baseUrl}home/v1/index";

  static var recentUrl = "${baseUrl}matches/v1/recent";
  static var upcomingUrl = "${baseUrl}matches/v1/upcoming";
  static var livescoreUrl = "${baseUrl}matches/v1/live";
  static var upcomingMatchesUrl = "${baseUrl}matches/v1/upcoming";
  static String leanbackMatchesUrl(int matchId) =>
      "${baseUrl}mcenter/v1/$matchId/leanback";

  static String matchesInfoUrl(int matchId) => "${baseUrl}mcenter/v1/$matchId";

  static String squadsUrl(int matchId) => "${baseUrl}mcenter/v1/$matchId/teams";

  static String overUrl(int matchId, int endDate, int innig) =>
      "${baseUrl}mcenter/v1/$matchId/overs?iid=$innig&tms=$endDate";

  static var leagueUrl = "${baseUrl}teams/v1/league";
  static String iplSquadsUrl(int matchId) =>
      "${baseUrl}teams/v1/$matchId/players";

  static var scoreCardUrl = "${baseUrl}mcenter/v1/100238/scard";
}

// https://cricbuzz-cricket2.p.rapidapi.com/mcenter/v1/100238/overs?iid=2&tms=1728231303100

// https://cricbuzz-cricket2.p.rapidapi.com/mcenter/v1/100238/scard
// https://cricbuzz-cricket2.p.rapidapi.com/mcenter/v1/100238/overs?iid=2&tms=1728231303100
// https://cricbuzz-cricket2.p.rapidapi.com/matches/v1/upcoming
// https://cricbuzz-cricket2.p.rapidapi.com/stats/v1/topstats
// https://cricbuzz-cricket.p.rapidapi.com/matches/v1/recent

