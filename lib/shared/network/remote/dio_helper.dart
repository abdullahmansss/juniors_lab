import 'package:courses/shared/components/components.dart';
import 'package:dio/dio.dart';

class DioHelper
{
  static Dio dio;

  DioHelper()
  {
    dio = Dio(
      BaseOptions(
        baseUrl: 'http://softagic.wwwnl1-ss19.a2hosted.com/',
        headers:
        {
          'Accept':'application/json',
        },
      ),
    );
  }

  static Future<Response> postData({path, data, token, query}) async
  {
    if(token != null)
    {
      dio.options.headers =
      {
        'Authorization' : 'Bearer $token',
      };
    }

    return await dio.post(
      path,
      data: data??null,
      queryParameters: query??null,
    );
  }
}