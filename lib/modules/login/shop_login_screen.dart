import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:shop_app/modules/login/cubit/login_cubit.dart';
import 'package:shop_app/modules/login/cubit/login_states.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../register/register_screen.dart';

class ShopLoginScreen extends StatelessWidget {

  var formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  ShopLoginScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) {
        return ShopLoginCubit();
      },
      child:BlocConsumer<ShopLoginCubit,ShopLoginState>(
          builder:  (context, state) {
            return Scaffold(
              appBar: AppBar(
              ),
              body:  Center(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Form(
                      key: formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'LOGIN',
                            style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                              color: Colors.black,
                              fontSize: 40,
                            ),
                          ),
                          Text(
                            'Login now to browse our hot offers',
                            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                              color: Colors.grey,
                            ),
                          ),
                          const SizedBox(height: 30),
                          TextFormField(
                            controller: emailController,
                            keyboardType: TextInputType.emailAddress,
                            cursorColor: Colors.blue,
                            decoration: InputDecoration(
                              border: const OutlineInputBorder(),
                              floatingLabelStyle: MaterialStateTextStyle.resolveWith((states) =>
                              states.contains(MaterialState.error)
                                  ? const TextStyle(
                                color: Colors.red,
                              )
                                  : const TextStyle(
                                color: Colors.blue,
                              )),
                              labelStyle: const TextStyle(
                                color: Colors.grey,
                              ),
                              prefixIconColor: MaterialStateColor.resolveWith((states) =>
                              states.contains(MaterialState.focused)
                                  ? Colors.blue
                                  : Colors.grey),
                              enabledBorder: const OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.grey,
                                ),
                              ),
                              focusedBorder: const OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.blue,
                                ),
                              ),
                              labelText: 'Email Address',
                              prefixIcon: const Icon(Icons.email_outlined),
                            ),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please enter your email address';
                              }else if(!value.contains('@')){
                                return 'Please enter a valid email address';
                              }else if(!value.contains('.')){
                                return 'Please enter a valid email address';
                              }else if(value.contains(' ')){
                                return 'Email must not contain spaces';
                              }
                              else if
                              (!RegExp(r'^[\w-.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
                                return 'Please enter a valid email address';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 15),
                          TextFormField(
                            controller: passwordController,
                            keyboardType: TextInputType.visiblePassword,
                            obscureText: ShopLoginCubit.get(context).isPasswordVisable,
                            cursorColor: Colors.blue,
                            decoration: InputDecoration(
                              floatingLabelStyle: MaterialStateTextStyle.resolveWith((states) =>
                              states.contains(MaterialState.error)
                                  ? const TextStyle(
                                color: Colors.red,
                              )
                                  : const TextStyle(
                                color: Colors.blue,
                              )),
                              labelStyle: const TextStyle(
                                color: Colors.grey,
                              ),
                              suffixIconColor: MaterialStateColor.resolveWith((states) =>
                              states.contains(MaterialState.focused)
                                  ? Colors.blue
                                  : Colors.grey),
                              prefixIconColor: MaterialStateColor.resolveWith((states) =>
                              states.contains(MaterialState.focused)
                                  ? Colors.blue
                                  : Colors.grey),
                              enabledBorder: const OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.grey,
                                ),
                              ),
                              focusedBorder: const OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.blue,
                                ),
                              ),
                              labelText: 'Password',
                              prefixIcon: const Icon(Icons.lock_outline),
                              suffixIcon: IconButton(
                                onPressed: () {
                                  // change password visibility
                                  ShopLoginCubit.get(context).changePasswordVisibility();
                                },
                                icon:ShopLoginCubit.get(context).suffixIcon,
                              ),
                              border: const OutlineInputBorder(),
                            ),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please enter your password';
                               }
                              //else if(value.length < 6){
                              //   return 'Password must be at least 6 characters';
                              // }else if(value.length > 20){
                              //   return 'Password must not exceed 20 characters';
                              // }else if(value.contains(' ')){
                              //   return 'Password must not contain spaces';
                              // }else if(!value.contains(RegExp(r'[A-Z]'))){
                              //   return 'Password must contain at least one capital letter';
                              // }else if(!value.contains(RegExp(r'[a-z]'))){
                              //   return 'Password must contain at least one small letter';
                              // } if(!value.contains(RegExp(r'[0-9]'))){
                              //   return 'Password must contain at least one number';
                              // }else if(!value.contains(RegExp(r'[!@#$%^&*()_,.?":{}|<>]'))){
                              //   return 'Password must contain at least one special character';
                              // }
                              return null;
                            },
                          ),
                          const SizedBox(height: 30),
                          Container(
                            color: Colors.blue,
                            height: 50,
                            width: MediaQuery.of(context).size.width,
                            child: MaterialButton(
                              height: 50,
                              onPressed: () {
                                // login
                                if (formKey.currentState!.validate()) {
                                  ShopLoginCubit.get(context).userLogin(
                                    email: emailController.text,
                                    password: passwordController.text,
                                  );
                                }
                              },
                              child: const Text(
                                'LOGIN',
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 15),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                'Don\'t have an account?',
                              ),
                              TextButton(
                                onPressed: () {
                                  // navigate to register screen
                                  Get.to(() => const RegisterScreen());
                                },
                                child: const Text(
                                  'REGISTER',
                                  style: TextStyle(
                                    color: Colors.blue,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
          listener: (context, state) {
            if (state is ShopLoginSuccessState) {
             if(state.loginModel.status == true){
               print(state.loginModel.message);
                print(state.loginModel.data?.token);
               Fluttertoast.showToast(
                 toastLength: Toast.LENGTH_LONG,
                 msg: state.loginModel.message.toString(),
                 gravity: ToastGravity.BOTTOM,
                 timeInSecForIosWeb: 5,
                 backgroundColor: Colors.green,
                 textColor: Colors.white,
                 fontSize: 16.0,
               );
             }
             else
                {
                  Fluttertoast.showToast(
                    msg: state.loginModel.message.toString(),
                    toastLength: Toast.LENGTH_LONG,
                    gravity: ToastGravity.BOTTOM,
                    timeInSecForIosWeb: 5,
                    backgroundColor: Colors.red,
                    textColor: Colors.white,
                    fontSize: 16.0,
                  );
                }
            }
          },
      ),
    );
  }
}
