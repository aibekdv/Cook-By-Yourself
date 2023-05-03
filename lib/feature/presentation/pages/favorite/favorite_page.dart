import 'package:cook_by_yourself/core/values/consts.dart';
import 'package:cook_by_yourself/feature/presentation/pages/favorite/widgets/favorite_item_widget.dart';
import 'package:cook_by_yourself/feature/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';

class FavoritePage extends StatefulWidget {
  final bool isRouting;
  const FavoritePage({super.key, this.isRouting = false});

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            CustomAppBarWidget(
              bgColor: greenColor,
              title: "Избранное",
              isPrev: widget.isRouting,
            ),
            const SizedBox(height: 15),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: CustomSearchFormWidget(hinText: "Поиск..."),
            ),
            const SizedBox(height: 15),
            Expanded(
              child: ListView.separated(
                itemCount: 8,
                itemBuilder: (context, index) => const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.0),
                  child: FavoriteItemWidget(),
                ),
                separatorBuilder: (context, index) => const Divider(),
              ),
            )
          ],
        ),
      ),
    );
  }
}
