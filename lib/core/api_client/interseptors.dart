import 'dart:developer' as logg;
import 'package:dio/dio.dart';
import 'package:logger/logger.dart';

Dio dioClient(Dio dio) {
  dio = Dio(BaseOptions(
      connectTimeout: 100
  ));
  return addInterceptors(dio);
}

Dio addInterceptors(Dio dio) =>dio..interceptors.add(DioLoggingInterceptor());

class DioLoggingInterceptor extends Interceptor {

  logH(dynamic log)=>logg.log(log, name: "Header");
  logD(dynamic log)=>logg.log(log, name: "Data");
  logR(dynamic log)=>logg.log(log, name: "Response");
  logRq(dynamic log)=>logg.log(log, name: "Request");

  @override
  void onRequest(
      RequestOptions options,
      RequestInterceptorHandler handler,
      ) {
    return handler.next(options);
  }

  @override
  void onResponse(
      Response response,
      ResponseInterceptorHandler handler,
      ) {
    RequestOptions options = response.requestOptions;
    logRq("REQUEST:${options.method}");
    logR("StatusCode:${response.statusCode}");
    logR("StatusMessage:${response.statusMessage}");
    logRq("DataSend:${options.data}");
    logRq("Address:${options.baseUrl+options.path}");
    logRq("QueryParameters:${options.queryParameters}");
    logH("Headers:${options.headers.toString()}");
    logD("Data: ${response.data}");
    return handler.next(response);
  }

  @override
  void onError(
      DioError err,
      ErrorInterceptorHandler handler,
      ) {
    Logger logger = Logger();
    logger.d(err.error, err.type.name);
    logger.d(err.message, err.message);
    handler.next(err);
    // return handler.next(err);
  }

}