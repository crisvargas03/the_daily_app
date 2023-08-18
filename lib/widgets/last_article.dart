import "package:flutter/material.dart";
import "package:the_daily_app/constants/color.dart";

class LastArticle extends StatelessWidget {
  final String imageUrl;
  final String description;

  const LastArticle(
      {super.key, required this.imageUrl, required this.description});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 400,
          height: 200,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.network(
              imageUrl,
              fit: BoxFit.cover,
            ),
          ),
        ),
        const SizedBox(height: 10),
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            description,
            textAlign: TextAlign.left,
            style: const TextStyle(
              fontWeight: FontWeight.w600,
              color: nigthBlack,
              fontSize: 16,
            ),
          ),
        ),
      ],
    );
  }
}
