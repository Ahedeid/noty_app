import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../logic/provider/noty_provider.dart';
import '../../logic/provider/sheard_preferance/shared_pref.dart';
import '../../utils/colors_manger.dart';
import '../../utils/sizes_in_app.dart';
import 'my_button.dart';
import 'my_textFeild.dart';

class ContentOfBottomSheet extends StatefulWidget {
  ContentOfBottomSheet(
      {Key? key,
      required this.isEdit,
      this.noteText = '',
      this.index = 0,
      this.id = ''})
      : super(key: key);
  bool isEdit;

  final String noteText;
  int index;

  String id;

  @override
  State<ContentOfBottomSheet> createState() => _ContentOfBottomSheetState();
}

class _ContentOfBottomSheetState extends State<ContentOfBottomSheet> {
  final TextEditingController controller = TextEditingController();

  addNote() {
    context.read<NotyProvider>().createNote(
        token:
        SharedPrefController().getUser().token,
        title: controller.text);
  }

  @override
  void initState() {
    controller.text = widget.noteText;
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var midea = MediaQuery.of(context).size;
    return SizedBox(
      child: Padding(
        padding: EdgeInsets.only(
            left: 24,
            right: 24,
            top: 24,
            bottom: MediaQuery.of(context).viewInsets.bottom),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(widget.isEdit ? 'Edit Note' : ' Add Note',
                      style: const TextStyle(
                          fontSize: AppSizes.sizeTextEmptyNote,
                          color: Color(AppColor.grayColor))),
                  const Text(''),
                ],
              ),
              const SizedBox(height: 15),
              MyTextField(
                controller: controller,
                hintText: widget.isEdit ? 'Edit Note' : ' Add Note',
                obscureText: false,
                keyboardType: TextInputType.text,
                icon: '',
                vertical: 200,
                height: 200,
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(''),
                  Text(
                    '58/100',
                    style: TextStyle(color: Color(AppColor.grayColor)),
                  ),
                ],
              ),
              SizedBox(height: midea.height * 0.023),
              MyButton(
                isLoading: false,
                title: 'Save',
                onPressed: () {
                  widget.isEdit
                      ? context.read<NotyProvider>().editNote(
                          token:
                          SharedPrefController().getUser().token,
                          id: widget.id,
                          title: controller.text, index: widget.index)
                      : addNote();
                },
              ),
              const SizedBox(
                height: 20,
              )
            ],
          ),
        ),
      ),
    );
  }
}
