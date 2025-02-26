import 'dart:convert';

class NewsModel {
  final List<StoryItem> storyList;
  final String lastUpdatedTime;
  final AppIndex appIndex;

  NewsModel({
    required this.storyList,
    required this.lastUpdatedTime,
    required this.appIndex,
  });

  factory NewsModel.fromJson(Map<String, dynamic> json) {
    return NewsModel(
      storyList: (json['storyList'] as List)
          .map((e) => StoryItem.fromJson(e))
          .toList(),
      lastUpdatedTime: json['lastUpdatedTime'].toString(),
      appIndex: AppIndex.fromJson(json['appIndex']),
    );
  }
}

class StoryItem {
  final Story? story;
  final Ad? ad;

  StoryItem({this.story, this.ad});

  factory StoryItem.fromJson(Map<String, dynamic> json) {
    if (json.containsKey('story')) {
      return StoryItem(story: Story.fromJson(json['story']));
    } else if (json.containsKey('ad')) {
      return StoryItem(ad: Ad.fromJson(json['ad']));
    }
    throw Exception("Invalid StoryItem JSON");
  }

  containsKey(String s) {}
}

class Story {
  final int id;
  final String hline;
  final String intro;
  final String pubTime;
  final String source;
  final String storyType;
  final int imageId;
  final String seoHeadline;
  final String context;
  final CoverImage coverImage;

  Story({
    required this.id,
    required this.hline,
    required this.intro,
    required this.pubTime,
    required this.source,
    required this.storyType,
    required this.imageId,
    required this.seoHeadline,
    required this.context,
    required this.coverImage,
  });

  factory Story.fromJson(Map<String, dynamic> json) {
    return Story(
      id: json['id'],
      hline: json['hline'],
      intro: json['intro'],
      pubTime: json['pubTime'].toString(),
      source: json['source'],
      storyType: json['storyType'],
      imageId: json['imageId'],
      seoHeadline: json['seoHeadline'],
      context: json['context'],
      coverImage: CoverImage.fromJson(json['coverImage']),
    );
  }
}

class CoverImage {
  final String id;
  final String caption;
  final String source;

  CoverImage({
    required this.id,
    required this.caption,
    required this.source,
  });

  factory CoverImage.fromJson(Map<String, dynamic> json) {
    return CoverImage(
      id: json['id'],
      caption: json['caption'],
      source: json['source'],
    );
  }
}

class Ad {
  final String name;
  final String layout;
  final int position;

  Ad({
    required this.name,
    required this.layout,
    required this.position,
  });

  factory Ad.fromJson(Map<String, dynamic> json) {
    return Ad(
      name: json['name'],
      layout: json['layout'],
      position: json['position'],
    );
  }
}

class AppIndex {
  final String seoTitle;
  final String webURL;

  AppIndex({
    required this.seoTitle,
    required this.webURL,
  });

  factory AppIndex.fromJson(Map<String, dynamic> json) {
    return AppIndex(
      seoTitle: json['seoTitle'],
      webURL: json['webURL'],
    );
  }
}

// Example usage:
void main() {
  String jsonString = 'YOUR_JSON_STRING_HERE';
  jsonDecode(jsonString);
}
