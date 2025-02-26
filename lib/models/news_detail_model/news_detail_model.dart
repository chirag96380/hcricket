class CricketNewsDetail {
  final String headline;
  final String intro;
  final String source;
  final String publishTime;
  final String coverImage;
  final String coverImageId;
  final List<ContentItem> content;

  CricketNewsDetail({
    required this.headline,
    required this.intro,
    required this.source,
    required this.publishTime,
    required this.coverImage,
    required this.coverImageId,
    required this.content,
  });

  // Factory method to parse JSON safely
  factory CricketNewsDetail.fromJson(Map<String, dynamic> json) {
    var contentList = json['content'];
    List<ContentItem> contentItems = [];

    if (contentList is List) {
      contentItems = contentList
          .map((item) => item is Map<String, dynamic>
              ? ContentItem.fromJson(item)
              : ContentItem(contentType: '', contentValue: ''))
          .toList();
    }
    return CricketNewsDetail(
      headline: json['headline'] ?? '',
      intro: json['intro'] ?? '',
      source: json['source'] ?? '',
      publishTime: json['publishTime']?.toString() ?? '',
      coverImage: json['coverImage']?['source'] ?? '',
      coverImageId: json['coverImage']?['id'] ?? '',
      content: contentItems,
    );
  }

  // Utility to get all content as a single string
  String getAllContentAsString() {
    return content.map((e) => e.contentValue).join("\n\n");
  }
}

class ContentItem {
  final String contentType;
  final String contentValue;

  ContentItem({
    required this.contentType,
    required this.contentValue,
  });

  factory ContentItem.fromJson(Map<String, dynamic> json) {
    // Ensure that we are accessing the 'content' key properly.
    var content = json['content'] ?? {};
    return ContentItem(
      contentType:
          content['contentType'] ?? '', // Access the nested 'contentType'
      contentValue:
          content['contentValue'] ?? '', // Access the nested 'contentValue'
    );
  }
}
