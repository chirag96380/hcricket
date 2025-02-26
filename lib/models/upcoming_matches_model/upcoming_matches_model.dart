import 'dart:convert';

UpcomingMatchesModel upcomingModelFromJson(String str) =>
    UpcomingMatchesModel.fromJson(json.decode(str));

String upcomingModelToJson(UpcomingMatchesModel data) =>
    json.encode(data.toJson());

class UpcomingMatchesModel {
  List<TypeMatch>? typeMatches;
  Filters? filters;
  AppIndex? appIndex;
  String? responseLastUpdated;
  List<ContentFilter>? contentFilters;

  UpcomingMatchesModel({
    this.typeMatches,
    this.filters,
    this.appIndex,
    this.responseLastUpdated,
    this.contentFilters,
  });

  factory UpcomingMatchesModel.fromJson(Map<String, dynamic> json) =>
      UpcomingMatchesModel(
        typeMatches: (json["typeMatches"] as List<dynamic>?)
            ?.map((e) => TypeMatch.fromJson(e))
            .toList(),
        filters:
            json["filters"] == null ? null : Filters.fromJson(json["filters"]),
        appIndex: json["appIndex"] == null
            ? null
            : AppIndex.fromJson(json["appIndex"]),
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
        matchType: List<String>.from(json["matchType"].map((x) => x)),
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
        seriesAdWrapper: json["seriesAdWrapper"] == null
            ? null
            : SeriesAdWrapper.fromJson(json["seriesAdWrapper"]),
        adDetail: json["adDetail"] == null
            ? null
            : AdDetail.fromJson(json["adDetail"]),
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

  SeriesAdWrapper({
    this.seriesId,
    this.seriesName,
    this.matches,
    this.isLiveStreamEnabled,
  });

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

class Match {
  MatchInfo? matchInfo;

  Match({this.matchInfo});

  factory Match.fromJson(Map<String, dynamic> json) => Match(
        matchInfo: json["matchInfo"] == null
            ? null
            : MatchInfo.fromJson(json["matchInfo"]),
      );

  Map<String, dynamic> toJson() => {
        "matchInfo": matchInfo?.toJson(),
      };
}

class VenueInfo {
  int? id;
  String? ground;
  String? city;
  String? timezone;
  String? latitude;
  String? longitude;

  VenueInfo({
    this.id,
    this.ground,
    this.city,
    this.timezone,
    this.latitude,
    this.longitude,
  });

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

class MatchInfo {
  int? matchId;
  int? seriesId;
  String? seriesName;
  String? matchDesc;
  String? matchFormat;
  String? startDate;
  String? endDate;
  String? state;
  String? status;
  Team? team1;
  Team? team2;
  VenueInfo? venueInfo;
  bool? isFantasyEnabled;

  MatchInfo({
    this.matchId,
    this.seriesId,
    this.seriesName,
    this.matchDesc,
    this.matchFormat,
    this.startDate,
    this.endDate,
    this.state,
    this.status,
    this.team1,
    this.team2,
    this.venueInfo,
    this.isFantasyEnabled,
  });

  factory MatchInfo.fromJson(Map<String, dynamic> json) => MatchInfo(
        matchId: json["matchId"],
        seriesId: json["seriesId"],
        seriesName: json["seriesName"],
        matchDesc: json["matchDesc"],
        matchFormat: json["matchFormat"],
        startDate: json["startDate"],
        endDate: json["endDate"],
        state: json["state"],
        status: json["status"],
        team1: json["team1"] == null ? null : Team.fromJson(json["team1"]),
        team2: json["team2"] == null ? null : Team.fromJson(json["team2"]),
        venueInfo: json["venueInfo"] == null
            ? null
            : VenueInfo.fromJson(json["venueInfo"]),
        isFantasyEnabled: json["isFantasyEnabled"],
      );

  Map<String, dynamic> toJson() => {
        "matchId": matchId,
        "seriesId": seriesId,
        "seriesName": seriesName,
        "matchDesc": matchDesc,
        "matchFormat": matchFormat,
        "startDate": startDate,
        "endDate": endDate,
        "state": state,
        "status": status,
        "team1": team1?.toJson(),
        "team2": team2?.toJson(),
        "venueInfo": venueInfo?.toJson(),
        "isFantasyEnabled": isFantasyEnabled,
      };
}

class Team {
  int? teamId;
  String? teamName;
  String? teamSName;
  int? imageId;

  Team({this.teamId, this.teamName, this.teamSName, this.imageId});

  factory Team.fromJson(Map<String, dynamic> json) => Team(
        teamId: json["teamId"],
        teamName: json["teamName"],
        teamSName: json["teamSName"],
        imageId: json["imageId"],
      );

  Map<String, dynamic> toJson() => {
        "teamId": teamId,
        "teamName": teamName,
        "teamSName": teamSName,
        "imageId": imageId,
      };
}
