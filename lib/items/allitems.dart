import 'dart:convert';

List<FeaturedBook> featuredBookFromJson(String str) => List<FeaturedBook>.from(json.decode(str).map((x) => FeaturedBook.fromJson(x)));

String featuredBookToJson(List<FeaturedBook> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class FeaturedBook {
    FeaturedBook({
        this.userId,
        this.id,
        this.title,
        this.body,
    });

    int userId;
    int id;
    String title;
    String body;

    factory FeaturedBook.fromJson(Map<String, dynamic> json) => FeaturedBook(
        userId: json["userId"],
        id: json["id"],
        title: json["title"],
        body: json["body"],
    );

    Map<String, dynamic> toJson() => {
        "userId": userId,
        "id": id,
        "title": title,
        "body": body,
    };
}
