import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:the_daily_app/constants/color.dart';

Widget searchBox() {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
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
