import 'package:dio/dio.dart';
import 'package:noty_app/Api/base_client.dart';
import 'package:noty_app/api/constant/end_point_api.dart';

class NoteApi {
  static Future<Response> getAllNote({required String token}) {
    try {
      return BaseClient().get('${EndPoints.baseUrl}/tasks',
          options: Options(headers: {"Authorization": "Bearer $token"}));
    } catch (e) {
      rethrow;
    }
  }

  static Future addNote({required String token, dynamic data}) {
    try {
      return BaseClient().post('${EndPoints.baseUrl}/tasks',
          data: data,
          options: Options(headers: {"Authorization": "Bearer $token"}));
    } catch (e) {
      rethrow;
    }
  }

  static Future deleteNote({required String token,required String id}) {
    try {
      return BaseClient().delete(
          '${EndPoints.baseUrl}/tasks/$id',

          options: Options(headers: {"Authorization": "Bearer $token"})
      );
    } catch (e) {
      rethrow;
    }
  }





}
