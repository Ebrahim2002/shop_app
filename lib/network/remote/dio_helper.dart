import 'package:dio/dio.dart';

class DioHelper{
  static late Dio dio;

  static init(){
    dio = Dio(
        BaseOptions(
          baseUrl:'https://student.valuxapps.com/api/',
          headers: {
            'Content-Type': 'application/json',
          },
          receiveDataWhenStatusError: true,
        )
    );
  }

  static Future<Response> postData(
      {
        required String url,
        required Map<String, dynamic> data,
        Map<String, dynamic>? query,
        String lang = 'ar',
        String? token,
      }
      ) async{
    dio.options.headers = {
      'lang': lang,
      'Authorization': token,
    };
    return await dio.post(
      url,
      data: data,
      queryParameters: query,
    );
  }


  // static Future<Response> getData() async{
  //     return await dio.get(
  //       '',
  //       queryParameters: {
  //         'q': 'flutter',
  //         'from': '2021-08-01',
  //         'sortBy': 'published
  //       },
  //     );
  //}
}