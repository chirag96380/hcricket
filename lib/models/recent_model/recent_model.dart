
class RecentModel {
  List<TypeMatch>? typeMatches;
  Filters? filters;
  AppIndex? appIndex;
  String? responseLastUpdated;
  List<ContentFilter>? contentFilters;

  RecentModel({
    this.typeMatches,
    this.filters,
    this.appIndex,
    this.responseLastUpdated,
    this.contentFilters,
  });

  factory RecentModel.fromJson(Map<String, dynamic> json) => RecentModel(
        typeMatches: (json["typeMatches"] as List<dynamic>?)
            ?.map((e) => TypeMatch.fromJson(e))
            .toList(),
        filters:
            json["filters"] != null ? Filters.fromJson(json["filters"]) : null,
        appIndex: json["appIndex"] != null
            ? AppIndex.fromJson(json["appIndex"])
            : null,
        responseLastUpdated: json["responseLastUpdated"],
        contentFilters: (json["contentFilters"] as List<dynamic>?)
            ?.map((e) => ContentFilter.fromJson(e))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        "typeMatches": typeMatches?.map((e) => e.toJson()).toList(),
        "filters": filters?.toJson(),
        "appIndex": appIndex?.toJson(),
        "responseLastUpdated": responseLastUpdated,
        "contentFilters": contentFilters?.map((e) => e.toJson()).toList(),
      };
}

class AppIndex {
  String? seoTitle;
  String? webUrl;

  AppIndex({this.seoTitle, this.webUrl});

  factory AppIndex.fromJson(Map<String, dynamic> json) => AppIndex(
        seoTitle: json["seoTitle"],
        webUrl: json["webUrl"],
      );

  Map<String, dynamic> toJson() => {
        "seoTitle": seoTitle,
        "webUrl": webUrl,
      };
}

class ContentFilter {
  String? filterId;
  String? filterName;

  ContentFilter({this.filterId, this.filterName});

  factory ContentFilter.fromJson(Map<String, dynamic> json) => ContentFilter(
        filterId: json["filterId"],
        filterName: json["filterName"],
      );

  Map<String, dynamic> toJson() => {
        "filterId": filterId,
        "filterName": filterName,
      };
}

class Filters {
  List<String>? matchType;

  Filters({this.matchType});

  factory Filters.fromJson(Map<String, dynamic> json) => Filters(
        matchType: List<String>.from(json["matchType"] ?? []),
      );

  Map<String, dynamic> toJson() => {
        "matchType": matchType,
      };
}

class TypeMatch {
  String? matchType;
  List<SeriesMatch>? seriesMatches;

  TypeMatch({this.matchType, this.seriesMatches});

  factory TypeMatch.fromJson(Map<String, dynamic> json) => TypeMatch(
        matchType: json["matchType"],
        seriesMatches: (json["seriesMatches"] as List<dynamic>?)
            ?.map((e) => SeriesMatch.fromJson(e))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        "matchType": matchType,
        "seriesMatches": seriesMatches?.map((e) => e.toJson()).toList(),
      };
}

class SeriesMatch {
  SeriesAdWrapper? seriesAdWrapper;
  AdDetail? adDetail;

  SeriesMatch({this.seriesAdWrapper, this.adDetail});

  factory SeriesMatch.fromJson(Map<String, dynamic> json) => SeriesMatch(
        seriesAdWrapper: json["seriesAdWrapper"] != null
            ? SeriesAdWrapper.fromJson(json["seriesAdWrapper"])
            : null,
        adDetail: json["adDetail"] != null
            ? AdDetail.fromJson(json["adDetail"])
            : null,
      );

  Map<String, dynamic> toJson() => {
        "seriesAdWrapper": seriesAdWrapper?.toJson(),
        "adDetail": adDetail?.toJson(),
      };
}

class AdDetail {
  String? name;
  String? layout;
  int? position;

  AdDetail({this.name, this.layout, this.position});

  factory AdDetail.fromJson(Map<String, dynamic> json) => AdDetail(
        name: json["name"],
        layout: json["layout"],
        position: json["position"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "layout": layout,
        "position": position,
      };
}

class SeriesAdWrapper {
  int? seriesId;
  String? seriesName;
  List<Match>? matches;
  bool? isLiveStreamEnabled;

  SeriesAdWrapper(
      {this.seriesId, this.seriesName, this.matches, this.isLiveStreamEnabled});

  factory SeriesAdWrapper.fromJson(Map<String, dynamic> json) =>
      SeriesAdWrapper(
        seriesId: json["seriesId"],
        seriesName: json["seriesName"],
        matches: (json["matches"] as List<dynamic>?)
            ?.map((e) => Match.fromJson(e))
            .toList(),
        isLiveStreamEnabled: json["isLiveStreamEnabled"],
      );

  Map<String, dynamic> toJson() => {
        "seriesId": seriesId,
        "seriesName": seriesName,
        "matches": matches?.map((e) => e.toJson()).toList(),
        "isLiveStreamEnabled": isLiveStreamEnabled,
      };
}

class MatchScore {
  TeamScore? team1Score;
  TeamScore? team2Score;

  MatchScore({this.team1Score, this.team2Score});

  factory MatchScore.fromJson(Map<String, dynamic> json) => MatchScore(
        team1Score: json["team1Score"] != null
            ? TeamScore.fromJson(json["team1Score"])
            : null,
        team2Score: json["team2Score"] != null
            ? TeamScore.fromJson(json["team2Score"])
            : null,
      );

  Map<String, dynamic> toJson() => {
        "team1Score": team1Score?.toJson(),
        "team2Score": team2Score?.toJson(),
      };
}

class TeamScore {
  Inngs? inngs1;
  Inngs? inngs2;

  TeamScore({this.inngs1, this.inngs2});

  factory TeamScore.fromJson(Map<String, dynamic> json) => TeamScore(
        inngs1: json["inngs1"] != null ? Inngs.fromJson(json["inngs1"]) : null,
        inngs2: json["inngs2"] != null ? Inngs.fromJson(json["inngs2"]) : null,
      );

  Map<String, dynamic> toJson() => {
        "inngs1": inngs1?.toJson(),
        "inngs2": inngs2?.toJson(),
      };
}

class Inngs {
  int? inningsId;
  int? runs;
  int? wickets;
  double? overs;
  bool? isDeclared;
  bool? isFollowOn;

  Inngs({
    this.inningsId,
    this.runs,
    this.wickets,
    this.overs,
    this.isDeclared,
    this.isFollowOn,
  });

  factory Inngs.fromJson(Map<String, dynamic> json) => Inngs(
        inningsId: json["inningsId"],
        runs: json["runs"],
        wickets: json["wickets"],
        overs: (json["overs"] as num?)?.toDouble(),
        isDeclared: json["isDeclared"],
        isFollowOn: json["isFollowOn"],
      );

  Map<String, dynamic> toJson() => {
        "inningsId": inningsId,
        "runs": runs,
        "wickets": wickets,
        "overs": overs,
        "isDeclared": isDeclared,
        "isFollowOn": isFollowOn,
      };
}

class Match {
  MatchInfo? matchInfo;
  MatchScore? matchScore;

  Match({this.matchInfo, this.matchScore});

  factory Match.fromJson(Map<String, dynamic> json) => Match(
        matchInfo: json["matchInfo"] != null
            ? MatchInfo.fromJson(json["matchInfo"])
            : null,
        matchScore: json["matchScore"] != null
            ? MatchScore.fromJson(json["matchScore"])
            : null,
      );

  Map<String, dynamic> toJson() => {
        "matchInfo": matchInfo?.toJson(),
        "matchScore": matchScore?.toJson(),
      };
}

class MatchInfo {
  int? matchId;
  String? seriesName;
  String? matchDesc;
  String? startDate;
  String? status;
  Team? team1;
  Team? team2;
  VenueInfo? venueInfo;

  MatchInfo({
    this.matchId,
    this.seriesName,
    this.matchDesc,
    this.startDate,
    this.status,
    this.team1,
    this.team2,
    this.venueInfo,
  });

  factory MatchInfo.fromJson(Map<String, dynamic> json) => MatchInfo(
        matchId: json["matchId"],
        seriesName: json["seriesName"],
        matchDesc: json["matchDesc"],
        startDate: json["startDate"],
        status: json["status"],
        team1: json["team1"] != null ? Team.fromJson(json["team1"]) : null,
        team2: json["team2"] != null ? Team.fromJson(json["team2"]) : null,
        venueInfo: json["venueInfo"] != null
            ? VenueInfo.fromJson(json["venueInfo"])
            : null,
      );

  Map<String, dynamic> toJson() => {
        "matchId": matchId,
        "seriesName": seriesName,
        "matchDesc": matchDesc,
        "startDate": startDate,
        "status": status,
        "team1": team1?.toJson(),
        "team2": team2?.toJson(),
        "venueInfo": venueInfo?.toJson(),
      };
}

class Team {
  int? teamId;
  String? teamName;
  String? teamSName;
  int? imageId; // Added imageId field

  Team({this.teamId, this.teamName, this.teamSName, this.imageId});

  factory Team.fromJson(Map<String, dynamic> json) => Team(
        teamId: json["teamId"],
        teamName: json["teamName"],
        teamSName: json['teamSName'],
        imageId: json["imageId"], // Parse imageId from JSON
      );

  Map<String, dynamic> toJson() => {
        "teamId": teamId,
        "teamName": teamName,
        "teamSName": teamSName,
        "imageId": imageId, // Include imageId in JSON
      };
}

class VenueInfo {
  int? id;
  String? ground;
  String? city;
  String? timezone;
  String? latitude;
  String? longitude;

  VenueInfo(
      {this.id,
      this.ground,
      this.city,
      this.timezone,
      this.latitude,
      this.longitude});

  factory VenueInfo.fromJson(Map<String, dynamic> json) => VenueInfo(
        id: json["id"],
        ground: json["ground"],
        city: json["city"],
        timezone: json["timezone"],
        latitude: json["latitude"],
        longitude: json["longitude"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "ground": ground,
        "city": city,
        "timezone": timezone,
        "latitude": latitude,
        "longitude": longitude,
      };
}
