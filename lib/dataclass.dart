class cData {
  String linkData;
  String descriptionData;
  String titleData;
  String imageData;
  List cPost;

  cData({
    required this.linkData,
    required this.descriptionData,
    required this.titleData,
    required this.imageData,
    required this.cPost,
  });

  factory cData.fromJson(Map<String, dynamic> json) {
    return cData(
        linkData: json['link'],
        descriptionData: json['description'],
        titleData: json['title'],
        imageData: json['image'],
        cPost: json['post']);
  }
}

class cPost {
  String link;
  String title;
  String pubDate;
  String description;
  String thumbnail;

  cPost(
      {required this.link,
      required this.title,
      required this.pubDate,
      required this.description,
      required this.thumbnail});

  factory cPost.fromJson(Map<String, dynamic> json) {
    return cPost(
        link: json['link'],
        title: json['title'],
        pubDate: json['pubDate'],
        description: json['description'],
        thumbnail: json['thumbnail']);
  }
}
