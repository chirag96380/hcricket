class SquadsModel {
  SquadsModel({
    required this.team1,
    required this.team2,
  });

  final Team1Class? team1;
  final Team1Class? team2;

  factory SquadsModel.fromJson(Map<String, dynamic> json) {
    return SquadsModel(
      team1: json["team1"] == null ? null : Team1Class.fromJson(json["team1"]),
      team2: json["team2"] == null ? null : Team1Class.fromJson(json["team2"]),
    );
  }

  Map<String, dynamic> toJson() => {
        "team1": team1?.toJson(),
        "team2": team2?.toJson(),
      };
}

class Team1Class {
  Team1Class({
    required this.team,
    required this.players,
  });

  final TeamClass? team;
  final Players? players;

  factory Team1Class.fromJson(Map<String, dynamic> json) {
    return Team1Class(
      team: json["team"] == null ? null : TeamClass.fromJson(json["team"]),
      players:
          json["players"] == null ? null : Players.fromJson(json["players"]),
    );
  }

  Map<String, dynamic> toJson() => {
        "team": team?.toJson(),
        "players": players?.toJson(),
      };
}

class Players {
  Players({
    required this.playingXi,
    required this.bench,
    required this.supportStaff,
  });

  final List<Bench> playingXi;
  final List<Bench> bench;
  final List<SupportStaff> supportStaff;

  factory Players.fromJson(Map<String, dynamic> json) {
    return Players(
      playingXi: json["playing XI"] == null
          ? []
          : List<Bench>.from(json["playing XI"]!.map((x) => Bench.fromJson(x))),
      bench: json["bench"] == null
          ? []
          : List<Bench>.from(json["bench"]!.map((x) => Bench.fromJson(x))),
      supportStaff: json["support staff"] == null
          ? []
          : List<SupportStaff>.from(
              json["support staff"]!.map((x) => SupportStaff.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() => {
        "playing XI": playingXi.map((x) => x.toJson()).toList(),
        "bench": bench.map((x) => x.toJson()).toList(),
        "support staff": supportStaff.map((x) => x.toJson()).toList(),
      };
}

class Bench {
  Bench({
    required this.id,
    required this.name,
    required this.fullName,
    required this.nickName,
    required this.captain,
    required this.role,
    required this.keeper,
    required this.substitute,
    required this.teamId,
    required this.battingStyle,
    required this.bowlingStyle,
    required this.teamName,
    required this.faceImageId,
  });

  final int? id;
  final String? name;
  final String? fullName;
  final String? nickName;
  final bool? captain;
  final String? role;
  final bool? keeper;
  final bool? substitute;
  final int? teamId;
  final String? battingStyle;
  final String? bowlingStyle;
  final String? teamName;
  final int? faceImageId;

  factory Bench.fromJson(Map<String, dynamic> json) {
    return Bench(
      id: json["id"],
      name: json["name"],
      fullName: json["fullName"],
      nickName: json["nickName"],
      captain: json["captain"],
      role: json["role"],
      keeper: json["keeper"],
      substitute: json["substitute"],
      teamId: json["teamId"],
      battingStyle: json["battingStyle"],
      bowlingStyle: json["bowlingStyle"],
      teamName: json["teamName"],
      faceImageId: json["faceImageId"],
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "fullName": fullName,
        "nickName": nickName,
        "captain": captain,
        "role": role,
        "keeper": keeper,
        "substitute": substitute,
        "teamId": teamId,
        "battingStyle": battingStyle,
        "bowlingStyle": bowlingStyle,
        "teamName": teamName,
        "faceImageId": faceImageId,
      };
}

class SupportStaff {
  SupportStaff({
    required this.id,
    required this.name,
    required this.fullName,
    required this.nickName,
    required this.role,
    required this.teamId,
    required this.teamName,
    required this.faceImageId,
    required this.isSupportStaff,
  });

  final int? id;
  final String? name;
  final String? fullName;
  final String? nickName;
  final String? role;
  final int? teamId;
  final String? teamName;
  final int? faceImageId;
  final bool? isSupportStaff;

  factory SupportStaff.fromJson(Map<String, dynamic> json) {
    return SupportStaff(
      id: json["id"],
      name: json["name"],
      fullName: json["fullName"],
      nickName: json["nickName"],
      role: json["role"],
      teamId: json["teamId"],
      teamName: json["teamName"],
      faceImageId: json["faceImageId"],
      isSupportStaff: json["isSupportStaff"],
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "fullName": fullName,
        "nickName": nickName,
        "role": role,
        "teamId": teamId,
        "teamName": teamName,
        "faceImageId": faceImageId,
        "isSupportStaff": isSupportStaff,
      };
}

class TeamClass {
  TeamClass({
    required this.teamId,
    required this.teamName,
    required this.teamSName,
    required this.imageId,
  });

  final int? teamId;
  final String? teamName;
  final String? teamSName;
  final int? imageId;

  factory TeamClass.fromJson(Map<String, dynamic> json) {
    return TeamClass(
      teamId: json["teamId"],
      teamName: json["teamName"],
      teamSName: json["teamSName"],
      imageId: json["imageId"],
    );
  }

  Map<String, dynamic> toJson() => {
        "teamId": teamId,
        "teamName": teamName,
        "teamSName": teamSName,
        "imageId": imageId,
      };
}
