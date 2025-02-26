// class TopStoriesModel {
//   final List<StoryItem> storyList;
//   final String lastUpdatedTime;
//   final AppIndex? appIndex;
//   final String previousId;
//   final List<TopicTag> topicTags;

//   const TopStoriesModel({
//     required this.storyList,
//     required this.lastUpdatedTime,
//     required this.appIndex,
//     required this.previousId,
//     required this.topicTags,
//   });

//   factory TopStoriesModel.fromJson(Map<String, dynamic> json) {
//     return TopStoriesModel(
//       storyList: (json['storyList'] as List<dynamic>?)
//               ?.map((item) => StoryItem.fromJson(item))
//               .toList() ??
//           [],
//       lastUpdatedTime: json['lastUpdatedTime']?.toString() ?? '',
//       appIndex: json['appIndex'] != null ? AppIndex.fromJson(json['appIndex']) : null,
//       previousId: json['previousId']?.toString() ?? '',
//       topicTags: (json['topicTags'] as List<dynamic>?)
//               ?.map((item) => TopicTag.fromJson(item))
//               .toList() ??
//           [],
//     );
//   }
// }

// class StoryItem {
//   final Story? story;
//   final Ad? ad;

//   const StoryItem({this.story, this.ad});

//   factory StoryItem.fromJson(Map<String, dynamic> json) {
//     return StoryItem(
//       story: json.containsKey('story') && json['story'] != null
//           ? Story.fromJson(json['story'])
//           : null,
//       ad: json.containsKey('ad') && json['ad'] != null ? Ad.fromJson(json['ad']) : null,
//     );
//   }
// }

// class Story {
//   final int id;
//   final String hline;
//   final String intro;
//   final String pubTime;
//   final String source;
//   final String storyType;
//   final int imageId;
//   final String seoHeadline;
//   final String context;
//   final CoverImage? coverImage;
//   final int? planId;
//   final Entitlements? entitlements;

//   const Story({
//     required this.id,
//     required this.hline,
//     required this.intro,
//     required this.pubTime,
//     required this.source,
//     required this.storyType,
//     required this.imageId,
//     required this.seoHeadline,
//     required this.context,
//     this.coverImage,
//     this.planId,
//     this.entitlements,
//   });

//   factory Story.fromJson(Map<String, dynamic> json) {
//     return Story(
//       id: json['id'] ?? 0,
//       hline: json['hline'] ?? '',
//       intro: json['intro'] ?? '',
//       pubTime: json['pubTime']?.toString() ?? '',
//       source: json['source'] ?? '',
//       storyType: json['storyType'] ?? '',
//       imageId: json['imageId'] ?? 0,
//       seoHeadline: json['seoHeadline'] ?? '',
//       context: json['context'] ?? '',
//       coverImage:
//           json['coverImage'] != null ? CoverImage.fromJson(json['coverImage']) : null,
//       planId: json['planId'],
//       entitlements: json['entitlements'] != null
//           ? Entitlements.fromJson(json['entitlements'])
//           : null,
//     );
//   }
// }

// class Ad {
//   final String name;
//   final String layout;
//   final int position;

//   const Ad({required this.name, required this.layout, required this.position});

//   factory Ad.fromJson(Map<String, dynamic> json) {
//     return Ad(
//       name: json['name'] ?? '',
//       layout: json['layout'] ?? '',
//       position: json['position'] ?? 0,
//     );
//   }
// }

// class CoverImage {
//   final String id;
//   final String caption;
//   final String source;

//   const CoverImage({required this.id, required this.caption, required this.source});

//   factory CoverImage.fromJson(Map<String, dynamic> json) {
//     return CoverImage(
//       id: json['id']?.toString() ?? '',
//       caption: json['caption'] ?? '',
//       source: json['source'] ?? '',
//     );
//   }
// }

// class Entitlements {
//   final String type;
//   final String name;
//   final List<int> teamId;
//   final int? seriesId;

//   const Entitlements({
//     required this.type,
//     required this.name,
//     required this.teamId,
//     this.seriesId,
//   });

//   factory Entitlements.fromJson(Map<String, dynamic> json) {
//     return Entitlements(
//       type: json['type'] ?? '',
//       name: json['name'] ?? '',
//       teamId: (json['teamId'] as List<dynamic>?)
//               ?.map((e) => int.tryParse(e.toString()) ?? 0)
//               .toList() ??
//           [],
//       seriesId: json['seriesId'],
//     );
//   }
// }

// class AppIndex {
//   final String seoTitle;
//   final String webURL;

//   const AppIndex({required this.seoTitle, required this.webURL});

//   factory AppIndex.fromJson(Map<String, dynamic> json) {
//     return AppIndex(
//       seoTitle: json['seoTitle'] ?? '',
//       webURL: json['webURL'] ?? '',
//     );
//   }
// }

// class TopicTag {
//   final String itemName;
//   final String itemId;

//   const TopicTag({required this.itemName, required this.itemId});

//   factory TopicTag.fromJson(Map<String, dynamic> json) {
//     return TopicTag(
//       itemName: json['itemName'] ?? '',
//       itemId: json['itemId']?.toString() ?? '',
//     );
//   }
// }

import 'dart:convert';

class TopStoriesModel {
  final List<NewsItem> homepage;

  TopStoriesModel({required this.homepage});

  factory TopStoriesModel.fromJson(dynamic jsonData) {
    if (jsonData is String) {
      return TopStoriesModel.fromMap(json.decode(jsonData));
    } else if (jsonData is Map<String, dynamic>) {
      return TopStoriesModel.fromMap(jsonData);
    } else {
      throw Exception(
          "Invalid JSON format: Expected String or Map<String, dynamic>");
    }
  }

  factory TopStoriesModel.fromMap(Map<String, dynamic> json) {
    return TopStoriesModel(
      homepage: json["homepage"] != null && json["homepage"] is List
          ? List<NewsItem>.from(
              json["homepage"].map((x) => NewsItem.fromMap(x)))
          : [],
    );
  }
}

class NewsItem {
  final Stories? stories;
  final Ad? ad;

  NewsItem({this.stories, this.ad});

  factory NewsItem.fromMap(Map<String, dynamic> json) {
    if (json.containsKey("stories")) {
      return NewsItem(stories: Stories.fromMap(json["stories"]));
    } else if (json.containsKey("ad")) {
      return NewsItem(ad: Ad.fromMap(json["ad"]));
    }
    return NewsItem();
  }
}

class Stories {
  final String headline;
  final String? intro;
  final String context;
  final String itemType;
  final int itemId;
  final String appIndexUrl;
  final int imageId;
  final String cardType;
  final int? publishedTime;
  final String analyticsTag;

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
    required this.analyticsTag,
  });

  factory Stories.fromMap(Map<String, dynamic> json) => Stories(
        headline: json["headline"] ?? "",
        intro: json["intro"],
        context: json["context"] ?? "",
        itemType: json["itemType"] ?? "",
        itemId: json["itemId"] is int
            ? json["itemId"]
            : int.tryParse(json["itemId"].toString()) ?? 0,
        appIndexUrl: json["appIndexUrl"] ?? "",
        imageId: json["imageId"] is int
            ? json["imageId"]
            : int.tryParse(json["imageId"].toString()) ?? 0,
        cardType: json["cardType"] ?? "",
        publishedTime: json["publishedTime"] is int
            ? json["publishedTime"]
            : int.tryParse(json["publishedTime"].toString()),
        analyticsTag: json["analyticsTag"] ?? "",
      );
}

class Ad {
  final String name;
  final String layout;
  final int position;

  Ad({required this.name, required this.layout, required this.position});

  factory Ad.fromMap(Map<String, dynamic> json) => Ad(
        name: json["name"],
        layout: json["layout"],
        position: json["position"],
      );
}
