import 'package:flutter/material.dart';
import 'package:noty_app/logic/provider/noty_provider.dart';
import 'package:noty_app/logic/provider/sheard_preferance/shared_pref.dart';
import 'package:noty_app/screens/widget/card_note.dart';
import 'package:noty_app/screens/widget/floatingWidget.dart';
import 'package:noty_app/screens/widget/sheared_appbar.dart';
import 'package:noty_app/utils/colors_manger.dart';
import 'package:noty_app/utils/images_constant.dart';
import 'package:noty_app/utils/sizes_in_app.dart';
import 'package:noty_app/utils/strings_in_app.dart';
import 'package:provider/provider.dart';

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
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      context
          .read<NotyProvider>()
          .getAllNote(token: SharedPrefController().getUser().token);
    });
    // Future.delayed( Duration.zero,() => context.read<NotyProvider>().getAllNote(token: SharedPrefController().getUser().token),);
    // Future.microtask(
    //   () => context
    //       .read<NotyProvider>()
    //       .getAllNote(token: SharedPrefController().getUser().token),
    // );
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
