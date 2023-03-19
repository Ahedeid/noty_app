import 'package:flutter/material.dart';
import 'package:noty_app/utils/extnsions_validation.dart';
import 'package:provider/provider.dart';
import '../../Api/auth_api.dart';
import '../../provider/auth_provider.dart';
import '../../provider/userLoggedIn.dart';
import '../../routes/app_router.dart';
import '../../routes/screen_name.dart';
import '../../utils/colors_manger.dart';
import '../../utils/images_constant.dart';
import '../../utils/sizes_in_app.dart';
import '../widget/my_button.dart';
import '../widget/my_textFeild.dart';

class SignUpScreen extends StatefulWidget {
  SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();

  final TextEditingController _nameController = TextEditingController();

  savePref() async {
    if(_formKey.currentState!.validate()) {
      context.read<AuthProviderApi>().singUp(
          full_name: _nameController.text,
          email: _emailController.text,
          password: _passwordController.text);
    }
    // await Provider.of<AuthProvider>(context,listen: false).login(_emailController.text , _passwordController.text);
    // AppRouter.goToAndRemove(screenName: ScreenName.homeScreen);
    // AuthApi.signUpApi(email:_emailController.text,full_name: _nameController.text, password: _passwordController.text  );
  }

  @override
  Widget build(BuildContext context) {
    var midea = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SizedBox(height: midea.height * 0.1),
                const Text.rich(TextSpan(
                    text: 'Sign ',
                    style: TextStyle(
                        fontSize: AppSizes.sizeTextPrimary,
                        color: Color(AppColor.primaryTextColor)),
                    children: <InlineSpan>[
                      TextSpan(
                          text: 'Up',
                          style: TextStyle(
                            color: Color(AppColor.tealColor),
                          ))
                    ])),
                SizedBox(height: midea.height * 0.01),
                const Text(
                  'Create a new account!',
                  style: TextStyle(
                      fontSize: AppSizes.sizeSubText,
                      color: Color(AppColor.grayColor)),
                ),
                SizedBox(height: midea.height * 0.03),
                MyTextField(
                  controller: _nameController,
                  validator: (val) {
                    if (!val!.isValidName) return 'Enter valid Name';
                  },
                  hintText: 'full Name',
                  obscureText: false,
                  keyboardType: TextInputType.name,
                  icon: IconsConstant.profile,
                ),
                SizedBox(height: midea.height * 0.02),
                MyTextField(
                  controller: _emailController,
                  validator: (val) {
                    if (!val!.isValidEmail) return 'Enter valid email';
                  },
                  hintText: 'email@hotmail.com',
                  obscureText: false,
                  keyboardType: TextInputType.emailAddress,
                  icon: IconsConstant.email,
                ),
                SizedBox(height: midea.height * 0.02),
                MyTextField(
                  // validator: (val) {
                  //   if (!val!.isValidPhone) return 'Enter valid Phone';
                  // },
                  hintText: 'Phone number',
                  obscureText: false,
                  keyboardType: TextInputType.phone,
                  icon: '+ 99',
                ),
                SizedBox(height: midea.height * 0.02),
                MyTextField(
                  controller: _passwordController,
                  validator: (val) {
                    if (!val!.isValidPassword) return 'Enter valid Password';
                  },
                  hintText: 'Password',
                  obscureText: true,
                  keyboardType: TextInputType.visiblePassword,
                  icon: IconsConstant.lock,
                ),
                SizedBox(height: midea.height * 0.02),
                MyTextField(
                  validator: (val) {
                    if (!val!.isValidPassword) return 'Enter valid Password';
                  },
                  hintText: 'Confirm password',
                  obscureText: true,
                  keyboardType: TextInputType.visiblePassword,
                  icon: IconsConstant.lock,
                ),
                SizedBox(height: midea.height * 0.03),
                MyButton(
                    onPressed: () {
                      savePref();
                    },
                    title: 'Sign UP'),
                SizedBox(height: midea.height * 0.09),
                InkWell(
                  onTap: () => AppRouter.goToAndRemove(
                      screenName: ScreenName.signInScreen),
                  child: const Text.rich(
                    TextSpan(
                      text: 'Have an account?  ',
                      style: TextStyle(
                          fontSize: AppSizes.sizeTextMedium,
                          color: Color(AppColor.grayColor)),
                      children: <InlineSpan>[
                        TextSpan(
                          text: 'Log In',
                          style: TextStyle(
                            color: Color(AppColor.tealColor),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
