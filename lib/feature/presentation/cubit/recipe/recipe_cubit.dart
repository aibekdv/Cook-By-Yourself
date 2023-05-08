import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:cook_by_yourself/feature/domain/entities/dish_entity.dart';
import 'package:cook_by_yourself/feature/domain/usecases/delet_favorite_usecase.dart';
import 'package:cook_by_yourself/feature/domain/usecases/get_all_dishes_usecase.dart';
import 'package:cook_by_yourself/feature/domain/usecases/get_dish_item_usecase.dart';
import 'package:cook_by_yourself/feature/domain/usecases/get_favorites_usecase.dart';
import 'package:cook_by_yourself/feature/domain/usecases/set_favorite_item_usecase.dart';
import 'package:cook_by_yourself/feature/domain/usecases/set_favorite_usecase.dart';
import 'package:equatable/equatable.dart';

part 'recipe_state.dart';

class RecipeCubit extends Cubit<RecipeState> {
  final GetAllDishesUseCase getAllDishesUseCase;
  final GetFavoritesUseCase getFavoritesUseCase;
  final SetFavoriteItemUseCase setFavoriteItemUseCase;
  final SetFavoriteUseCase setFavoriteUseCase;
  final GetDishItemUseCase getDishItemUseCase;
  final DeleteFavoriteItemUseCase deleteFavoriteItemUseCase;

  RecipeCubit({
    required this.getAllDishesUseCase,
    required this.getFavoritesUseCase,
    required this.setFavoriteItemUseCase,
    required this.setFavoriteUseCase,
    required this.getDishItemUseCase,
    required this.deleteFavoriteItemUseCase,
  }) : super(RecipeInitial());

  Future<void> getAllDishes() async {
    emit(RecipeLoading());
    try {
      List<DishEntity> dishes = await getAllDishesUseCase();
      log(dishes.toString());
      emit(RecipeLoaded(dishes: dishes));
    } catch (_) {
      emit(RecipeFailure());
    }
  }

  Future<void> getFavorites() async {
    emit(FavoriteLoading());
    try {
      var res = await getFavoritesUseCase();
      emit(FavoriteLoaded(dishes: res));
    } catch (_) {
      emit(RecipeFailure());
    }
  }
}
