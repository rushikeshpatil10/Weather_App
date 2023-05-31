import 'package:clima/services/networking.dart';
import 'package:clima/services/location.dart';

const apiKey = '656bc7274be0728d9183dad73666bbf2';
const openWeatherMapURL = 'https://api.openweathermap.org/data/2.5/weather';

class WeatherModel {
  Future<dynamic> getCityWeather(String cityname) async {
    var url = '$openWeatherMapURL?q=$cityname&appid=$apiKey&units=metric';
    NetworkHepler networkHepler = NetworkHepler(Uri.parse(url));
    var weatherData = await networkHepler.getData();
    return weatherData;
  }

  Future<dynamic> getLocationWeather() async {
    Location location = Location();
    await location.getCurrentLocation();

    NetworkHepler networkHepler = NetworkHepler(Uri.parse(
        '$openWeatherMapURL?lat=${location.latitude}&lon=${location.longitude}&APPID=$apiKey&units=metric'));
    var weatherData = await networkHepler.getData();
    return weatherData;
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
