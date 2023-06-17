import 'package:flutter/material.dart';
import '../../utils/colors_manger.dart';
import '../../utils/sizes_in_app.dart';

class CustomButtonWidget extends StatelessWidget {
  CustomButtonWidget(
      {required this.title, this.onPressed, super.key, this.isLoading = false});

  void Function()? onPressed;
  final bool isLoading;
  String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 48,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          gradient: const LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [
                Color(AppColor.linearGradientColorB),
                Color(AppColor.linearGradientColorA),
              ])),
      child: ElevatedButton(
        onPressed: isLoading ? null : onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        child: isLoading
            ? const SizedBox(
                height: 25,
                width: 25,
                child: CircularProgressIndicator(
                  color: Color(AppColor.tealColor),
                ),
              )
            : Text(
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
