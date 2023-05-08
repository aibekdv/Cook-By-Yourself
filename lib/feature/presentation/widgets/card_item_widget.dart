import 'package:cook_by_yourself/core/values/consts.dart';
import 'package:flutter/material.dart';

class CardItemWidget extends StatefulWidget {
  final int? id;
  final String? title;
  final String? desc;

  const CardItemWidget({
    super.key,
    this.title,
    this.desc,
    this.id,
  });

  @override
  State<CardItemWidget> createState() => _CardItemWidgetState();
}

class _CardItemWidgetState extends State<CardItemWidget> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 160,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(
              "https://i2.paste.pics/ae7582d530c998f3b60477fe36cd80ff.png"),
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.all(Radius.circular(8)),
        color: yellowColor,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              IconButton(
                onPressed: () {
                  isFavorite = !isFavorite;
                  setState(() {});
                  isFavorite
                      ? toast(msg: "Успешно добавлено")
                      : toast(msg: "Успешно удалено", isError: true);
                },
                icon: Icon(
                  isFavorite ? Icons.favorite_outlined : Icons.favorite_border,
                  color: isFavorite ? Colors.red : Colors.white,
                ),
                splashRadius: 25,
              ),
            ],
          ),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 6),
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(8),
                bottomRight: Radius.circular(8),
              ),
              color: greenColor,
            ),
            child: Text(
              widget.title ?? "",
              style: const TextStyle(
                color: Colors.white,
                fontSize: 14,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
