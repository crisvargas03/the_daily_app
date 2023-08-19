import 'dart:convert';
import '../models/article.dart';
import 'package:http/http.dart' as http;

Future<List<Article>> fetchArticlesWithBody() async {
  final Map<String, dynamic> requestBody = {
    "uri": "240f6a12-b9d8-40a6-b1c6-a220e31d08de",
    "infoArticleBodyLen": -1,
    "resultType": "articles",
    "articlesSortBy": "fq",
    "apiKey": "",
    "articlesCount": 10
  };

  final response = await http.post(
    Uri.parse(
        "http://eventregistry.org/api/v1/article/getArticlesForTopicPage"),
    headers: {'Content-Type': 'application/json'},
    body: json.encode(requestBody),
  );

  if (response.statusCode == 200) {
    final Map<String, dynamic> jsonResponse = json.decode(response.body);
    final List<dynamic> results = jsonResponse['articles']['results'];
    return results.map((articleData) => Article.fromJson(articleData)).toList();
  } else {
    throw Exception('Failed to load articles');
  }
}
