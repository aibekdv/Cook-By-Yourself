import 'package:cook_by_yourself/feature/domain/entities/dish_entity.dart';
import 'package:cook_by_yourself/feature/domain/repositories/recipe_repository.dart';

class GetDishItemUseCase {
  final RecipeRepository recipeRepository;

  GetDishItemUseCase({required this.recipeRepository});

  Future<DishEntity> call(int id) async {
    return await recipeRepository.getDishItem(id);
  }
}
