import 'package:flutter/material.dart';
import 'package:noty_app/provider/noty_provider.dart';
import 'package:provider/provider.dart';
import '../../provider/note_service.dart';
import '../../utils/colors_manger.dart';
import '../../utils/sizes_in_app.dart';
import 'my_button.dart';
import 'my_textFeild.dart';





class ContentOfBottomSheet extends StatefulWidget {
  ContentOfBottomSheet({Key? key,required this.isEdit,this.NoteText = '', this.index=0}) : super(key: key);
  bool isEdit ;
  final String NoteText;
  int index ;

  @override
  State<ContentOfBottomSheet> createState() => _ContentOfBottomSheetState();
}

class _ContentOfBottomSheetState extends State<ContentOfBottomSheet> {
  final TextEditingController controller = TextEditingController();
  addNote(){
    context.read<NotyProvider>().createNote(token: 'eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIzIiwianRpIjoiNWNhOTA0NDIyMGFlZDIzMDYzNzViYjViOGNmNDcyMmI3MDcwYTU3ZjYzNjg4OWRmY2U0M2Y1OTdhMjEyMTQ1M2NiODliMmZkMjA3ZTNmZDYiLCJpYXQiOjE2NzkxNTkxNjkuMzM3NzUzLCJuYmYiOjE2NzkxNTkxNjkuMzM3NzU4LCJleHAiOjE2ODA4ODcxNjkuMTgyNjUxLCJzdWIiOiIxNiIsInNjb3BlcyI6WyIqIl19.FNbuI2GoHbJK0bxOk5lrCPHuzJLx8Z21LkoWyMGnXJJml1XOEQi6aWjg_JgQ3BHp5N57pqxwjfs5HY2AOEvh_QRcINXd6HLILVtg6UocAyjkkgXfYXGelBpKxAuYFo6qzIE2ANexcKQN41OSvJ2hErjuTAkNrenBGlGSMGWvORA-AYvzz3xnuHWbLJ3pMsRd1B-AGp5bVW1oI85Br1avr5nYcmCTjshzXAXkRcUOMLYwUJNUVRluknJ-aax_Tv1qxno1Crzg0EZ_f_U2NqVqH1iK1wcWvL-kZIih0q-xkOoqaS0sLe35IXbWGpKvZ6BYAZeP2rBzd8OXowTtvSOVy45Y4eqiLl0OBtV8Np3beeDsQqMdmCisXjYXZDc9P2lLSi4XiogOq2_dUywtudUX2teZ-3tdN4vIFDMrZEit8irO9GjWR2vvOd3vdOcJDaW1Z9W5KRXqRaE2OMTinlIPbSR8034t_JMA8TwZg5TygTv1yH7Yj6AjJxWMjB5mrqGcDcWGW1YnC2nTP09L8IBM4Ejak-bcF54GPATK3ImhA1kSSXDeVskV3vdWvbNPfIJ0xssIzpJIH6Dn0qFKkQie7M1YCijy-cWsiPZodUdZrT1rEe3A6LWn-ZxOI0n7eIk0efLki33ulVFvUEqCKkqHlk0rZF9XVNYQ2qKKEef7jiI'
        , title: controller.text);
  }
  @override
  void initState() {
    controller.text = widget.NoteText;
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
        padding:  EdgeInsets.only(
            left: 24,right: 24,top: 24,
            bottom: MediaQuery.of(context).viewInsets.bottom),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children:  [
                  Text(
                      widget.isEdit ?'Edit Note':' Add Note',
                      style: const TextStyle(
                          fontSize: AppSizes.sizeTextEmptyNote,
                          color: Color(AppColor.grayColor))),
                  const Text(''),
                ],
              ),
              const SizedBox(height: 15),
              MyTextField(
                controller: controller,
                hintText:widget.isEdit ? 'Edit Note':' Add Note',
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
             //    widget.isEdit ?Provider.of<NoteService>(context, listen: false)
             //        .editNote(controller.text,widget.index)
             //        :Provider.of<NoteService>(context, listen: false)
             //         .addNote(controller.text);
                //  Navigator.pop(context);
                  addNote();
                },
              ),
              const SizedBox(height: 20,)
            ],
          ),
        ),
      ),
    );
  }
}