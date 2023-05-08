import 'package:cook_by_yourself/feature/domain/entities/user_entity.dart';

class UserModel extends UserEntity {
  UserModel({
    required super.email,
    required super.password,
    super.password2,
  });
}
