import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:cook_by_yourself/core/values/consts.dart';
import 'package:cook_by_yourself/feature/data/models/dish_model.dart';
import 'package:cook_by_yourself/feature/domain/entities/dish_entity.dart';
import 'package:cook_by_yourself/feature/domain/entities/user_entity.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'remote_data_source.dart';

class CredentialRemoteDataSourceImpl implements CredentialRemoteDataSource {
  final Client client;
  final SharedPreferences sharedPreferences;

  CredentialRemoteDataSourceImpl({
    required this.sharedPreferences,
    required this.client,
  });

  final String ACCESS_TOKEN = 'accessToken';

  @override
  Future<void> signInUser(UserEntity user) async {
    var response = await client.post(
      Uri.parse("$apiUrl/account/login/"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        "email": user.email,
        "password": user.password!,
      }),
    );

    if (response.statusCode == 200 || response.statusCode == 201) {
      final res = jsonDecode(response.body);
      await sharedPreferences.setString(ACCESS_TOKEN, res['access']);
      await sharedPreferences.setString("refreshToken", res['refresh']);
      // log(res['access']);
    } else {
      toast(
        msg: "Email or password wrong",
        isError: true,
      );
      // log(response.body);
    }
  }

  @override
  Future<void> signUpUser(UserEntity user) async {
    var response = await client.post(
      Uri.parse("$apiUrl/account/register/"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        "email": user.email,
        "password": user.password!,
        "password2": user.password2!,
      }),
    );

    if (response.statusCode == 200 || response.statusCode == 201) {
      toast(
        msg: jsonDecode(utf8.decode(response.bodyBytes)) ?? "Some error",
      );
    } else {
      toast(
        msg: jsonDecode(response.body)['email'][0] ?? "Some error",
        isError: true,
      );
    }
  }

  @override
  Future<void> refreshToken() async {
    final refreshToken = sharedPreferences.getString("refreshToken");
    if (refreshToken != null) {
      final response = await client.post(
        Uri.parse('$apiUrl/account/refresh/'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(
          <String, String>{'refresh': refreshToken},
        ),
      );
      if (response.statusCode == 201 || response.statusCode == 200) {
        final res = jsonDecode(response.body);
        await sharedPreferences.setString(ACCESS_TOKEN, res['access']);
      } else {
        sharedPreferences.clear();
      }
    }
  }

  @override
  Future<bool> isSignIn() async =>
      sharedPreferences.getString(ACCESS_TOKEN) != null ? true : false;

  @override
  Future<void> signOut() async {
    await sharedPreferences.clear();
  }

  @override
  Future<void> resetPassword(String email) async {
    final response = await client.post(
      Uri.parse('$apiUrl/account/reset_password/'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(
        <String, String>{'email': email},
      ),
    );
    if (response.statusCode == 201 || response.statusCode == 200) {
      toast(msg: jsonDecode(utf8.decode(response.bodyBytes)) ?? "Send");
    } else {
      toast(msg: jsonDecode(utf8.decode(response.bodyBytes)));
    }
  }
}

class RecipeRemoteDataSourceImpl implements RecipeRemoteDataSource {
  final Client client;

  RecipeRemoteDataSourceImpl({required this.client});

  @override
  Future<void> deleteFavoriteItem(int id) async {
    // TODO: implement deleteFavoriteItem
    throw UnimplementedError();
  }

  @override
  Future<List<DishEntity>> getAllDishes() async {
    var response = await client.get(
      Uri.parse("$apiUrl/recipes/dishes/"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

    if (response.statusCode == 200 || response.statusCode == 201) {
      final res = jsonDecode(utf8.decode(response.bodyBytes));
      return (res['results'] as List)
          .map((e) => DishModel.fromJson(e))
          .toList();
    } else {
      throw Error();
    }
  }

  @override
  Future<DishEntity> getDishItem(int id) async {
    // TODO: implement getDishItem
    throw UnimplementedError();
  }

  @override
  Future<List<DishEntity>> getFavorites() async {
    var response = await client.get(
      Uri.parse("$apiUrl/recipes/favorites/"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

    if (response.statusCode == 200 || response.statusCode == 201) {
      final res = jsonDecode(utf8.decode(response.bodyBytes));
      log("$res");
      return (res['results'] as List)
          .map((e) => DishModel.fromJson(e))
          .toList();
    } else {
      throw Error();
    }
  }

  @override
  Future<void> setFavorite(DishEntity dish) async {
    // TODO: implement setFavorite
    throw UnimplementedError();
  }
}
