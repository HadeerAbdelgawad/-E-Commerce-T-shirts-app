part of 'auth_cubit.dart';

abstract class AuthState {}

 class AuthStateInitial extends AuthState {}


///login states
 class LoginStateInitial extends AuthState {}
 class LoginStateLoading extends AuthState {}
 class LoginStateSuccess extends AuthState {}
 class LoginStateFailure extends AuthState {
  final String errMsg;
  LoginStateFailure(this.errMsg);
 }


///signup states
class SignUpStateInitial extends AuthState {}
class SignUpStateLoading extends AuthState {}
class SignUpStateSuccess extends AuthState {}
class SignUpStateFailure extends AuthState {
  final String errMsg;
  SignUpStateFailure(this.errMsg);
}
