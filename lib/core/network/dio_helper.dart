import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:untitled/core/network/end_points.dart';

class DioHelper {//بدل م انادى ال  api كل مره

  //instance dio
  //initialize Type: In word 'initiaize'
  //methods

  static Dio?dio;
  static initDio(){
    dio ??=Dio(
      BaseOptions(
        receiveDataWhenStatusError: true,
        baseUrl: AppEndPoints.baseUrl,

      )
    );

    dio!.interceptors.add(PrettyDioLogger());//interceptors in dio -> open server

  }

  //methods
  static Future<Response> getRequest({required String endPoint})async{
    try{
      Response response= await dio!.get(endPoint);
      return response;
    }catch(e){
      rethrow;
    }
  }

  static Future<Response> postRequest({required String endPoint,
  required Map<String, dynamic>?data})async{
    try{
      Response response= await dio!.post(endPoint,data: data);
      return response;
    }catch(e){
      rethrow;
    }
  }
}