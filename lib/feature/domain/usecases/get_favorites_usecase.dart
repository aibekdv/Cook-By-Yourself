import 'package:cook_by_yourself/feature/domain/entities/dish_entity.dart';
import 'package:cook_by_yourself/feature/domain/repositories/recipe_repository.dart';

class GetFavoritesUseCase {
  final RecipeRepository recipeRepository;

  GetFavoritesUseCase({required this.recipeRepository});

  Future<List<DishEntity>> call() async {
    return await recipeRepository.getFavorites();
  }
}
