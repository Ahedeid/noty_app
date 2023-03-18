import 'package:flutter/material.dart';
import '../../utils/colors_manger.dart';
import '../../utils/sizes_in_app.dart';



class MyButton extends StatelessWidget {
  MyButton({
   required this.title,
    this.onPressed,
    super.key,
    this.isLoading = false
  });
  void Function()? onPressed;
  final bool isLoading;
  String title;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 48,
      decoration:  BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          gradient: const LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [
                Color(AppColor.linearGradientColorB),
                Color(AppColor.linearGradientColorA),
              ]
          )
      ),
      child: ElevatedButton(
        onPressed: isLoading ? null : onPressed ,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        child: isLoading
            ? const CircularProgressIndicator(
          color: Colors.white,
        )
            :  Text(
          title,
          style: const TextStyle(
            fontSize: AppSizes.sizeTextMedium,
            color: Color(AppColor.primaryTextColor),
          ),
        ),
      ),
    );
  }
}