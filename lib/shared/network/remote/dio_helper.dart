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

  static Future<Response> postNotification({path, data}) async
  {
    dio.options.baseUrl = 'https://fcm.googleapis.com/';

    dio.options.headers =
    {
      'Content-Type':'application/json',
      'Authorization' : 'key=AAAAg2HS_IU:APA91bEBn1z7YIrLpl3saJayn2pL-cDvblvY4aMiwhwVh2d9x6hoz-Ra6nvIUlYStSJhE1spRM_WCDbcjlWD_XiqHqjoJLyNZuZzL1Zci0WQj7ncMUHDzhxWk09TiFg7aHUlt1l1VsB9',
    };

    return await dio.post(
      path,
      data: data??null,
    );
  }
}