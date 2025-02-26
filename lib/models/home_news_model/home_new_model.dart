import 'dart:convert';

class HomeNewsModel {
  List<HomepageItem> homepage;

  HomeNewsModel({required this.homepage});

  factory HomeNewsModel.fromJson(String str) => HomeNewsModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory HomeNewsModel.fromMap(Map<String, dynamic> json) => HomeNewsModel(
        homepage: List<HomepageItem>.from(json["homepage"].map((x) => HomepageItem.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "homepage": List<dynamic>.from(homepage.map((x) => x.toMap())),
      };
}

class HomepageItem {
  Stories? stories;
  Ad? ad;

  HomepageItem({this.stories, this.ad});

  factory HomepageItem.fromMap(Map<String, dynamic> json) => HomepageItem(
        stories: json.containsKey("stories") ? Stories.fromMap(json["stories"]) : null,
        ad: json.containsKey("ad") ? Ad.fromMap(json["ad"]) : null,
      );

  Map<String, dynamic> toMap() => {
        if (stories != null) "stories": stories!.toMap(),
        if (ad != null) "ad": ad!.toMap(),
      };
}

class Stories {
  String headline;
  String? intro;
  String context;
  String itemType;
  int itemId;
  String appIndexUrl;
  int imageId;
  String cardType;
  String? publishedTime;
  String? analyticsTag;
  int? planId;

  Stories({
    required this.headline,
    this.intro,
    required this.context,
    required this.itemType,
    required this.itemId,
    required this.appIndexUrl,
    required this.imageId,
    required this.cardType,
    this.publishedTime,
    this.analyticsTag,
    this.planId,
  });

  factory Stories.fromMap(Map<String, dynamic> json) => Stories(
        headline: json["headline"],
        intro: json["intro"],
        context: json["context"],
        itemType: json["itemType"],
        itemId: json["itemId"],
        appIndexUrl: json["appIndexUrl"],
        imageId: json["imageId"],
        cardType: json["cardType"],
        publishedTime: json["publishedTime"],
        analyticsTag: json["analyticsTag"],
        planId: json["planId"],
      );

  Map<String, dynamic> toMap() => {
        "headline": headline,
        if (intro != null) "intro": intro,
        "context": context,
        "itemType": itemType,
        "itemId": itemId,
        "appIndexUrl": appIndexUrl,
        "imageId": imageId,
        "cardType": cardType,
        if (publishedTime != null) "publishedTime": publishedTime,
        if (analyticsTag != null) "analyticsTag": analyticsTag,
        if (planId != null) "planId": planId,
      };
}

class Ad {
  String name;
  String layout;
  int position;

  Ad({required this.name, required this.layout, required this.position});

  factory Ad.fromMap(Map<String, dynamic> json) => Ad(
        name: json["name"],
        layout: json["layout"],
        position: json["position"],
      );

  Map<String, dynamic> toMap() => {
        "name": name,
        "layout": layout,
        "position": position,
      };
}
