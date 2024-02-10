import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:shop_app/modules/onboarding/onboarding_screen.dart';
import 'package:shop_app/network/remote/dio_helper.dart';
import 'package:shop_app/shared/observer.dart';
import 'package:shop_app/shared/shared_preferences.dart';

void main(){
  WidgetsFlutterBinding.ensureInitialized();
  CacheHelper.init();
  DioHelper.init();
  Bloc.observer = MyBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  GetMaterialApp(
      theme: ThemeData(
        textSelectionTheme: const TextSelectionThemeData(
          selectionHandleColor: Colors.blue,
        ),
        textTheme: const TextTheme(
          titleLarge: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            fontFamily: 'jannah',
          ),
        ),
      ),
      debugShowCheckedModeBanner: false,
      home:OnboardingScreen(),
    );
  }
}

