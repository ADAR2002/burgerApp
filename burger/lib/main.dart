import 'package:burger/Data/api_service/dio.dart';
import 'package:burger/Data/repositery/repositery.dart';
import 'package:burger/app_route.dart';
import 'package:burger/business_logic/cubit/burger_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  DioHelper.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<BurgerCubit>(
      create: (context) => BurgerCubit(Repositery(DioHelper()))..gatAllData(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        onGenerateRoute: AppRoute.route,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
      ),
    );
  }
}
