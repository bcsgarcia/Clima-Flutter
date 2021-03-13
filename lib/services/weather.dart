import 'location.dart';
import 'networking.dart';

class WeatherModel {
  Location location = Location();
  NetworkHelper networkHelper = NetworkHelper();

  Future<dynamic> getCityWeather(String city) async {
    return await networkHelper.getDataFromCity(city);
  }

  Future<dynamic> getLocationWeather() async {
    await location.getCurrentLocation();

    if (location.latitude == 0.0 && location.longitude == 0.0) {
      return null;
    }

    return await networkHelper.getDataFromLatLon(
        location.latitude, location.longitude);
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp == 999) {
      return 'Error to get weather ☹️';
    }

    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}
