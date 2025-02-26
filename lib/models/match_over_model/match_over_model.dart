class MatchOverModel {
  Miniscore? miniscore;
  OverSepList? overSepList;
  MatchHeaders? matchHeaders;
  String? responseLastUpdated;

  MatchOverModel({
    this.miniscore,
    this.overSepList,
    this.matchHeaders,
    this.responseLastUpdated,
  });

  factory MatchOverModel.fromJson(Map<String, dynamic> json) {
    return MatchOverModel(
      miniscore: json['miniscore'] != null
          ? Miniscore.fromJson(json['miniscore'])
          : null,
      overSepList: json['overSepList'] != null
          ? OverSepList.fromJson(json['overSepList'])
          : null,
      matchHeaders: json['matchHeaders'] != null
          ? MatchHeaders.fromJson(json['matchHeaders'])
          : null,
      responseLastUpdated: json['responseLastUpdated'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    if (miniscore != null) {
      data['miniscore'] = miniscore!.toJson();
    }
    if (overSepList != null) {
      data['overSepList'] = overSepList!.toJson();
    }
    if (matchHeaders != null) {
      data['matchHeaders'] = matchHeaders!.toJson();
    }
    data['responseLastUpdated'] = responseLastUpdated;
    return data;
  }
}

class Miniscore {
  BatsmanStriker? batsmanStriker;
  BatsmanNonStriker? batsmanNonStriker;
  BowlerStriker? bowlerStriker;
  BowlerStriker? bowlerNonStriker;
  double? crr;
  String? inningsNbr;
  String? lastWkt;
  String? curOvsStats;
  InningsScores? inningsScores;
  int? inningsId;
  List<Performance>? performance;
  String? partnership;
  Pp? pp;
  int? target;
  BatTeamScore? batTeamScore;
  String? custStatus;
  String? responseLastUpdated;
  String? event;

  Miniscore({
    this.batsmanStriker,
    this.batsmanNonStriker,
    this.bowlerStriker,
    this.bowlerNonStriker,
    this.crr,
    this.inningsNbr,
    this.lastWkt,
    this.curOvsStats,
    this.inningsScores,
    this.inningsId,
    this.performance,
    this.partnership,
    this.pp,
    this.target,
    this.batTeamScore,
    this.custStatus,
    this.responseLastUpdated,
    this.event,
  });

  factory Miniscore.fromJson(Map<String, dynamic> json) {
    return Miniscore(
      batsmanStriker: json['batsmanStriker'] != null
          ? BatsmanStriker.fromJson(json['batsmanStriker'])
          : null,
      batsmanNonStriker: json['batsmanNonStriker'] != null
          ? BatsmanNonStriker.fromJson(json['batsmanNonStriker'])
          : null,
      bowlerStriker: json['bowlerStriker'] != null
          ? BowlerStriker.fromJson(json['bowlerStriker'])
          : null,
      bowlerNonStriker: json['bowlerNonStriker'] != null
          ? BowlerStriker.fromJson(json['bowlerNonStriker'])
          : null,
      crr: json['crr'],
      inningsNbr: json['inningsNbr'],
      lastWkt: json['lastWkt'],
      curOvsStats: json['curOvsStats'],
      inningsScores: json['inningsScores'] != null
          ? InningsScores.fromJson(json['inningsScores'])
          : null,
      inningsId: json['inningsId'],
      performance: json['performance'] != null
          ? (json['performance'] as List)
              .map((v) => Performance.fromJson(v))
              .toList()
          : null,
      partnership: json['partnership'],
      pp: json['pp'] != null ? Pp.fromJson(json['pp']) : null,
      target: json['target'],
      batTeamScore: json['batTeamScore'] != null
          ? BatTeamScore.fromJson(json['batTeamScore'])
          : null,
      custStatus: json['custStatus'],
      responseLastUpdated: json['responseLastUpdated'],
      event: json['event'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    if (batsmanStriker != null) {
      data['batsmanStriker'] = batsmanStriker!.toJson();
    }
    if (batsmanNonStriker != null) {
      data['batsmanNonStriker'] = batsmanNonStriker!.toJson();
    }
    if (bowlerStriker != null) {
      data['bowlerStriker'] = bowlerStriker!.toJson();
    }
    if (bowlerNonStriker != null) {
      data['bowlerNonStriker'] = bowlerNonStriker!.toJson();
    }
    data['crr'] = crr;
    data['inningsNbr'] = inningsNbr;
    data['lastWkt'] = lastWkt;
    data['curOvsStats'] = curOvsStats;
    if (inningsScores != null) {
      data['inningsScores'] = inningsScores!.toJson();
    }
    data['inningsId'] = inningsId;
    if (performance != null) {
      data['performance'] = performance!.map((v) => v.toJson()).toList();
    }
    data['partnership'] = partnership;
    if (pp != null) {
      data['pp'] = pp!.toJson();
    }
    data['target'] = target;
    if (batTeamScore != null) {
      data['batTeamScore'] = batTeamScore!.toJson();
    }
    data['custStatus'] = custStatus;
    data['responseLastUpdated'] = responseLastUpdated;
    data['event'] = event;
    return data;
  }
}

// ... (Other classes like BatsmanStriker, BatsmanNonStriker, BowlerStriker, etc., should follow the same pattern)

class MatchHeaders {
  String? state;
  String? status;
  String? matchFormat;
  String? matchStartTimestamp;
  TeamDetails? teamDetails;
  MomPlayers? momPlayers;
  MosPlayers? mosPlayers;
  int? winningTeamId;
  String? matchEndTimeStamp;
  int? seriesId;
  String? matchDesc;
  String? seriesName;
  String? alertType;
  TossResults? tossResults;
  Team1? team1;
  Team1? team2;

  MatchHeaders({
    this.state,
    this.status,
    this.matchFormat,
    this.matchStartTimestamp,
    this.teamDetails,
    this.momPlayers,
    this.mosPlayers,
    this.winningTeamId,
    this.matchEndTimeStamp,
    this.seriesId,
    this.matchDesc,
    this.seriesName,
    this.alertType,
    this.tossResults,
    this.team1,
    this.team2,
  });

  factory MatchHeaders.fromJson(Map<String, dynamic> json) {
    return MatchHeaders(
      state: json['state'],
      status: json['status'],
      matchFormat: json['matchFormat'],
      matchStartTimestamp: json['matchStartTimestamp'],
      teamDetails: json['teamDetails'] != null
          ? TeamDetails.fromJson(json['teamDetails'])
          : null,
      momPlayers: json['momPlayers'] != null
          ? MomPlayers.fromJson(json['momPlayers'])
          : null,
      mosPlayers: json['mosPlayers'] != null
          ? MosPlayers.fromJson(json['mosPlayers'])
          : null,
      winningTeamId: json['winningTeamId'],
      matchEndTimeStamp: json['matchEndTimeStamp'],
      seriesId: json['seriesId'],
      matchDesc: json['matchDesc'],
      seriesName: json['seriesName'],
      alertType: json['alertType'],
      tossResults: json['tossResults'] != null
          ? TossResults.fromJson(json['tossResults'])
          : null,
      team1: json['team1'] != null ? Team1.fromJson(json['team1']) : null,
      team2: json['team2'] != null ? Team1.fromJson(json['team2']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['state'] = state;
    data['status'] = status;
    data['matchFormat'] = matchFormat;
    data['matchStartTimestamp'] = matchStartTimestamp;
    if (teamDetails != null) {
      data['teamDetails'] = teamDetails!.toJson();
    }
    if (momPlayers != null) {
      data['momPlayers'] = momPlayers!.toJson();
    }
    if (mosPlayers != null) {
      data['mosPlayers'] = mosPlayers!.toJson();
    }
    data['winningTeamId'] = winningTeamId;
    data['matchEndTimeStamp'] = matchEndTimeStamp;
    data['seriesId'] = seriesId;
    data['matchDesc'] = matchDesc;
    data['seriesName'] = seriesName;
    data['alertType'] = alertType;
    if (tossResults != null) {
      data['tossResults'] = tossResults!.toJson();
    }
    if (team1 != null) {
      data['team1'] = team1!.toJson();
    }
    if (team2 != null) {
      data['team2'] = team2!.toJson();
    }
    return data;
  }
}

class BatsmanStriker {
  String? name;
  int? runs;
  int? ballsFaced;

  BatsmanStriker({this.name, this.runs, this.ballsFaced});

  factory BatsmanStriker.fromJson(Map<String, dynamic> json) {
    return BatsmanStriker(
      name: json['name'],
      runs: json['runs'],
      ballsFaced: json['ballsFaced'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'runs': runs,
      'ballsFaced': ballsFaced,
    };
  }
}

class BatsmanNonStriker {
  String? name;
  int? runs;
  int? ballsFaced;

  BatsmanNonStriker({this.name, this.runs, this.ballsFaced});

  factory BatsmanNonStriker.fromJson(Map<String, dynamic> json) {
    return BatsmanNonStriker(
      name: json['name'],
      runs: json['runs'],
      ballsFaced: json['ballsFaced'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'runs': runs,
      'ballsFaced': ballsFaced,
    };
  }
}

class BowlerStriker {
  String? name;
  String? oversBowled;
  int? runsConceded;
  String? wicketsTaken;
  String? economy;

  BowlerStriker(
      {this.name,
      this.oversBowled,
      this.runsConceded,
      this.wicketsTaken,
      this.economy});

  factory BowlerStriker.fromJson(Map<String, dynamic> json) {
    return BowlerStriker(
      name: json['name'],
      oversBowled: json['overs'],
      runsConceded: json['runs'],
      wicketsTaken: json['wickets'] ?? '0',
      economy: json['economy'] ?? '0',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'oversBowled': oversBowled,
      'runsConceded': runsConceded,
      'wicketsTaken': wicketsTaken,
    };
  }
}

class OverSepList {
  List<OverSep>? overSep;

  OverSepList({this.overSep});

  factory OverSepList.fromJson(Map<String, dynamic> json) {
    return OverSepList(
      overSep: json['overSep'] != null
          ? (json['overSep'] as List).map((e) => OverSep.fromJson(e)).toList()
          : [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'overSep': overSep?.map((e) => e.toJson()).toList(),
    };
  }
}

class OverSep {
  int? score;
  int? wickets;
  int? inningsId;
  String? overSummary;
  int? runs;
  String? timestamp;
  double? overNum;
  List<String>? ovrBatNames;
  List<String>? ovrBowlNames;
  String? battingTeamName;

  OverSep({
    this.score,
    this.wickets,
    this.inningsId,
    this.overSummary,
    this.runs,
    this.timestamp,
    this.overNum,
    this.ovrBatNames,
    this.ovrBowlNames,
    this.battingTeamName,
  });

  factory OverSep.fromJson(Map<String, dynamic> json) {
    return OverSep(
      score: json['score'],
      wickets: json['wickets'],
      inningsId: json['inningsId'],
      overSummary: json['overSummary'],
      runs: json['runs'],
      timestamp: json['timestamp'],
      overNum: json['overNum']?.toDouble(),
      ovrBatNames: json['ovrBatNames'] != null
          ? List<String>.from(json['ovrBatNames'])
          : [],
      ovrBowlNames: json['ovrBowlNames'] != null
          ? List<String>.from(json['ovrBowlNames'])
          : [],
      battingTeamName: json['battingTeamName'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'score': score,
      'wickets': wickets,
      'inningsId': inningsId,
      'overSummary': overSummary,
      'runs': runs,
      'timestamp': timestamp,
      'overNum': overNum,
      'ovrBatNames': ovrBatNames,
      'ovrBowlNames': ovrBowlNames,
      'battingTeamName': battingTeamName,
    };
  }
}

class InningsScores {
  int? runs;
  int? ballsFaced;
  int? fours;
  int? sixes;

  InningsScores({this.runs, this.ballsFaced, this.fours, this.sixes});

  factory InningsScores.fromJson(Map<String, dynamic> json) {
    return InningsScores(
      runs: json['runs'],
      ballsFaced: json['ballsFaced'],
      fours: json['fours'],
      sixes: json['sixes'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'runs': runs,
      'ballsFaced': ballsFaced,
      'fours': fours,
      'sixes': sixes,
    };
  }
}

class Performance {
  String? playerName;
  int? runs;
  int? wickets;
  String? performanceType;

  Performance({this.playerName, this.runs, this.wickets, this.performanceType});

  factory Performance.fromJson(Map<String, dynamic> json) {
    return Performance(
      playerName: json['playerName'],
      runs: json['runs'],
      wickets: json['wickets'],
      performanceType: json['performanceType'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'playerName': playerName,
      'runs': runs,
      'wickets': wickets,
      'performanceType': performanceType,
    };
  }
}

class Pp {
  int? powerPlayOvers;
  int? powerPlayRuns;

  Pp({this.powerPlayOvers, this.powerPlayRuns});

  factory Pp.fromJson(Map<String, dynamic> json) {
    return Pp(
      powerPlayOvers: json['powerPlayOvers'],
      powerPlayRuns: json['powerPlayRuns'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'powerPlayOvers': powerPlayOvers,
      'powerPlayRuns': powerPlayRuns,
    };
  }
}

class BatTeamScore {
  int? totalRuns;
  int? totalWickets;
  int? totalOvers;

  BatTeamScore({this.totalRuns, this.totalWickets, this.totalOvers});

  factory BatTeamScore.fromJson(Map<String, dynamic> json) {
    return BatTeamScore(
      totalRuns: json['totalRuns'],
      totalWickets: json['totalWickets'],
      totalOvers: json['totalOvers'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'totalRuns': totalRuns,
      'totalWickets': totalWickets,
      'totalOvers': totalOvers,
    };
  }
}

class TeamDetails {
  String? teamName;
  String? teamCountry;
  int? teamRank;

  TeamDetails({this.teamName, this.teamCountry, this.teamRank});

  factory TeamDetails.fromJson(Map<String, dynamic> json) {
    return TeamDetails(
      teamName: json['teamName'],
      teamCountry: json['teamCountry'],
      teamRank: json['teamRank'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'teamName': teamName,
      'teamCountry': teamCountry,
      'teamRank': teamRank,
    };
  }
}

class MomPlayers {
  String? playerName;
  String? playerRole;

  MomPlayers({this.playerName, this.playerRole});

  factory MomPlayers.fromJson(Map<String, dynamic> json) {
    return MomPlayers(
      playerName: json['playerName'],
      playerRole: json['playerRole'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'playerName': playerName,
      'playerRole': playerRole,
    };
  }
}

class MosPlayers {
  String? playerName;
  String? playerRole;

  MosPlayers({this.playerName, this.playerRole});

  factory MosPlayers.fromJson(Map<String, dynamic> json) {
    return MosPlayers(
      playerName: json['playerName'],
      playerRole: json['playerRole'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'playerName': playerName,
      'playerRole': playerRole,
    };
  }
}

class TossResults {
  String? tossWinner;
  String? tossDecision;

  TossResults({this.tossWinner, this.tossDecision});

  factory TossResults.fromJson(Map<String, dynamic> json) {
    return TossResults(
      tossWinner: json['tossWinner'],
      tossDecision: json['tossDecision'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'tossWinner': tossWinner,
      'tossDecision': tossDecision,
    };
  }
}

class Team1 {
  String? teamName;
  String? teamCode;
  int? teamId;

  Team1({this.teamName, this.teamCode, this.teamId});

  factory Team1.fromJson(Map<String, dynamic> json) {
    return Team1(
      teamName: json['teamName'],
      teamCode: json['teamCode'],
      teamId: json['teamId'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'teamName': teamName,
      'teamCode': teamCode,
      'teamId': teamId,
    };
  }
}
