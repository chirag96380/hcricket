import 'dart:convert';

class LeagueModel {
  final List<Team> teams;

  LeagueModel({required this.teams});

  factory LeagueModel.fromJson(Map<String, dynamic> json) {
    return LeagueModel(
      teams: (json['list'] as List).map((item) => Team.fromJson(item)).toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'list': teams.map((team) => team.toJson()).toList(),
    };
  }
}

class Team {
  final int? teamId;
  final String teamName;
  final String? teamSName;
  final int? imageId;
  final String? countryName;
  final String? belongsTo;

  Team({
    this.teamId,
    required this.teamName,
    this.teamSName,
    this.imageId,
    this.countryName,
    this.belongsTo,
  });

  factory Team.fromJson(Map<String, dynamic> json) {
    return Team(
      teamId: json['teamId'],
      teamName: json['teamName'],
      teamSName: json['teamSName'],
      imageId: json['imageId'],
      countryName: json['countryName'],
      belongsTo: json['belongsTo'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'teamId': teamId,
      'teamName': teamName,
      'teamSName': teamSName,
      'imageId': imageId,
      'countryName': countryName,
      'belongsTo': belongsTo,
    };
  }
}
