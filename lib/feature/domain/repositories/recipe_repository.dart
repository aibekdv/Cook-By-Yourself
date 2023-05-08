import 'package:cook_by_yourself/feature/domain/entities/dish_entity.dart';

abstract class RecipeRepository {
  Future<List<DishEntity>> getAllDishes();
  Future<DishEntity> getDishItem(int id);
  Future<List<DishEntity>> getFavorites();
  Future<void> setFavorite(DishEntity dish);
  Future<void> deleteFavoriteItem(int id);
}
