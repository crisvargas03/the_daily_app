import 'package:flutter/cupertino.dart';
import 'package:the_daily_app/constants/color.dart';

class ArticleItem extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String date;

  const ArticleItem(
      {super.key,
      required this.imageUrl,
      required this.title,
      required this.date});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 75,
          height: 75,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.network(
              imageUrl,
              fit: BoxFit.cover,
            ),
          ),
        ),
        const SizedBox(width: 20),
        Flexible(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(fontSize: 18),
              ),
              const SizedBox(height: 5),
              Row(
                children: [
                  const Icon(
                    CupertinoIcons.time,
                    color: spacialGrey,
                    size: 14,
                  ),
                  const SizedBox(width: 5),
                  Text(
                    date,
                    style: const TextStyle(
                        color: spacialGrey,
                        fontSize: 10,
                        fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
