import 'model/model.dart';

abstract class AbstractWeatherRepository {
  Future<Sity> getIDSity(String sity);
  Future<WeatherModel> getWeather(String sityID);
}
