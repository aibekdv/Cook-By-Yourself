part of 'recipe_cubit.dart';

abstract class RecipeState extends Equatable {
  const RecipeState();

  @override
  List<Object> get props => [];
}

class RecipeInitial extends RecipeState {}

class RecipeLoading extends RecipeState {}

class RecipeLoaded extends RecipeState {
  final List<DishEntity> dishes;

  const RecipeLoaded({required this.dishes});
}

class RecipeFailure extends RecipeState {}

class FavoriteLoading extends RecipeState {}

class FavoriteLoaded extends RecipeState {
  final List<DishEntity> dishes;

  const FavoriteLoaded({required this.dishes});
}

class FavoriteFailure extends RecipeState {}
