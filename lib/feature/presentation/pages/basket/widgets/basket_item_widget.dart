import 'package:cook_by_yourself/core/values/consts.dart';
import 'package:flutter/material.dart';

class BasketItemWidget extends StatelessWidget {
  const BasketItemWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 96,
      child: Row(
        children: [
          Container(
            width: 85,
            height: 85,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: const DecorationImage(
                image: NetworkImage(
                    "https://i2.paste.pics/ae7582d530c998f3b60477fe36cd80ff.png"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(width: 15),
          Flexible(
            flex: 1,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const Flexible(
                  flex: 1,
                  child: Text(
                    "Салат Цезарь",
                    style: TextStyle(
                      color: greenColor,
                      fontSize: 18,
                    ),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                  ),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Подробнее",
                      style: TextStyle(
                        color: yellowColor,
                        fontSize: 16,
                      ),
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        SizedBox(
                          width: 24,
                          height: 24,
                          child: ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              padding: const EdgeInsets.all(0),
                              enableFeedback: false,
                            ),
                            child: const Icon(
                              Icons.remove,
                              size: 15,
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        const Text(
                          "100",
                          style: TextStyle(
                            color: greenColor,
                            fontSize: 16,
                          ),
                        ),
                        const SizedBox(width: 10),
                        SizedBox(
                          width: 24,
                          height: 24,
                          child: ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              padding: const EdgeInsets.all(0),
                              enableFeedback: false,
                            ),
                            child: const Icon(
                              Icons.add,
                              size: 15,
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
