import "package:flutter/cupertino.dart";
import "package:flutter/material.dart";
import "package:the_daily_app/screens/home.dart";

import "../widgets/custom_appbar.dart";

class Search extends StatelessWidget {
  const Search({super.key});

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
      body: const Center(
        child: Text("Search"),
      ),
    );
  }
}
