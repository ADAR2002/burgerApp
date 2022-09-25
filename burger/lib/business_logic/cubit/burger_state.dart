part of 'burger_cubit.dart';

abstract class BurgerState {}

class BurgerInitial extends BurgerState {}

class BurgerLoading extends BurgerState {}

class BurgerSuccess extends BurgerState {}

class BurgerError extends BurgerState {}

class PickImage extends BurgerState {}
