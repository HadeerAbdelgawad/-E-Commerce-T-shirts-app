part of 'home_cubit.dart';

abstract class HomeState {}



///home states
class HomeStateInitial extends HomeState {}
class HomeStateLoading extends HomeState {}
class HomeStateSuccess extends HomeState {
  final List<AllProducts> model;
  HomeStateSuccess(this.model);
}
class HomeStateFailure extends HomeState {
  final String errMsg;
  HomeStateFailure(this.errMsg);
}



///gategory states

class CategoriesLoading extends HomeState {}

class CategoriesSuccess extends HomeState {
  final List<String> categories;

  CategoriesSuccess(this.categories);
}

class CategoriesFailure extends HomeState {
  final String error;
  CategoriesFailure(this.error);
}