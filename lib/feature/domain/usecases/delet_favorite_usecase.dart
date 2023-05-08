import 'package:cook_by_yourself/feature/domain/repositories/recipe_repository.dart';

class DeleteFavoriteItemUseCase {
  final RecipeRepository recipeRepository;

  DeleteFavoriteItemUseCase({required this.recipeRepository});

  Future<void> call(int id) async {
    return await recipeRepository.deleteFavoriteItem(id);
  }
}
