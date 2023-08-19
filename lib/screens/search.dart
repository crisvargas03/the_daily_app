import "package:flutter/cupertino.dart";
import "package:flutter/material.dart";
import "package:the_daily_app/constants/color.dart";
import "package:the_daily_app/widgets/article_item.dart";
import "package:the_daily_app/widgets/search_box.dart";
import "../widgets/custom_appbar.dart";
import "home.dart";

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          searchBox(),
          const SizedBox(height: 10),
          const Padding(
            padding: EdgeInsets.only(left: 20),
            child: Text(
              'Popular Articles',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: nigthBlack,
              ),
            ),
          ),
          const Expanded(
            child: Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                children: [
                  // for (var article in articlesList)
                  ArticleItem(
                    imageUrl:
                        "https://www.rmol.co/wp-content/uploads/2023/05/16tesla-fckq-facebookJumbo-4859007.jpg", // article.imageUrl,
                    title: "article.title",
                    date: "article.date",
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
