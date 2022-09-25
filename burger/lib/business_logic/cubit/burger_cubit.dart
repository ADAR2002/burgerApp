import 'package:burger/Data/model/burger_model.dart';
import 'package:burger/Data/repositery/repositery.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'burger_state.dart';

class BurgerCubit extends Cubit<BurgerState> {
  final Repositery repositery;
  static getCubit(context) => BlocProvider.of<BurgerCubit>(context);
  BurgerCubit(this.repositery) : super(BurgerInitial());
  List<Burger> burgers = [];
  gatAllData() {
    emit(BurgerLoading());
    repositery.getAllData().then((value) {
      burgers = value;
      //  print(burgers[0].name.toString());
      emit(BurgerSuccess());
    }).catchError((error) {
      print(error.toString());
      emit(BurgerError());
    });
  }

  List<String> img = [
    "assets/1.jpg",
    "assets/2.jpg",
    "assets/3.jpg",
    "assets/4.jpg",
  ];
  int i = 0;
  String image = "assets/1.jpg";
  pickImage(int index) {
    i = index;
    image = img[i];

    emit(PickImage());
  }
}
