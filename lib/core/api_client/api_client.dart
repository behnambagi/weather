import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import 'package:weather_app/core/helpers/helpers_app.dart';
//done this file
part 'api_client.g.dart';

@RestApi(baseUrl: 'https://api.mapbox.com/')
abstract class ApiClient{
  factory ApiClient(Dio dio) = _ApiClient;

  @GET('geocoding/v5/mapbox.places/{city}.json')
  Future searchCity(@Path("city") String id, @Queries() Map<String,dynamic> queries);

}