import 'package:dio/dio.dart';
import 'package:noty_app/provider/sheard_preferance/shared_pref.dart';

import '../../api/auth_api.dart';
import 'package:flutter/material.dart';

import '../Api/app_handelExeption.dart';
import '../model/user_response.dart';
import '../routes/app_router.dart';
import '../routes/screen_name.dart';
import '../utils/helper.dart';

class AuthProviderApi extends ChangeNotifier {
  bool isLoading = false;

  void setLoading(bool value) {
    isLoading = value;
    notifyListeners();
  }

  login({required String email,required String password,}) async {
    setLoading(true);
    try {
      final response = await AuthApi.logIn(
        email: email, password: password,
      );
      if (response.statusCode == 200) {
        print(response.data["object"].toString());
        SharedPrefController().save(UserModel.formJson(response.data["object"]));

        UtilsConfig.showSnackBarMessage(
            message: 'Login Successfully', status: true);
        AppRouter.goToAndRemove(screenName: ScreenName.homeScreen,);
        UtilsConfig.showSnackBarMessage(message: 'Welcome to App!', status: true);
      }
      setLoading(false);
    } on DioError catch (e) {
      setLoading(false);
      final errorMessage = DioExceptions.fromDioError(e);
      UtilsConfig.showSnackBarMessage(message: errorMessage, status: false);
    }
  }

  singUp({required String full_name, required String email,required String password}) async {
    setLoading(true);
    try {
      final response = await AuthApi.singUp(
        full_name: full_name,
        email: email,
        password: password,

      );
      if (response.statusCode == 201) {
        UtilsConfig.showSnackBarMessage(
            message: 'SingUp Successfully', status: true);
        AppRouter.goTo( screenName: ScreenName.signInScreen,);
      }
      setLoading(false);
    } on DioError catch (e) {
      setLoading(false);
      final errorMessage = DioExceptions.fromDioError(e);
      UtilsConfig.showSnackBarMessage(message: errorMessage, status: false);
    }
  }
}
