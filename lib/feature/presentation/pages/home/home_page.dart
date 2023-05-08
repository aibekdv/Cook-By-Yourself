import 'dart:math';

import 'package:cook_by_yourself/core/values/consts.dart';
import 'package:cook_by_yourself/feature/domain/entities/dish_entity.dart';
import 'package:cook_by_yourself/feature/presentation/cubit/recipe/recipe_cubit.dart';
import 'package:cook_by_yourself/feature/presentation/widgets/widgets.dart';
import 'package:cook_by_yourself/routes/on_generate_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      BlocProvider.of<RecipeCubit>(context).getAllDishes();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const CustomAppBarWidget(
                bgColor: greenColor,
                title: "Готовь вместе с нами!",
                isPrev: false,
              ),
              const SizedBox(height: 15),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Row(
                  children: [
                    const Expanded(
                      child: CustomSearchFormWidget(
                        hinText: "Введите ингредиенты...",
                      ),
                    ),
                    const SizedBox(width: 15),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(
                          context,
                          RouteConst.favoritePage,
                          arguments: ScreenRouteArgs(isRouting: true),
                        );
                      },
                      child: Container(
                          width: 48,
                          height: 48,
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(8)),
                            boxShadow: [
                              BoxShadow(
                                color: Color.fromRGBO(0, 0, 0, 0.09),
                                spreadRadius: 1,
                                blurRadius: 4.0,
                                offset: Offset(0, 0),
                              ),
                            ],
                          ),
                          child: const Icon(
                            Icons.favorite,
                            color: Colors.red,
                          )),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 15),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          _currentIndex = 0;
                          setState(() {});
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              _currentIndex == 0 ? yellowColor : greyColor,
                          enableFeedback: false,
                        ),
                        child: Text(
                          "Популярные",
                          style: TextStyle(
                            color: _currentIndex == 0
                                ? Colors.white
                                : Colors.black,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          _currentIndex = 1;
                          setState(() {});
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              _currentIndex == 1 ? yellowColor : greyColor,
                          enableFeedback: false,
                        ),
                        child: Text(
                          "Рекомендуемые",
                          style: TextStyle(
                            color: _currentIndex == 1
                                ? Colors.white
                                : Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 15),
              if (_currentIndex == 0)
                BlocBuilder<RecipeCubit, RecipeState>(
                  builder: (context, state) {
                    List<DishEntity> dishes = [];

                    if (state is RecipeLoading) {
                      return const CircularProgressIndicator();
                    } else if (state is RecipeLoaded) {
                      dishes = state.dishes;
                    } else if (state is RecipeFailure) {
                      return const Center(
                        child: Text(
                          "Error",
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        ),
                      );
                    }
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 12,
                          mainAxisSpacing: 12,
                        ),
                        itemCount: dishes.length,
                        shrinkWrap: true,
                        physics: const ScrollPhysics(),
                        itemBuilder: (context, index) {
                          return CardItemWidget(
                            title: dishes[index].name,
                          );
                        },
                      ),
                    );
                  },
                ),
              if (_currentIndex == 1)
                BlocBuilder<RecipeCubit, RecipeState>(
                  builder: (context, state) {
                    List<DishEntity> dishes = [];

                    if (state is RecipeLoading) {
                      return const CircularProgressIndicator();
                    } else if (state is RecipeLoaded) {
                      dishes = state.dishes;
                    } else if (state is RecipeFailure) {
                      return const Center(
                        child: Text(
                          "Error",
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        ),
                      );
                    }
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 12,
                          mainAxisSpacing: 12,
                        ),
                        itemCount: dishes.length > 1
                            ? dishes.length - 1
                            : dishes.length,
                        shrinkWrap: true,
                        physics: const ScrollPhysics(),
                        itemBuilder: (context, index) {
                          return CardItemWidget(
                            id: dishes[index].id,
                            title: dishes[index].name,
                          );
                        },
                      ),
                    );
                  },
                ),
              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}
