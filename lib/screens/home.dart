import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:the_daily_app/constants/color.dart';
import 'package:the_daily_app/models/article.dart';
import 'package:the_daily_app/screens/search.dart';
import 'package:the_daily_app/widgets/custom_appbar.dart';
import 'package:the_daily_app/widgets/last_article.dart';
import '../services/api_service.dart';
import '../widgets/article_item.dart';

class Home extends StatefulWidget {
  const Home({super.key});
  @override
  State<Home> createState() => _HomeState();
}

List<Article> articleList = [];
Article topOne = Article();

class _HomeState extends State<Home> {
  @override
  void initState() {
    super.initState();
    fetchArticlesWithBody().then((articles) {
      setState(() {
        articleList = articles;
        topOne = articleList.first;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: "Home",
        rightIcon: CupertinoIcons.search,
        rightButtonAction: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const Search(),
            ),
          );
        },
      ),
      backgroundColor: glaciarWhite,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Latest Article',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: nigthBlack,
              ),
            ),
            const SizedBox(height: 10),
            Align(
                alignment: Alignment.centerRight,
                child: Expanded(
                  child: LastArticle(
                    imageUrl: topOne.image.toString(),
                    description: topOne.title.toString(),
                  ),
                )),
            const SizedBox(height: 20),
            const Text(
              'Popular Articles',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: articleList.length,
                itemBuilder: (context, index) {
                  var article = articleList[index];
                  return ArticleItem(
                    imageUrl: article.image.toString(),
                    title: article.title.toString(),
                    date: article.date.toString(),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
