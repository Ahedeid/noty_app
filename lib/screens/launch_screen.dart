import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/auth_provider.dart';
import '../provider/sheard_preferance/shared_pref.dart';
import '../provider/userLoggedIn.dart';
import '../routes/app_router.dart';
import '../routes/screen_name.dart';
import '../utils/images_constant.dart';
import '../utils/sizes_in_app.dart';

class LaunchScreen extends StatefulWidget {
  const LaunchScreen({super.key});


  @override
  State<LaunchScreen> createState() => _LaunchScreenState();
}

class _LaunchScreenState extends State<LaunchScreen> {

  @override
  Widget build(BuildContext context) {
    final isLoggedIn =
        SharedPrefController().getLogedin();
    print('$isLoggedIn');

    Future.delayed(
        const Duration(seconds: 3),
            () => AppRouter.goToAndRemove(screenName:isLoggedIn?ScreenName.homeScreen:ScreenName.signInScreen)
    );
    return Scaffold(
      body: Center(
        child: Image.asset(ImageConstant.logo, height: AppSizes.logoSizeLaunch),
      ),
    );
  }
}
