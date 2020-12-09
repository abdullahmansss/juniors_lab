import 'package:dio/dio.dart';

class DioHelper
{
  static Dio dio;

  DioHelper()
  {
    dio = Dio(
      BaseOptions(
        baseUrl: 'http://softagic.wwwnl1-ss19.a2hosted.com/',
        headers: {
          'Accept':'application/json',
        },
      ),
    );
  }

  static Future<Response> postData({path, data}) async
  {
    return await dio.post(
      path,
      data: data,
    );
  }
}