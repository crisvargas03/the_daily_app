import "package:flutter/cupertino.dart";
import "package:flutter/material.dart";
import "package:the_daily_app/constants/color.dart";
import "package:the_daily_app/widgets/article_item.dart";
import "package:the_daily_app/widgets/search_box.dart";
import "../models/article.dart";
import "../services/api_service.dart";
import "../widgets/custom_appbar.dart";
import "home.dart";

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<Search> createState() => _SearchState();
}

List<Article> articleList = [];

class _SearchState extends State<Search> {
  @override
  void initState() {
    super.initState();
    fetchArticlesWithBody().then((articles) {
      setState(() {
        articleList = articles;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(
          title: "Search",
          rightIcon: CupertinoIcons.xmark,
          rightButtonAction: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const Home()),
            );
          },
        ),
        body: Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              searchBox(),
              const SizedBox(height: 10),
              const Padding(
                padding: EdgeInsets.all(0),
                child: Text(
                  'Popular Articles',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: nigthBlack,
                  ),
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
        ));
  }
}
