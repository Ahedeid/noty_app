
import 'package:dio/dio.dart';

import 'base_client.dart';
import 'constant/end_point_api.dart';


class AuthApi {
  static Future<Response> logIn({
    required String email,
    required String password
  }) async {
    try {
      return await BaseClient().post(
        EndPoints.loginEndPoint,
        data: {
          'email': email,
         'password': password,
        },
      );
    } catch (e) {
      rethrow;
    }
  }

  static Future<Response> singUp({
    required String full_name,
    required String email,
    required String password,
  }) async {
    try {
      return await BaseClient().post(
        EndPoints.signUpEndPoint,
        data: {
          "email": email,
          "full_name": full_name,
          "password": password,
          "gender": "M"
        },
      );
    } catch (e) {
      rethrow;
    }
  }
}
































// import 'package:dio/dio.dart';
// import 'package:noty_app/Api/constant/end_point_api.dart';
//
// import 'dio_client.dart';
//
// class AuthApi {
//   static String url = Endpoints.baseUrl;
//
//   static Future<Response> loginApi(String email, String password) async {
//     try {
//       print('sucsses');
//       return await Dio().post(url + Endpoints.loginEndPoint, data: {
//         'email': email,
//         'password': password,
//       });
//     } catch (e) {
//       rethrow;
//     }
//   }
//
// static signUpApi(
//   //     {
//   //   required String email,
//   //   required String password,
//   //   required String full_name,
//   // }
//   ) async {
//     try {
//
//       var response= await Dio().post(Endpoints.baseUrl, data: {
//        "full_name":"wowowowowo",
//         "email":"mmm@gg.commm",
//         "password":"123123123",
//         "gender":"M"
//       });
//       print(response.data);
//
//     }  catch (e) {
//       print('eeeeeeeee');
//       print('respneeeeee ${e.toString()}');
//
//     }
//   }
// }
//
//
// // class UserApi {
// //   final DioClient dioClient;
// //
// //   UserApi({required this.dioClient});
// //
// //   Future<Response> addUserApi(String name, String job) async {
// //     try {
// //       final Response response = await dioClient.post(
// //         Endpoints.loginEndPoint,
// //         data: {
// //           'name': name,
// //           'job': job,
// //         },
// //       );
// //       return response;
// //     } catch (e) {
// //       rethrow;
// //     }
// //   }
// //
// //   Future<Response> getUsersApi() async {
// //     try {
// //       final Response response = await dioClient.get(Endpoints.users);
// //       return response;
// //     } catch (e) {
// //       rethrow;
// //     }
// //   }
// //
// //   Future<Response> updateUserApi(int id, String name, String job) async {
// //     try {
// //       final Response response = await dioClient.put(
// //         Endpoints.users + '/$id',
// //         data: {
// //           'name': name,
// //           'job': job,
// //         },
// //       );
// //       return response;
// //     } catch (e) {
// //       rethrow;
// //     }
// //   }
// //
// //   Future<void> deleteUserApi(int id) async {
// //     try {
// //       await dioClient.delete(Endpoints.users + '/$id');
// //     } catch (e) {
// //       rethrow;
// //     }
// //   }
// // }
