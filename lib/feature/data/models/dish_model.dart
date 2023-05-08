import 'package:cook_by_yourself/feature/domain/entities/dish_entity.dart';

class DishModel extends DishEntity {
  DishModel({
    super.id,
    super.name,
    super.decsription,
  });

  factory DishModel.fromJson(Map<String, dynamic> json) {
    return DishModel(
      id: json['id'],
      name: json['name'],
      decsription: json['description'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "name": name,
      "decsription": decsription,
    };
  }
}
