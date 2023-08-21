import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:the_daily_app/constants/color.dart';
import 'package:the_daily_app/models/article.dart';
import 'package:the_daily_app/screens/search.dart';
import 'package:the_daily_app/widgets/custom_appbar.dart';
import 'package:the_daily_app/widgets/last_article.dart';
import '../services/api_service.dart';
import '../widgets/article_item.dart';
import 'details.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);
  @override
  State<Home> createState() => _HomeState();
}

enum ArticleState {
  loading,
  loaded,
  error,
}

class _HomeState extends State<Home> {
  ArticleState articleState = ArticleState.loading;
  Article topOne = Article();
  List<Article> articleList = [];

  @override
  void initState() {
    super.initState();
    setState(() {
      articleState = ArticleState.loading;
    });

    fetchArticlesWithBody().then((articles) {
      setState(() {
        articleList = articles;
        topOne = articleList.isNotEmpty ? articleList.first : Article();
        articleState = ArticleState.loaded;
      });
    }).catchError((error) {
      setState(() {
        articleState = ArticleState.error;
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
            if (articleState == ArticleState.loaded)
              LastArticle(
                imageUrl: topOne.image.toString(),
                description: topOne.title.toString(),
              ),
            const SizedBox(height: 20),
            const Text(
              'Popular Articles',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            if (articleState == ArticleState.loading)
              const CircularProgressIndicator(),
            if (articleState == ArticleState.error)
              const Text('Error fetching articles'),
            if (articleState == ArticleState.loaded)
              Expanded(
                child: ListView.builder(
                  itemCount: articleList.length,
                  itemBuilder: (context, index) {
                    var article = articleList[index];
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Details(article: article),
                          ),
                        );
                      },
                      child: ArticleItem(
                        imageUrl: article.image.toString(),
                        title: article.title.toString(),
                        date: article.date.toString(),
                      ),
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
