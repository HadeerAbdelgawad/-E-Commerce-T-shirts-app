import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/core/network/dio_helper.dart';
import 'package:untitled/core/network/end_points.dart';
import 'package:untitled/core/resources/cache_helper.dart';
import 'package:untitled/models/user_model.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthStateInitial());
  TextEditingController userNameControl= TextEditingController();
  TextEditingController passwordControl= TextEditingController();
  TextEditingController confirmPasswordControl= TextEditingController();
  TextEditingController emailControl= TextEditingController();




  Future<void>login()async{
    try{
      emit(LoginStateLoading());
      final Response response= await DioHelper.postRequest(endPoint: AppEndPoints.login,
      data:{
        "username": userNameControl.text,
        // userNameControl.text,
        "password":passwordControl.text
          // passwordControl.text
      });

      if(response.statusCode==200||response.statusCode==201){
        UserModel model= UserModel.fromJson(response.data);
        if(model.token!=null){
          await CacheHelper.saveToken(model.token!);
        }
        else{
          emit(LoginStateFailure("No Token Found || User doesn't exist"));
        }
        emit(LoginStateSuccess());

      }else {//statusCode!=200
          emit(LoginStateFailure(response.data.toString()));
      }

    }on DioException catch(e){
      emit(LoginStateFailure(e.message??""));
    }catch(e){
      emit(LoginStateFailure(e.toString()));

    }
  }

  Future<void>signup()async{
    try{
      emit(SignUpStateLoading());
      final Response response= await DioHelper.postRequest(endPoint: AppEndPoints.signup,
          data:{
            "id": 0,
            "username": userNameControl.text,
            // userNameControl.text,
            "email": emailControl.text,
            "password":passwordControl.text
            // passwordControl.text

          });

      if(response.statusCode==200||response.statusCode==201) {
        if (passwordControl.text != confirmPasswordControl.text) {
          emit(SignUpStateFailure("Passwords do not match"));
          return;
        }
        emit(SignUpStateSuccess());
      }else{
        emit(SignUpStateFailure("Signup failed"));
      }

    }on DioException catch(e){
      emit(SignUpStateFailure(e.message??"Signup error"));
    }catch(e){
      emit(SignUpStateFailure(e.toString()));

    }
  }



}