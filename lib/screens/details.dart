import "package:flutter/cupertino.dart";
import "package:flutter/material.dart";
import "package:the_daily_app/screens/home.dart";

import "../constants/color.dart";
import "../models/article.dart";
import "../widgets/custom_appbar.dart";

class Details extends StatelessWidget {
  final Article article;

  const Details({required this.article, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: "Details",
        rightIcon: CupertinoIcons.back,
        rightButtonAction: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const Home()),
          );
        },
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.network(article.image.toString()),
              const SizedBox(height: 20),
              Text(
                '${article.title}',
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  const Icon(
                    CupertinoIcons.time,
                    color: spacialGrey,
                    size: 14,
                  ),
                  const SizedBox(width: 5),
                  Text(
                    '${article.date}',
                    style: const TextStyle(
                      color: spacialGrey,
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Text(
                '${article.body}',
                style: const TextStyle(
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
