import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/core/network/end_points.dart';
import 'package:untitled/core/network/dio_helper.dart';
import 'package:untitled/models/home_product_model.dart';


part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeStateInitial()){
    getHeadLineData();
    getCategories();
  }

  List<String> categories = [];
  int selectedIndex = 0;


  Future<void>getHeadLineData()async{//Future-> to not be dynamic

    try{
      emit(HomeStateLoading());
      final Response response= await DioHelper.getRequest(endPoint: AppEndPoints.allProducts);
      //check response
      final products= response.data as List;//articles hold list {}
      // final data = products.map((item)=> AllProducts().fromJson(item),).toList();
      final data = products
          .map((item) => AllProducts.fromJson(item))
          .toList();

      print('Products loaded: $data');

      emit(HomeStateSuccess(data));

    }on DioException catch(e){
      print(e.message??"There Is an Error");
      emit(HomeStateFailure(e.message??""));
    }catch(e){
      print(e.toString()??"There Is an Error");
      emit(HomeStateFailure(e.toString()??""));
    }

  }

  Future<void> getCategories() async {
    try {
      final Response response =
      await DioHelper.getRequest(endPoint: AppEndPoints.categories);

      categories = List<String>.from(response.data);
    } catch (e) {
      print(e.toString());
    }
  }

  void changeCategory(int index) {
    selectedIndex = index;
    emit(HomeStateSuccess((state as HomeStateSuccess).model));
  }
}
