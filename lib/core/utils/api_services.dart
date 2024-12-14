import 'package:dio/dio.dart';

class ApiServices {
  final _baseUrl = 'https://api.weatherapi.com/v1/';
  final _endPoint = 'forecast.json?';
  final _key = '93d92a391daf4dc6940143152240112';

  ApiServices();

  Future<Map<dynamic, dynamic>> fetchWeather({
    required String location,
    required String lang,
    String day = "14",
  }) async {
    Dio dio = Dio();

    Response response = await dio.get(
      '$_baseUrl$_endPoint',
      queryParameters: {
        'key': _key,
        'q': location,
        'days': day,
        'lang': lang,
      },
    );
    return response.data;
  }
}
