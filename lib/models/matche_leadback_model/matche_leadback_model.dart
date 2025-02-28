class LeanbackModel {
  final MiniScore miniScore;
  final MatchHeader matchHeader;

  LeanbackModel({required this.miniScore, required this.matchHeader});

  factory LeanbackModel.fromJson(Map<String, dynamic> json) {
    return LeanbackModel(
      miniScore: MiniScore.fromJson(json['miniscore']),
      matchHeader: MatchHeader.fromJson(json['matchHeaders']),
    );
  }
}

class MiniScore {
  final Player batsmanStriker;
  final Player batsmanNonStriker;
  final Bowler bowlerStriker;
  final Bowler bowlerNonStriker;
  final double crr;
  final double rrr;
  final String inningsNbr;
  final String lastWkt;
  final String curOvsStats;
  final List<InningsScore> inningsScores;
  final int inningsId;
  final String partnership;
  final int target;
  final TeamScore batTeamScore;
  final String custStatus;

  MiniScore({
    required this.batsmanStriker,
    required this.batsmanNonStriker,
    required this.bowlerStriker,
    required this.bowlerNonStriker,
    required this.crr,
    required this.rrr,
    required this.inningsNbr,
    required this.lastWkt,
    required this.curOvsStats,
    required this.inningsScores,
    required this.inningsId,
    required this.partnership,
    required this.target,
    required this.batTeamScore,
    required this.custStatus,
  });

  factory MiniScore.fromJson(Map<String, dynamic> json) {
    return MiniScore(
      batsmanStriker: Player.fromJson(json['batsmanStriker']),
      batsmanNonStriker: Player.fromJson(json['batsmanNonStriker']),
      bowlerStriker: Bowler.fromJson(json['bowlerStriker']),
      bowlerNonStriker: Bowler.fromJson(json['bowlerNonStriker']),
      crr: json['crr'].toDouble(),
      rrr: double.tryParse(json['rrr']?.toString() ?? '0.0') ?? 0.0,
      inningsNbr: json['inningsNbr'],
      lastWkt: json['lastWkt'],
      curOvsStats: json['curOvsStats'],
      inningsScores: (json['inningsScores']['inningsScore'] as List)
          .map((e) => InningsScore.fromJson(e))
          .toList(),
      inningsId: json['inningsId'],
      partnership: json['partnership'] ,
      target: json['target'] ?? 00,
      batTeamScore: TeamScore.fromJson(json['batTeamScore']),
      custStatus: json['custStatus'] ?? '',
    );
  }
}

class MatchHeader {
  final String state;
  final String status;
  final String matchFormat;
  final int matchStartTimestamp;
  final TeamDetails teamDetails;
  final TossResults tossResults;
  final Team team1;
  final Team team2;

  MatchHeader({
    required this.state,
    required this.status,
    required this.matchFormat,
    required this.matchStartTimestamp,
    required this.teamDetails,
    required this.tossResults,
    required this.team1,
    required this.team2,
  });

  factory MatchHeader.fromJson(Map<String, dynamic> json) {
    return MatchHeader(
      state: json['state'],
      status: json['status'],
      matchFormat: json['matchFormat'],
      matchStartTimestamp: int.parse(json['matchStartTimestamp']),
      teamDetails: TeamDetails.fromJson(json['teamDetails']),
      tossResults: TossResults.fromJson(json['tossResults']),
      team1: Team.fromJson(json['team1']),
      team2: Team.fromJson(json['team2']),
    );
  }
}

class Player {
  final int id;
  final String name;
  final String nickName;
  final int runs;
  final int balls;
  final int fours;
  final int six;

  final double strikeRate;

  Player({
    required this.id,
    required this.name,
    required this.nickName,
    required this.runs,
    required this.balls,
    required this.fours,
    required this.six,
    required this.strikeRate,
  });

  factory Player.fromJson(Map<String, dynamic> json) {
    return Player(
      id: json['id'] ?? 0,
      name: json['name'] ?? 'Unknown',
      nickName: json['nickName'] ?? 'Unknown',
      runs: json['runs'] ?? 0,
      balls: json['balls'] ?? 0,
      fours: json['fours'] ?? 0,
      six: json['sixes'] ?? 0,
      strikeRate: double.tryParse(json['strkRate']?.toString() ?? '0.0') ?? 0.0,
    );
  }
}

class Bowler {
  final int id;
  final String name;
  final double overs;
  final int runs;
  final double economy;
  final int wickets;

  Bowler({
    required this.id,
    required this.name,
    required this.overs,
    required this.runs,
    required this.economy,
    required this.wickets,
  });

  factory Bowler.fromJson(Map<String, dynamic> json) {
    return Bowler(
      id: json['id'] ?? 0,
      name: json['name'] ?? 'Unknown',
      overs: double.tryParse(json['overs']?.toString() ?? '0.0') ?? 0.0,
      runs: json['runs'] ?? 0,
      economy: double.tryParse(json['economy']?.toString() ?? '0.0') ?? 0.0,
      wickets: json['wickets'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'overs': overs.toStringAsFixed(1),
      'runs': runs,
      'economy': economy.toStringAsFixed(1),
      'wickets': wickets,
    };
  }
}

class InningsScore {
  final int inningsId;
  final String batTeamShortName;
  final int runs;
  final int wickets;
  final double overs;

  InningsScore({
    required this.inningsId,
    required this.batTeamShortName,
    required this.runs,
    required this.wickets,
    required this.overs,
  });

  factory InningsScore.fromJson(Map<String, dynamic> json) {
    return InningsScore(
      inningsId: json['inningsId'],
      batTeamShortName: json['batTeamShortName'],
      runs: json['runs'],
      wickets: json['wickets'],
      overs: json['overs'].toDouble(),
    );
  }
}

class TeamScore {
  final int teamId;
  final int teamScore;
  final int teamWkts;

  TeamScore(
      {required this.teamId, required this.teamScore, required this.teamWkts});

  factory TeamScore.fromJson(Map<String, dynamic> json) {
    return TeamScore(
      teamId: json['teamId'],
      teamScore: json['teamScore'],
      teamWkts: json['teamWkts'],
    );
  }
}

class TeamDetails {
  final int batTeamId;
  final String batTeamName;
  final int bowlTeamId;
  final String bowlTeamName;

  TeamDetails(
      {required this.batTeamId,
      required this.batTeamName,
      required this.bowlTeamId,
      required this.bowlTeamName});

  factory TeamDetails.fromJson(Map<String, dynamic> json) {
    return TeamDetails(
      batTeamId: json['batTeamId'],
      batTeamName: json['batTeamName'],
      bowlTeamId: json['bowlTeamId'],
      bowlTeamName: json['bowlTeamName'],
    );
  }
}

class TossResults {
  final int tossWinnerId;
  final String tossWinnerName;
  final String decision;

  TossResults(
      {required this.tossWinnerId,
      required this.tossWinnerName,
      required this.decision});

  factory TossResults.fromJson(Map<String, dynamic> json) {
    return TossResults(
      tossWinnerId: json['tossWinnerId'],
      tossWinnerName: json['tossWinnerName'],
      decision: json['decision'],
    );
  }
}

class Team {
  final int teamId;
  final String teamName;
  final String teamSName;

  Team({required this.teamId, required this.teamName, required this.teamSName});

  factory Team.fromJson(Map<String, dynamic> json) {
    return Team(
      teamId: json['teamId'],
      teamName: json['teamName'],
      teamSName: json['teamSName'],
    );
  }
}

class PowerPlay {
  final int id;
  final double ovrFrom;
  final double ovrTo;
  final String ppType;
  final int run;

  PowerPlay(
      {required this.id,
      required this.ovrFrom,
      required this.ovrTo,
      required this.ppType,
      required this.run});

  factory PowerPlay.fromJson(Map<String, dynamic> json) {
    return PowerPlay(
      id: json['id'],
      ovrFrom: json['ovrFrom'].toDouble(),
      ovrTo: json['ovrTo'].toDouble(),
      ppType: json['ppType'],
      run: json['run'],
    );
  }
}
