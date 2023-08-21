import "package:flutter/cupertino.dart";
import "package:flutter/material.dart";
import "package:the_daily_app/constants/color.dart";
import "package:the_daily_app/widgets/article_item.dart";
import "../models/article.dart";
import "../services/api_service.dart";
import "../widgets/custom_appbar.dart";
import "details.dart";
import "home.dart";

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<Search> createState() => _SearchState();
}

enum ArticleState {
  loading,
  loaded,
  error,
}

class _SearchState extends State<Search> {
  List<Article> articleList = [];
  ArticleState articleState = ArticleState.loading;

  @override
  void initState() {
    super.initState();
    setState(() {
      articleState = ArticleState.loading;
    });

    fetchArticlesWithBody().then((articles) {
      setState(() {
        articleList = articles;
        articleState = ArticleState.loaded;
      });
    }).catchError((error) {
      setState(() {
        articleState = ArticleState.error;
      });
    });
  }

  void runFilter(String keyword) {
    List<Article> results = [];
    if (keyword.isEmpty) {
      results = articleList;
    } else {
      results = articleList
          .where((item) =>
              item.title!.toLowerCase().contains(keyword.toLowerCase()))
          .toList();
    }

    setState(() {
      articleList = results;
    });
  }

  Widget searchTextBox() {
    return Padding(
      padding: const EdgeInsets.only(right: 20),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
            ),
            decoration: BoxDecoration(
              color: lotusGray,
              borderRadius: BorderRadius.circular(20),
            ),
            child: TextField(
              onChanged: (value) => runFilter(value),
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.all(0),
                border: InputBorder.none,
                hintText: 'Search articles',
                hintStyle: TextStyle(
                  color: const Color(0xff000000).withOpacity(0.5),
                ),
                suffixIcon: Icon(
                  CupertinoIcons.search,
                  color: const Color(0xff000000).withOpacity(0.5),
                  size: 20,
                ),
                suffixIconConstraints: const BoxConstraints(
                  maxHeight: 25,
                  minWidth: 25,
                ),
              ),
            ),
          ),
        ],
      ),
    );
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
            searchTextBox(),
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
