class Article {
  String? uri = "";
  String? image = "";
  String? title = "";
  String? body = "";
  String? date = "";

  String? url;
  String? lang;

  Article({this.uri, this.image, this.title, this.body, this.date});

  factory Article.fromJson(Map<String, dynamic> json) {
    return Article(
      uri: json['uri'],
      image: json['image'],
      title: json['title'],
      body: json['body'],
      date: json['date'],
    );
  }
}
