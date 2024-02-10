import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:shop_app/modules/login/cubit/login_states.dart';
import 'package:shop_app/network/endpoints/endpoints.dart';
import 'package:shop_app/network/remote/dio_helper.dart';

import '../../../model/shop/shop_model.dart';

class ShopLoginCubit extends Cubit<ShopLoginState> {
  ShopLoginCubit() : super(ShopLoginInitialState());
  static ShopLoginCubit get(context) => BlocProvider.of(context);
  late ShopLoginModel loginModel;
  bool isPasswordVisable = true;
  Icon suffixIcon = const Icon(
    Icons.visibility,
  );

  void changePasswordVisibility() {
    isPasswordVisable = !isPasswordVisable;
    suffixIcon = isPasswordVisable ? const Icon(Icons.visibility,)
        : const Icon(Icons.visibility_off,color: Colors.blue,);
    emit(ShopLoginChangePasswordVisibilityState());
  }

  void userLogin({required String email,required String password}){
    emit(ShopLoginLoadingState());
    DioHelper.postData(
        url: login,
        data: {
          'email': email,
          'password': password,
        },
    ).then((value){
          //print(value.data);
          // ShopLoginModel model = ShopLoginModel.fromJson(value.data);
          // print(model.status);
          loginModel = ShopLoginModel.fromJson(value.data);
          // print(loginModel.status);
          // print(loginModel.message);
          // print(loginModel.data?.token);
          // print(loginModel.data?.name);
          emit(ShopLoginSuccessState(loginModel));
          }
    ).catchError((error){
      print(error.toString());
      emit(ShopLoginErrorState(error.toString()));
    });
  }
}