import 'package:flutter/material.dart';
import 'package:noty_app/screens/widget/BottomSheet.dart';
import 'package:noty_app/screens/widget/sheared_appbar.dart';
import 'package:provider/provider.dart';
import '../logic/model/note_model.dart';
import '../logic/provider/noty_provider.dart';
import '../logic/provider/sheard_preferance/shared_pref.dart';
import '../utils/colors_manger.dart';
import '../utils/images_constant.dart';
import '../utils/sizes_in_app.dart';
import '../utils/strings_in_app.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // Future.delayed(const Duration(seconds:1),() => context.read<NotyProvider>().getAllNote(token: ''),);
    Future.microtask(
      () => context
          .read<NotyProvider>()
          .getAllNote(token: SharedPrefController().getUser().token),
    );
  }

  @override
  Widget build(BuildContext context) {
    DateTime today = DateTime.now();
    String dateStr =
        "${today.day}-${today.month}-${today.year} -/ ${today.hour}.${today.second}";
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: const ShearedAppBar(),
      body: context.watch<NotyProvider>().iLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : context.watch<NotyProvider>().noteList.isEmpty
              ? Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: AppSizes.paddingHorizontal),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(ImageConstant.emptyImage),
                      const SizedBox(height: 5),
                      const Text(
                        AppStrings.emptyText,
                        style: TextStyle(
                          fontSize: AppSizes.sizeTextEmptyNote,
                          color: Color(AppColor.primaryTextColor),
                        ),
                      ),
                    ],
                  ),
                )
              : Consumer<NotyProvider>(
                  builder: (context, note, child) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 24, vertical: 10),
                      child: ListView(
                        children: [
                          Text(
                            dateStr,
                            style: const TextStyle(
                              color: Color(AppColor.grayColor),
                            ),
                          ),
                          const SizedBox(height: 10),
                          ListView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: note.noteList.length,
                              itemBuilder: (context, index) {
                                final itemsKey =
                                    note.noteList[index].toString();
                                final items = note.noteList[index];
                                return NoteCard(
                                  index: index,
                                  noteText: items.title,
                                  item: itemsKey,
                                  noteShow: items,
                                  onDismissed: (direction) {
                                    // note.removeItem(index);
                                    // note.removeItemFav(index);
                                  },
                                );
                              }),
                        ],
                      ),
                    );
                  },
                ),
      floatingActionButton: const Padding(
        padding: EdgeInsets.only(bottom: 10),
        child: MyFloating(),
      ),
    );
  }
}

class NoteCard extends StatelessWidget {
  NoteCard(
      {super.key,
      required this.item,
      required this.noteShow,
      this.onDismissed,
      this.onTapFav,
      this.isFav,
      required this.noteText,
      this.index = 0});

  final NoteModel noteShow;
  String noteText;

  void Function(DismissDirection)? onDismissed;
  final String item;
  void Function()? onTapFav;
  bool? isFav;
  int index;

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      onDismissed: onDismissed,
      confirmDismiss: (DismissDirection direction) async {
        if (direction == DismissDirection.endToStart) {
          return await showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                shape: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                backgroundColor: const Color(AppColor.backGroundBottomSheet),
                title: const Text(
                  'Confirm',
                  style: TextStyle(
                    color: Color(AppColor.tealColor),
                  ),
                ),
                content: const Text(
                  'Are you sure you wish to delete this note?',
                  style: TextStyle(
                    color: Color(AppColor.primaryTextColor),
                  ),
                ),
                actions: [
                  ElevatedButton(
                    style:
                        ElevatedButton.styleFrom(backgroundColor: Colors.red),
                    onPressed: () => Navigator.of(context).pop(false),
                    child: const Text('CANCEL'),
                  ),
                  Consumer<NotyProvider>(
                    builder: (context, value, child) => ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(AppColor.tealColor),
                      ),
                      onPressed: () {
                        value.deleteNote(
                            token:
                                'eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIzIiwianRpIjoiNWNhOTA0NDIyMGFlZDIzMDYzNzViYjViOGNmNDcyMmI3MDcwYTU3ZjYzNjg4OWRmY2U0M2Y1OTdhMjEyMTQ1M2NiODliMmZkMjA3ZTNmZDYiLCJpYXQiOjE2NzkxNTkxNjkuMzM3NzUzLCJuYmYiOjE2NzkxNTkxNjkuMzM3NzU4LCJleHAiOjE2ODA4ODcxNjkuMTgyNjUxLCJzdWIiOiIxNiIsInNjb3BlcyI6WyIqIl19.FNbuI2GoHbJK0bxOk5lrCPHuzJLx8Z21LkoWyMGnXJJml1XOEQi6aWjg_JgQ3BHp5N57pqxwjfs5HY2AOEvh_QRcINXd6HLILVtg6UocAyjkkgXfYXGelBpKxAuYFo6qzIE2ANexcKQN41OSvJ2hErjuTAkNrenBGlGSMGWvORA-AYvzz3xnuHWbLJ3pMsRd1B-AGp5bVW1oI85Br1avr5nYcmCTjshzXAXkRcUOMLYwUJNUVRluknJ-aax_Tv1qxno1Crzg0EZ_f_U2NqVqH1iK1wcWvL-kZIih0q-xkOoqaS0sLe35IXbWGpKvZ6BYAZeP2rBzd8OXowTtvSOVy45Y4eqiLl0OBtV8Np3beeDsQqMdmCisXjYXZDc9P2lLSi4XiogOq2_dUywtudUX2teZ-3tdN4vIFDMrZEit8irO9GjWR2vvOd3vdOcJDaW1Z9W5KRXqRaE2OMTinlIPbSR8034t_JMA8TwZg5TygTv1yH7Yj6AjJxWMjB5mrqGcDcWGW1YnC2nTP09L8IBM4Ejak-bcF54GPATK3ImhA1kSSXDeVskV3vdWvbNPfIJ0xssIzpJIH6Dn0qFKkQie7M1YCijy-cWsiPZodUdZrT1rEe3A6LWn-ZxOI0n7eIk0efLki33ulVFvUEqCKkqHlk0rZF9XVNYQ2qKKEef7jiI',
                            id: value.noteList[index].id);
                        //  Navigator.of(context).pop(true);
                      },
                      child: value.iLoading
                          ? const Center(
                              child: CircularProgressIndicator(),
                            )
                          : const Text('DELETE'),
                    ),
                  ),
                ],
              );
            },
          );
        } else {
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
              isEdit: true,
              noteText: noteText,
              index: index,
              id: context.read<NotyProvider>().noteList[index].id,
            ),
          );
        }
      },
      key: Key(item),
      background: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.blue,
        ),
        child: const Icon(Icons.edit),
      ),
      secondaryBackground: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15), color: Colors.red),
        child: const Icon(Icons.delete),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 20),
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            gradient: const LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [
                Color(AppColor.linearGradientColorB),
                Color(AppColor.linearGradientColorA)
              ],
            ),
          ),
          child: Center(
            child: ListTile(
              trailing: InkWell(
                onTap: onTapFav,
                child: Container(
                  width: 40,
                  height: 40,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color(AppColor.backGroundSearchIconColor),
                  ),
                  child: Icon(
                    isFav == true ? Icons.favorite : Icons.favorite_border,
                    color: const Color(AppColor.tealColor),
                  ),
                ),
              ),
              title: Text(
                noteShow.title,
                style: const TextStyle(fontSize: 25, color: Colors.white),
              ),
              subtitle: Text(noteShow.created_at),
            ),
          ),
        ),
      ),
    );
  }
}

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
