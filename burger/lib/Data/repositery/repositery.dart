import 'package:burger/Data/api_service/dio.dart';
import 'package:burger/Data/model/burger_model.dart';

class Repositery {
  final DioHelper dioHelper;

  Repositery(this.dioHelper);

  Future<List<Burger>> getAllData() async {
    try {
      final burger = await dioHelper.gatAllData();
      print(burger.length);
      List<Burger> burgers = [];
      for (var element in burger) {
        burgers.add(Burger.fromJson(element));
      }
      return burgers;
    } catch (error) {
      print(error.toString());
      return [];
    }
  }
}
