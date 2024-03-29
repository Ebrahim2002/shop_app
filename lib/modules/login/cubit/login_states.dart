import '../../../model/shop/shop_model.dart';

abstract class ShopLoginState{}
class ShopLoginInitialState extends ShopLoginState{}
class ShopLoginLoadingState extends ShopLoginState{}
class ShopLoginSuccessState extends ShopLoginState{
  final ShopLoginModel loginModel;
  ShopLoginSuccessState(this.loginModel);
}
class ShopLoginErrorState extends ShopLoginState{
  final String error;
  ShopLoginErrorState(this.error);
}
class ShopLoginChangePasswordVisibilityState extends ShopLoginState{}