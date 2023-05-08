import 'package:cook_by_yourself/feature/data/datasources/remote_data_source.dart';
import 'package:cook_by_yourself/feature/domain/entities/dish_entity.dart';
import 'package:cook_by_yourself/feature/domain/repositories/recipe_repository.dart';

class RecipeRepositoryImpl implements RecipeRepository {
  final RecipeRemoteDataSource remoteDataSource;

  RecipeRepositoryImpl({required this.remoteDataSource});

  @override
  Future<void> deleteFavoriteItem(int id) async {
    return await remoteDataSource.deleteFavoriteItem(id);
  }

  @override
  Future<List<DishEntity>> getAllDishes() async {
    return await remoteDataSource.getAllDishes();
  }

  @override
  Future<DishEntity> getDishItem(int id) async {
    return await remoteDataSource.getDishItem(id);
  }

  @override
  Future<List<DishEntity>> getFavorites() async {
    return await remoteDataSource.getFavorites();
  }

  @override
  Future<void> setFavorite(DishEntity dish) async {
    return await remoteDataSource.setFavorite(dish);
  }
}
