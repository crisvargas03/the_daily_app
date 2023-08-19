import "package:flutter/cupertino.dart";
import "package:flutter/material.dart";
import "package:the_daily_app/screens/home.dart";

import "../widgets/custom_appbar.dart";

class Details extends StatelessWidget {
  const Details({super.key});

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
      body: const Center(
        child: Text("Details"),
      ),
    );
  }
}
