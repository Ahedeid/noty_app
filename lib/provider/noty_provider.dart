

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:noty_app/Api/constant/note_api.dart';
import 'package:noty_app/model/note_model.dart';

import '../Api/app_handelExeption.dart';
import '../utils/helper.dart';

class NotyProvider extends ChangeNotifier{

   List<NoteModel> noteList = [];
   bool iLoading = false;

   setLoading(bool isLoading){
     iLoading = isLoading;
     notifyListeners();
   }


   getAllNote({required String token})async{
     setLoading(true);
    try{
      final res = await NoteApi.getAllNote(token: token);
      if(res.statusCode == 200){
        final List note=res.data['data'];
         print(note.toString());
         for (var element in note) {
           noteList.add(NoteModel.fromJson(element));
     //      notifyListeners();
         }
            setLoading(false);
      }
    }  on DioError catch (e){
      final errorMessage = DioExceptions.fromDioError(e);
      UtilsConfig.showSnackBarMessage(message: errorMessage, status: false);
    }



  }







}