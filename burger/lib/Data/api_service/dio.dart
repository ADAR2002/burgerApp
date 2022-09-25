import 'package:dio/dio.dart';

class DioHelper {
  static late Dio dio;

  static void init() {
    dio = Dio(
      BaseOptions(
          baseUrl: 'https://burgers1.p.rapidapi.com/',
          receiveDataWhenStatusError: true,
          headers: {
            'X-RapidAPI-Key':
                'a2f7a9b9d7msh433d38949b2f605p1664b2jsn1b901dc35b1d',
            'X-RapidAPI-Host': 'burgers1.p.rapidapi.com',
          }),
    );
  }

  Future<List<dynamic>> gatAllData() async {
    try {
      Response response = await dio.get('burgers');
      return response.data;
    } catch (error) {
      print(error.toString());
      return [];
    }
  }
}
