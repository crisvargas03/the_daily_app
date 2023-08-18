import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:the_daily_app/constants/color.dart';
import 'package:the_daily_app/screens/search.dart';
import 'package:the_daily_app/widgets/custom_appbar.dart';

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
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 25),
          child: SafeArea(
              child: Column(
            children: [
              Text(
                "Latest articles",
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w700,
                  color: nigthBlack,
                ),
              ),
            ],
          ))),
    );
  }
}
