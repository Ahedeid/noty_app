import 'package:dio/dio.dart';
import 'package:noty_app/Api/base_client.dart';
import 'package:noty_app/api/constant/end_point_api.dart';

class NoteApi {
  static  Future<Response> getAllNote({required String token}) {
    try {
      return BaseClient().get('${EndPoints.baseUrl}/categories');
    } catch (e) {
      rethrow;
    }
  }
}
