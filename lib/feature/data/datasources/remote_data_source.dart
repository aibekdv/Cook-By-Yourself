import 'package:cook_by_yourself/feature/domain/entities/dish_entity.dart';
import 'package:cook_by_yourself/feature/domain/entities/user_entity.dart';

abstract class CredentialRemoteDataSource {
  Future<void> signUpUser(UserEntity user);
  Future<void> signInUser(UserEntity user);
  Future<bool> isSignIn();
  Future<void> refreshToken();
  Future<void> resetPassword(String email);
  Future<void> signOut();
}

abstract class RecipeRemoteDataSource {
  Future<List<DishEntity>> getAllDishes();
  Future<DishEntity> getDishItem(int id);
  Future<List<DishEntity>> getFavorites();
  Future<void> setFavorite(DishEntity dish);
  Future<void> deleteFavoriteItem(int id);
}
