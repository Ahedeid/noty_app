import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:noty_app/Api/note_api.dart';
import '../../Api/app_handelExeption.dart';
import '../../routes/app_router.dart';
import '../../utils/helper.dart';
import '../model/note_model.dart';

class NotyProvider extends ChangeNotifier {
  List<NoteModel> noteList = [];
  bool iLoading = false;

  setLoading(bool isLoading) {
    iLoading = isLoading;
    notifyListeners();
  }

  getAllNote({required String token}) async {
    setLoading(true);
    try {
      final res = await NoteApi.getAllNote(token: token);
      if (res.statusCode == 200) {
        final List note = res.data['data'];

        noteList = note.map((e) => NoteModel.fromJson(e)).toList();
        // for (var element in note) {
        //   noteList.add(NoteModel.fromJson(element));
        //   //      notifyListeners();
        // }
        noteList = noteList.reversed.toList();
        setLoading(false);
      }
    } on DioError catch (e) {
      print(e.toString());
      final errorMessage = DioExceptions.fromDioError(e);
      UtilsConfig.showSnackBarMessage(message: errorMessage, status: false);
    }
  }

  createNote({required String token, required String title}) async {
    setLoading(true);
    try {
      FormData formData = FormData.fromMap({
        "title": title,
      });
      final res = await NoteApi.addNote(token: token, data: formData);
      if (res.statusCode == 201) {
           getAllNote(token: token);
        UtilsConfig.showSnackBarMessage(
          message: "add successfully",
          status: true,
        );
        AppRouter.back();
      }
    } on DioError catch (e) {
      print(e.toString());
      final errorMessage = DioExceptions.fromDioError(e);
      UtilsConfig.showSnackBarMessage(message: errorMessage, status: false);
    }
  }

  deleteNote({required String token, required String id}) async {
    setLoading(true);
    try {
      final res = await NoteApi.deleteNote(token: token, id: id);
      if (res.statusCode == 200) {
        UtilsConfig.showSnackBarMessage(
            message: res.data["message"], status: false);
        getAllNote(token: token);
      }
    } on DioError catch (e) {
      print(e.toString());
      final errorMessage = DioExceptions.fromDioError(e);
      UtilsConfig.showSnackBarMessage(message: errorMessage, status: true);
    }
    setLoading(false);
    AppRouter.back();
  }

  editNote(
      {required String token,
      required String id,
      required String title,
      required int index}) async {
    setLoading(true);
    try {
      final res = await NoteApi.editNote(token: token, id: id, title: title);
      if (res.statusCode == 200) {
        noteList[index].title = title;
        UtilsConfig.showSnackBarMessage(
            message: res.data["message"], status: true);
        // getAllNote(token: token);
      }
      AppRouter.back();
    } on DioError catch (e) {
      print(e.toString());
      final errorMessage = DioExceptions.fromDioError(e);
      UtilsConfig.showSnackBarMessage(message: errorMessage, status: false);
    }
    setLoading(false);
  }
}
