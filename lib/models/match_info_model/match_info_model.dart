class MatchInfoModel {
  MatchInfoModel({
    required this.matchInfo,
    required this.venueInfo,
    required this.broadcastInfo,
    required this.boundaryTrackerValues,
  });

  final MatchInfo? matchInfo;
  final VenueInfo? venueInfo;
  final List<dynamic> broadcastInfo;
  final List<BoundaryTrackerValue> boundaryTrackerValues;

  factory MatchInfoModel.fromJson(Map<String, dynamic> json) {
    return MatchInfoModel(
      matchInfo: json["matchInfo"] == null
          ? null
          : MatchInfo.fromJson(json["matchInfo"]),
      venueInfo: json["venueInfo"] == null
          ? null
          : VenueInfo.fromJson(json["venueInfo"]),
      broadcastInfo: json["broadcastInfo"] == null
          ? []
          : List<dynamic>.from(json["broadcastInfo"].map((x) => x)),
      boundaryTrackerValues: json["boundaryTrackerValues"] == null
          ? []
          : List<BoundaryTrackerValue>.from(json["boundaryTrackerValues"]
              .map((x) => BoundaryTrackerValue.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() => {
        "matchInfo": matchInfo?.toJson(),
        "venueInfo": venueInfo?.toJson(),
        "broadcastInfo": broadcastInfo.map((x) => x).toList(),
        "boundaryTrackerValues":
            boundaryTrackerValues.map((x) => x.toJson()).toList(),
      };
}

class BoundaryTrackerValue {
  BoundaryTrackerValue({
    required this.type,
    required this.imageUrl,
    required this.clickUrl,
  });

  final String? type;
  final String? imageUrl;
  final String? clickUrl;

  factory BoundaryTrackerValue.fromJson(Map<String, dynamic> json) {
    return BoundaryTrackerValue(
      type: json["type"],
      imageUrl: json["imageUrl"],
      clickUrl: json["clickUrl"],
    );
  }

  Map<String, dynamic> toJson() => {
        "type": type,
        "imageUrl": imageUrl,
        "clickUrl": clickUrl,
      };
}

class MatchInfo {
  MatchInfo({
    required this.matchId,
    required this.matchDescription,
    required this.matchFormat,
    required this.matchType,
    required this.complete,
    required this.domestic,
    required this.matchStartTimestamp,
    required this.matchCompleteTimestamp,
    required this.dayNight,
    required this.year,
    required this.state,
    required this.team1,
    required this.team2,
    required this.series,
    required this.umpire1,
    required this.umpire2,
    required this.umpire3,
    required this.referee,
    required this.tossResults,
    required this.result,
    required this.venue,
    required this.status,
    required this.playersOfTheMatch,
    required this.playersOfTheSeries,
    required this.revisedTarget,
    required this.matchTeamInfo,
    required this.isMatchNotCovered,
    required this.hysEnabled,
    required this.livestreamEnabled,
    required this.isFantasyEnabled,
    required this.livestreamEnabledGeo,
    required this.alertType,
    required this.shortStatus,
    required this.matchImageId,
  });

  final int? matchId;
  final String? matchDescription;
  final String? matchFormat;
  final String? matchType;
  final bool? complete;
  final bool? domestic;
  final int? matchStartTimestamp;
  final int? matchCompleteTimestamp;
  final bool? dayNight;
  final int? year;
  final String? state;
  final Team? team1;
  final Team? team2;
  final Series? series;
  final Referee? umpire1;
  final Referee? umpire2;
  final Referee? umpire3;
  final Referee? referee;
  final TossResults? tossResults;
  final Result? result;
  final Venue? venue;
  final String? status;
  final List<PlayersOfTheMatch> playersOfTheMatch;
  final List<dynamic> playersOfTheSeries;
  final RevisedTarget? revisedTarget;
  final List<MatchTeamInfo> matchTeamInfo;
  final bool? isMatchNotCovered;
  final int? hysEnabled;
  final bool? livestreamEnabled;
  final bool? isFantasyEnabled;
  final List<String> livestreamEnabledGeo;
  final String? alertType;
  final String? shortStatus;
  final int? matchImageId;

  factory MatchInfo.fromJson(Map<String, dynamic> json) {
    return MatchInfo(
      matchId: json["matchId"],
      matchDescription: json["matchDescription"],
      matchFormat: json["matchFormat"],
      matchType: json["matchType"],
      complete: json["complete"],
      domestic: json["domestic"],
      matchStartTimestamp: json["matchStartTimestamp"],
      matchCompleteTimestamp: json["matchCompleteTimestamp"],
      dayNight: json["dayNight"],
      year: json["year"],
      state: json["state"],
      team1: json["team1"] == null ? null : Team.fromJson(json["team1"]),
      team2: json["team2"] == null ? null : Team.fromJson(json["team2"]),
      series: json["series"] == null ? null : Series.fromJson(json["series"]),
      umpire1:
          json["umpire1"] == null ? null : Referee.fromJson(json["umpire1"]),
      umpire2:
          json["umpire2"] == null ? null : Referee.fromJson(json["umpire2"]),
      umpire3:
          json["umpire3"] == null ? null : Referee.fromJson(json["umpire3"]),
      referee:
          json["referee"] == null ? null : Referee.fromJson(json["referee"]),
      tossResults: json["tossResults"] == null
          ? null
          : TossResults.fromJson(json["tossResults"]),
      result: json["result"] == null ? null : Result.fromJson(json["result"]),
      venue: json["venue"] == null ? null : Venue.fromJson(json["venue"]),
      status: json["status"],
      playersOfTheMatch: json["playersOfTheMatch"] == null
          ? []
          : List<PlayersOfTheMatch>.from(json["playersOfTheMatch"]
              .map((x) => PlayersOfTheMatch.fromJson(x))),
      playersOfTheSeries: json["playersOfTheSeries"] == null
          ? []
          : List<dynamic>.from(json["playersOfTheSeries"]),
      revisedTarget: json["revisedTarget"] == null
          ? null
          : RevisedTarget.fromJson(json["revisedTarget"]),
      matchTeamInfo: json["matchTeamInfo"] == null
          ? []
          : List<MatchTeamInfo>.from(
              json["matchTeamInfo"].map((x) => MatchTeamInfo.fromJson(x))),
      isMatchNotCovered: json["isMatchNotCovered"],
      hysEnabled: json["HYSEnabled"],
      livestreamEnabled: json["livestreamEnabled"],
      isFantasyEnabled: json["isFantasyEnabled"],
      livestreamEnabledGeo: json["livestreamEnabledGeo"] == null
          ? []
          : List<String>.from(json["livestreamEnabledGeo"]),
      alertType: json["alertType"],
      shortStatus: json["shortStatus"],
      matchImageId: json["matchImageId"],
    );
  }

  Map<String, dynamic> toJson() => {
        "matchId": matchId,
        "matchDescription": matchDescription,
        "matchFormat": matchFormat,
        "matchType": matchType,
        "complete": complete,
        "domestic": domestic,
        "matchStartTimestamp": matchStartTimestamp,
        "matchCompleteTimestamp": matchCompleteTimestamp,
        "dayNight": dayNight,
        "year": year,
        "state": state,
        "team1": team1?.toJson(),
        "team2": team2?.toJson(),
        "series": series?.toJson(),
        "umpire1": umpire1?.toJson(),
        "umpire2": umpire2?.toJson(),
        "umpire3": umpire3?.toJson(),
        "referee": referee?.toJson(),
        "tossResults": tossResults?.toJson(),
        "result": result?.toJson(),
        "venue": venue?.toJson(),
        "status": status,
      };
}

class Series {
  Series({
    required this.id,
    required this.name,
    required this.seriesType,
    required this.startDate,
    required this.endDate,
    required this.seriesFolder,
    required this.odiSeriesResult,
    required this.t20SeriesResult,
    required this.testSeriesResult,
  });

  final int? id;
  final String? name;
  final String? seriesType;
  final int? startDate;
  final int? endDate;
  final String? seriesFolder;
  final String? odiSeriesResult;
  final String? t20SeriesResult;
  final String? testSeriesResult;

  factory Series.fromJson(Map<String, dynamic> json) {
    return Series(
      id: json["id"],
      name: json["name"],
      seriesType: json["seriesType"],
      startDate: json["startDate"],
      endDate: json["endDate"],
      seriesFolder: json["seriesFolder"],
      odiSeriesResult: json["odiSeriesResult"],
      t20SeriesResult: json["t20SeriesResult"],
      testSeriesResult: json["testSeriesResult"],
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "seriesType": seriesType,
        "startDate": startDate,
        "endDate": endDate,
        "seriesFolder": seriesFolder,
        "odiSeriesResult": odiSeriesResult,
        "t20SeriesResult": t20SeriesResult,
        "testSeriesResult": testSeriesResult,
      };
}

class VenueInfo {
  VenueInfo({
    required this.id,
    required this.name,
    required this.city,
    required this.country,
    required this.ground,
    required this.capacity,
    required this.ends,
  });

  final int? id;
  final String? name;
  final String? city;
  final String? country;
  final String? ground;
  final int? capacity;
  final String? ends;

  factory VenueInfo.fromJson(Map<String, dynamic> json) {
    return VenueInfo(
      id: json["id"],
      name: json["name"],
      city: json["city"],
      country: json["country"],
      ground: json["ground"],
      capacity: json["capacity"] != null
          ? int.tryParse(json["capacity"].toString())
          : null,
      ends: json["ends"],
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "city": city,
        "country": country,
      };
}

class MatchTeamInfo {
  MatchTeamInfo({
    required this.teamId,
    required this.teamName,
    required this.shortName,
  });

  final int? teamId;
  final String? teamName;
  final String? shortName;

  factory MatchTeamInfo.fromJson(Map<String, dynamic> json) {
    return MatchTeamInfo(
      teamId: json["teamId"],
      teamName: json["teamName"],
      shortName: json["shortName"],
    );
  }

  Map<String, dynamic> toJson() => {
        "teamId": teamId,
        "teamName": teamName,
        "shortName": shortName,
      };
}

class TossResults {
  TossResults({
    required this.tossWinner,
    required this.decision,
  });

  final String? tossWinner;
  final String? decision;

  factory TossResults.fromJson(Map<String, dynamic> json) {
    return TossResults(
      tossWinner: json["tossWinner"],
      decision: json["decision"],
    );
  }

  Map<String, dynamic> toJson() => {
        "tossWinner": tossWinner,
        "decision": decision,
      };
}

class PlayersOfTheMatch {
  PlayersOfTheMatch({
    required this.id,
    required this.name,
  });

  final int? id;
  final String? name;

  factory PlayersOfTheMatch.fromJson(Map<String, dynamic> json) {
    return PlayersOfTheMatch(
      id: json["id"],
      name: json["name"],
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };
}

class Result {
  Result({
    required this.winningTeam,
    required this.winMargin,
    required this.resultType,
  });

  final String? winningTeam;
  final String? winMargin;
  final String? resultType;

  factory Result.fromJson(Map<String, dynamic> json) {
    return Result(
      winningTeam: json["winningTeam"],
      winMargin: json["winMargin"],
      resultType: json["resultType"],
    );
  }

  Map<String, dynamic> toJson() => {
        "winningTeam": winningTeam,
        "winMargin": winMargin,
        "resultType": resultType,
      };
}

class RevisedTarget {
  RevisedTarget({
    required this.targetRuns,
    required this.overs,
    required this.method,
  });

  final int? targetRuns;
  final int? overs;
  final String? method;

  factory RevisedTarget.fromJson(Map<String, dynamic> json) {
    return RevisedTarget(
      targetRuns: json["targetRuns"],
      overs: json["overs"],
      method: json["method"],
    );
  }

  Map<String, dynamic> toJson() => {
        "targetRuns": targetRuns,
        "overs": overs,
        "method": method,
      };
}

class Team {
  Team({
    required this.id,
    required this.name,
    required this.shortName,
    required this.logoUrl,
  });

  final int? id;
  final String? name;
  final String? shortName;
  final String? logoUrl;

  factory Team.fromJson(Map<String, dynamic> json) {
    return Team(
      id: json["id"],
      name: json["name"],
      shortName: json["shortName"],
      logoUrl: json["logoUrl"],
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "shortName": shortName,
        "logoUrl": logoUrl,
      };
}

class Venue {
  Venue({
    required this.id,
    required this.name,
    required this.city,
  });

  final int? id;
  final String? name;
  final String? city;

  factory Venue.fromJson(Map<String, dynamic> json) {
    return Venue(
      id: json["id"],
      name: json["name"],
      city: json["city"],
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "city": city,
      };
}

class Referee {
  Referee({
    required this.id,
    required this.name,
    required this.role,
  });

  final int? id;
  final String? name;
  final String? role;

  factory Referee.fromJson(Map<String, dynamic> json) {
    return Referee(
      id: json["id"],
      name: json["name"],
      role: json["role"],
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "role": role,
      };
}
