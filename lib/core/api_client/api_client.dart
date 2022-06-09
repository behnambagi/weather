import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
//done this file
part 'api_client.g.dart';

@RestApi(baseUrl: 'https://pro.openweathermap.org/data/2.5/forecast')
abstract class ApiClient{
  factory ApiClient(Dio dio) = _ApiClient;

  @GET('https://api.neshan.org/v2/reverse')
  Future location(@Queries() Map<String, dynamic> queries , @Header("Api-Key") String token);
}