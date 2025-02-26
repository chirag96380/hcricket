class LiveScoreModel {
  List<TypeMatches>? typeMatches;
  Filters? filters;
  AppIndex? appIndex;
  String? responseLastUpdated;

  LiveScoreModel(
      {typeMatches,
      filters,
      appIndex,
      responseLastUpdated});

  LiveScoreModel.fromJson(Map<String, dynamic> json) {
    if (json['typeMatches'] != null) {
      typeMatches = <TypeMatches>[];
      json['typeMatches'].forEach((v) {
        typeMatches!.add( TypeMatches.fromJson(v));
      });
    }
    filters =
        json['filters'] != null ?  Filters.fromJson(json['filters']) : null;
    appIndex = json['appIndex'] != null
        ?  AppIndex.fromJson(json['appIndex'])
        : null;
    responseLastUpdated = json['responseLastUpdated'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (typeMatches != null) {
      data['typeMatches'] = typeMatches!.map((v) => v.toJson()).toList();
    }
    if (filters != null) {
      data['filters'] = filters!.toJson();
    }
    if (appIndex != null) {
      data['appIndex'] = appIndex!.toJson();
    }
    data['responseLastUpdated'] = responseLastUpdated;
    return data;
  }
}

class TypeMatches {
  String? matchType;
  List<SeriesMatches>? seriesMatches;

  TypeMatches({matchType, seriesMatches});

  TypeMatches.fromJson(Map<String, dynamic> json) {
    matchType = json['matchType'];
    if (json['seriesMatches'] != null) {
      seriesMatches = <SeriesMatches>[];
      json['seriesMatches'].forEach((v) {
        seriesMatches!.add(SeriesMatches.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['matchType'] = matchType;
    if (seriesMatches != null) {
      data['seriesMatches'] =
          seriesMatches!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class SeriesMatches {
  SeriesAdWrapper? seriesAdWrapper;
  AdDetail? adDetail;

  SeriesMatches({seriesAdWrapper, adDetail});

  SeriesMatches.fromJson(Map<String, dynamic> json) {
    seriesAdWrapper = json['seriesAdWrapper'] != null
        ? SeriesAdWrapper.fromJson(json['seriesAdWrapper'])
        : null;
    adDetail = json['adDetail'] != null
        ? AdDetail.fromJson(json['adDetail'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (seriesAdWrapper != null) {
      data['seriesAdWrapper'] = seriesAdWrapper!.toJson();
    }
    if (adDetail != null) {
      data['adDetail'] = adDetail!.toJson();
    }
    return data;
  }
}

class SeriesAdWrapper {
  int? seriesId;
  String? seriesName;
  List<Matches>? matches;

  SeriesAdWrapper({seriesId, seriesName, matches});

  SeriesAdWrapper.fromJson(Map<String, dynamic> json) {
    seriesId = json['seriesId'];
    seriesName = json['seriesName'];
    if (json['matches'] != null) {
      matches = <Matches>[];
      json['matches'].forEach((v) {
        matches!.add(Matches.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['seriesId'] = seriesId;
    data['seriesName'] = seriesName;
    if (matches != null) {
      data['matches'] = matches!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Matches {
  MatchInfo? matchInfo;
  MatchScore? matchScore;

  Matches({matchInfo, matchScore});

  Matches.fromJson(Map<String, dynamic> json) {
    matchInfo = json['matchInfo'] != null
        ? MatchInfo.fromJson(json['matchInfo'])
        : null;
    matchScore = json['matchScore'] != null
        ? MatchScore.fromJson(json['matchScore'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (matchInfo != null) {
      data['matchInfo'] = matchInfo!.toJson();
    }
    if (matchScore != null) {
      data['matchScore'] = matchScore!.toJson();
    }
    return data;
  }
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
  Team1? team1;
  Team1? team2;
  VenueInfo? venueInfo;
  int? currBatTeamId;
  String? seriesStartDt;
  String? seriesEndDt;
  bool? isTimeAnnounced;
  String? stateTitle;

  MatchInfo(
      {matchId,
      seriesId,
      seriesName,
      matchDesc,
      matchFormat,
      startDate,
      endDate,
      state,
      status,
      team1,
      team2,
      venueInfo,
      currBatTeamId,
      seriesStartDt,
      seriesEndDt,
      isTimeAnnounced,
      stateTitle});

  MatchInfo.fromJson(Map<String, dynamic> json) {
    matchId = json['matchId'];
    seriesId = json['seriesId'];
    seriesName = json['seriesName'];
    matchDesc = json['matchDesc'];
    matchFormat = json['matchFormat'];
    startDate = json['startDate'];
    endDate = json['endDate'];
    state = json['state'];
    status = json['status'];
    team1 = json['team1'] != null ?  Team1.fromJson(json['team1']) : null;
    team2 = json['team2'] != null ?  Team1.fromJson(json['team2']) : null;
    venueInfo = json['venueInfo'] != null
        ?  VenueInfo.fromJson(json['venueInfo'])
        : null;
    currBatTeamId = json['currBatTeamId'];
    seriesStartDt = json['seriesStartDt'];
    seriesEndDt = json['seriesEndDt'];
    isTimeAnnounced = json['isTimeAnnounced'];
    stateTitle = json['stateTitle'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['matchId'] = matchId;
    data['seriesId'] = seriesId;
    data['seriesName'] = seriesName;
    data['matchDesc'] = matchDesc;
    data['matchFormat'] = matchFormat;
    data['startDate'] = startDate;
    data['endDate'] = endDate;
    data['state'] = state;
    data['status'] = status;
    if (team1 != null) {
      data['team1'] = team1!.toJson();
    }
    if (team2 != null) {
      data['team2'] = team2!.toJson();
    }
    if (venueInfo != null) {
      data['venueInfo'] = venueInfo!.toJson();
    }
    data['currBatTeamId'] = currBatTeamId;
    data['seriesStartDt'] = seriesStartDt;
    data['seriesEndDt'] = seriesEndDt;
    data['isTimeAnnounced'] = isTimeAnnounced;
    data['stateTitle'] = stateTitle;
    return data;
  }
}

class Team1 {
  int? teamId;
  String? teamName;
  String? teamSName;
  int? imageId;

  Team1({teamId, teamName, teamSName, imageId});

  Team1.fromJson(Map<String, dynamic> json) {
    teamId = json['teamId'];
    teamName = json['teamName'];
    teamSName = json['teamSName'];
    imageId = json['imageId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['teamId'] = teamId;
    data['teamName'] = teamName;
    data['teamSName'] = teamSName;
    data['imageId'] = imageId;
    return data;
  }
}

class VenueInfo {
  int? id;
  String? ground;
  String? city;
  String? timezone;
  String? latitude;
  String? longitude;

  VenueInfo(
      {id,
      ground,
      city,
      timezone,
      latitude,
      longitude});

  VenueInfo.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    ground = json['ground'];
    city = json['city'];
    timezone = json['timezone'];
    latitude = json['latitude'];
    longitude = json['longitude'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['id'] = id;
    data['ground'] = ground;
    data['city'] = city;
    data['timezone'] = timezone;
    data['latitude'] = latitude;
    data['longitude'] = longitude;
    return data;
  }
}

// class MatchScore {
//   Team1Score? team1Score;

//   MatchScore({team1Score});

//   MatchScore.fromJson(Map<String, dynamic> json) {
//     team1Score = json['team1Score'] != null
//         ?  Team1Score.fromJson(json['team1Score'])
//         : null;
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data =  Map<String, dynamic>();
//     if (team1Score != null) {
//       data['team1Score'] = team1Score!.toJson();
//     }
//     return data;
//   }
// }

class MatchScore {
  Team1Score? team1Score;
  Team1Score? team2Score; // Add this line

  MatchScore({team1Score, team2Score});

  MatchScore.fromJson(Map<String, dynamic> json) {
    team1Score = json['team1Score'] != null
        ? Team1Score.fromJson(json['team1Score'])
        : null;
    team2Score = json['team2Score'] != null // Add this part
        ? Team1Score.fromJson(json['team2Score'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    if (team1Score != null) {
      data['team1Score'] = team1Score!.toJson();
    }
    if (team2Score != null) {
      // Add this part
      data['team2Score'] = team2Score!.toJson();
    }
    return data;
  }
}

class Team1Score {
  Inngs1? inngs1;

  Team1Score({inngs1});

  Team1Score.fromJson(Map<String, dynamic> json) {
    inngs1 =
        json['inngs1'] != null ?  Inngs1.fromJson(json['inngs1']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    if (inngs1 != null) {
      data['inngs1'] = inngs1!.toJson();
    }
    return data;
  }
}

class Inngs1 {
  int? inningsId;
  int? runs;
  int? wickets;
  double? overs;

  Inngs1({inningsId, runs, wickets, overs});

  Inngs1.fromJson(Map<String, dynamic> json) {
    inningsId = json['inningsId'];
    runs = json['runs'];
    wickets = json['wickets'];
    overs = json['overs'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['inningsId'] = inningsId;
    data['runs'] = runs;
    data['wickets'] = wickets;
    data['overs'] = overs;
    return data;
  }
}

class AdDetail {
  String? name;
  String? layout;
  int? position;

  AdDetail({name, layout, position});

  AdDetail.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    layout = json['layout'];
    position = json['position'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['name'] = name;
    data['layout'] = layout;
    data['position'] = position;
    return data;
  }
}

class Filters {
  List<String>? matchType;

  Filters({matchType});

  Filters.fromJson(Map<String, dynamic> json) {
    matchType = json['matchType'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['matchType'] = matchType;
    return data;
  }
}

class AppIndex {
  String? seoTitle;
  String? webURL;

  AppIndex({seoTitle, webURL});

  AppIndex.fromJson(Map<String, dynamic> json) {
    seoTitle = json['seoTitle'];
    webURL = json['webURL'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['seoTitle'] = seoTitle;
    data['webURL'] = webURL;
    return data;
  }
}
