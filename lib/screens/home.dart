import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:the_daily_app/constants/color.dart';
import 'package:the_daily_app/screens/search.dart';
import 'package:the_daily_app/widgets/custom_appbar.dart';
import 'package:the_daily_app/widgets/last_article.dart';

class Home extends StatefulWidget {
  const Home({super.key});
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: "Home",
        rightIcon: CupertinoIcons.search,
        rightButtonAction: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const Search()),
          );
        },
      ),
      backgroundColor: glaciarWhite,
      body: const Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Latest Article',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: nigthBlack,
              ),
            ),
            SizedBox(height: 10),
            Align(
              alignment: Alignment.centerRight,
              child: LastArticle(
                imageUrl:
                    "https://www.rmol.co/wp-content/uploads/2023/05/16tesla-fckq-facebookJumbo-4859007.jpg",
                description:
                    "Tesla Changed A Deadline For Investor Proposals, Angering Activists | RMOL",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
