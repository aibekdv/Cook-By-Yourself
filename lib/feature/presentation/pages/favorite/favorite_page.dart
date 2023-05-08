import 'package:cook_by_yourself/core/values/consts.dart';
import 'package:cook_by_yourself/feature/domain/entities/dish_entity.dart';
import 'package:cook_by_yourself/feature/presentation/cubit/recipe/recipe_cubit.dart';
import 'package:cook_by_yourself/feature/presentation/pages/favorite/widgets/favorite_item_widget.dart';
import 'package:cook_by_yourself/feature/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavoritePage extends StatefulWidget {
  final bool isRouting;
  const FavoritePage({super.key, this.isRouting = false});

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      BlocProvider.of<RecipeCubit>(context).getFavorites();
    });
  }

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
              child: BlocBuilder<RecipeCubit, RecipeState>(
                builder: (context, state) {
                  List<DishEntity> favorites = [];
                  if (state is FavoriteLoading) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (state is FavoriteLoaded) {
                    favorites = state.dishes;
                  } else if (state is FavoriteFailure) {
                    return const Center(
                      child: Text("Error"),
                    );
                  }
                  return ListView.separated(
                    itemCount: favorites.isEmpty ? 1 : favorites.length,
                    itemBuilder: (context, index) => Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: favorites.isNotEmpty
                          ? FavoriteItemWidget(
                              id: favorites[index].id,
                              title: favorites[index].name,
                            )
                          : const Center(
                              child: Text("Пустое"),
                            ),
                    ),
                    separatorBuilder: (context, index) => const Divider(),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
