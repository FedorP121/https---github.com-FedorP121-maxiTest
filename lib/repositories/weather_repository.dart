import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:maxidom/repositories/repository.dart';

class WeatherApi implements AbstractWeatherRepository {
  // Заменить на ваш реальный токен
  static const String token = '56b30cb255.3443075';
  static const String api = 'https://api.gismeteo.net/v2';

  @override
  Future<Sity> getIDSity(String sity) async {
    final Uri url = Uri.parse('$api/search/cities/?query=$sity');

    try {
      final response = await http.get(
        url,
        headers: {
          'X-Gismeteo-Token': token,
          'Accept-Encoding': 'deflate, gzip',
        },
      );

      if (response.statusCode == 200) {
        final jsonResponse = json.decode(response.body);

        if (jsonResponse.containsKey('id')) {
          return Sity(sityID: jsonResponse['id'].toString());
        } else {
          throw Exception('City ID не существует');
        }
      } else {
        throw Exception('Ошибка загрузки');
      }
    } catch (e) {
      debugPrint(e.toString());
      throw Exception('Произошла ошибка при получении данных ');
    }
  }

  @override
  Future<WeatherModel> getWeather(String sityID) async {
    final Uri url = Uri.parse('$api/weather/current/$sityID');

    try {
      final response = await http.get(
        url,
        headers: {
          'X-Gismeteo-Token': token,
          'Accept-Encoding': 'deflate, gzip',
        },
      );

      if (response.statusCode == 200) {
        final jsonResponse = json.decode(response.body);

        return WeatherModel.fromJson(jsonResponse);
      } else {
        throw Exception('Ошибка загрузки погодных данных');
      }
    } catch (e) {
      debugPrint(e.toString());
      throw Exception('Произошла ошибка при получении данных о погоде');
    }
  }
}
