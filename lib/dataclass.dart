import 'dart:convert';

Welcome welcomeFromJson(String str) => Welcome.fromJson(json.decode(str));

String welcomeToJson(Welcome data) => json.encode(data.toJson());

class Welcome {
  Welcome({
    required this.success,
    this.message,
    required this.data,
  });

  bool success;
  dynamic message;
  Data data;

  factory Welcome.fromJson(Map<String, dynamic> json) => Welcome(
        success: json["success"],
        message: json["message"],
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
        "data": data.toJson(),
      };
}

class Data {
  Data({
    required this.link,
    required this.description,
    required this.title,
    required this.image,
    required this.posts,
  });

  String link;
  String description;
  String title;
  String image;
  List<Post> posts;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        link: json["link"],
        description: json["description"],
        title: json["title"],
        image: json["image"],
        posts: List<Post>.from(json["posts"].map((x) => Post.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "link": link,
        "description": description,
        "title": title,
        "image": image,
        "posts": List<dynamic>.from(posts.map((x) => x.toJson())),
      };
}

class Post {
  Post({
    required this.link,
    required this.title,
    required this.pubDate,
    required this.description,
    required this.thumbnail,
  });

  String link;
  String title;
  String pubDate;
  String description;
  String thumbnail;

  factory Post.fromJson(Map<String, dynamic> json) => Post(
        link: json["link"],
        title: json["title"],
        pubDate: json["pubDate"],
        description: json["description"],
        thumbnail: json["thumbnail"],
      );

  Map<String, dynamic> toJson() => {
        "link": link,
        "title": title,
        "pubDate": pubDate,
        "description": description,
        "thumbnail": thumbnail,
      };
}
