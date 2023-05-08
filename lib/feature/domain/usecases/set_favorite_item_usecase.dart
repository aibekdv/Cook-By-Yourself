import 'package:cook_by_yourself/feature/domain/entities/dish_entity.dart';
import 'package:cook_by_yourself/feature/domain/repositories/recipe_repository.dart';

class SetFavoriteItemUseCase {
  final RecipeRepository recipeRepository;

  SetFavoriteItemUseCase({required this.recipeRepository});

  Future<void> call(DishEntity dish) async {
    return await recipeRepository.setFavorite(dish);
  }
}
