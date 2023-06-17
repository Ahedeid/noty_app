import 'package:flutter/material.dart';
import 'package:noty_app/screens/widget/BottomSheet.dart';
import 'package:noty_app/utils/colors_manger.dart';



class MyFloating extends StatelessWidget {
  const MyFloating({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 65,
      width: 65,
      child: FloatingActionButton(
        backgroundColor: const Color(AppColor.floatingColor),
        child: const Icon(
          Icons.add,
          color: Colors.white,
          size: 30,
        ),
        onPressed: () {
          showModalBottomSheet(
            shape: const OutlineInputBorder(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15),
                topRight: Radius.circular(15),
              ),
            ),
            backgroundColor: const Color(AppColor.backGroundBottomSheet),
            context: context,
            isScrollControlled: true,
            builder: (context) => ContentOfBottomSheet(
              isEdit: false,
            ),
          );
        },
      ),
    );
  }
}
