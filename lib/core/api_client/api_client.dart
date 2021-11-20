import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import 'package:weather/feature/home/byhour/dto/hour_response.dart';
import 'package:weather/feature/home/location/dto/weather_response.dart';
//done this file
part 'api_client.g.dart';

@RestApi(baseUrl: 'https://one-api.ir')
abstract class ApiClient{

  factory ApiClient(Dio dio) = _ApiClient;


  @GET('https://api.neshan.org/v2/reverse')
  Future location(@Queries() Map<String, dynamic> queries , @Header("Api-Key") String token);


  @GET('/weather')
      Future<WeatherResponse> getWeather(@Queries() Map<String , dynamic> queries);


  @GET('/weather')
  Future<HourResponse> getWeatherByHour(@Queries() Map<String , dynamic> queries);

}