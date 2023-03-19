class UserModel {
  int id;
  String full_name;
  String email;
  String gender;
  String token;
  bool is_active;

  UserModel(
      {required this.id,
      required this.email,
      required this.full_name,
      required this.gender,
      required this.is_active,
      required this.token});

  factory UserModel.formJson(Map<String, dynamic> parseJson) {
    return UserModel(
        id: parseJson['id'],
        email: parseJson['email'],
        full_name: parseJson['full_name'],
        gender: parseJson['gender'],
        is_active: parseJson['is_active'],
        token: parseJson['token']);
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "full_name": full_name,
      "email": email,
      "gender": gender,
      "token": token,
      "is_active": is_active
    };
  }
}

// void main() {
//   String jsonFormate = '''{
//         "id": 16,
//         "full_name": "Flutter User",
//         "email": "flutter@api.com",
//         "gender": "M",
//         "verification_code": null,
//         "fcm_token": null,
//         "token": "eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIzIiwianRpIjoiMWVlNDBiMWJhM2E0ZWE2MGVkNGNlOGEwNzllZWQ3MGFhNzFkMzk1MjM4ZTcyOTc1YWVmYzgyYWVjZDAzMGVmYWVmNjQxODMxZjI0YmI4ODMiLCJpYXQiOjE2Nzg1NTUxNTEuMTcyODIyLCJuYmYiOjE2Nzg1NTUxNTEuMTcyODI5LCJleHAiOjE2ODAyODMxNTEuMDI2MDcsInN1YiI6IjE2Iiwic2NvcGVzIjpbIioiXX0.c5GeROyo3MOBuRBCQZ7rXmNiJd8Xpe3WXOF4kYJDJhCmv-YCqAqMNUFxbq11gEOB4RdW0XI5Y0RiAPI_AGC_eqVQS8_3tXT9dGDE3hS4e9IBK6NhKBsRhcyoDW336MaFPMevAWXj09BdaalQizsmmPM3Hr48a_2OwSDvULoE8jtH936rvKEnNrCdwIP6Q-rayNwuB8lGmxb0ysc3Xbcd1-0lhmAyILqYY6tcu6soH8hGykpuKB_C9Sg3GxfCTtUdTT_UChgN18c-2jlu9Ee0J59nRAA-MCwHSQ4dVd2mD1nKbilSJd6m_2vKpGytGyuvNis6WmW8AXP0aVNhIv419fklABed6ZaxACrSHBtLZnZTGF8_SkG_uqELTjr__5OsczPa353APiC4IRKAMZXuJOwE7zZm4HOeaJvF6U6ivFYLQH_luHtk0B0wPC82bM5_STUJoN6ae3oG2rvJj5Ry1b3239Goh2gB47TY9UvWyl-pUvezgY_9lN2tRYT4hQez4Wzdp4a_o2sp0aoJ-_P9Y4NLUSpnz8gkV7T1hf7j0cFzC0Bu6qbZdtVcrMibrgpCiWyrzFrmJOB4kDVTCDhvflwSCDexTQUkxyo5p8nP8Ply64MNlwBaEo3HmcNORVhOHLUe7Mv_KDUGDDeoi8FdnnkP23VhCbIhEK4iVDCry1Q",
//         "refresh_token": "def50200f719db6d4c042c00237d70f4bc0daee53afd08ac9c24b33fc01429b3b418b945e61af501ccc4387f0aa41b195ff3d3736b17931f4261469b47daae9ed8e2b5b9962a0a146cbef4ffc4c54fdcf0fe3dbc5a84471573b360878d3ead1bf7a0e0221aa897ae5c4ff5e96942cab76df50f2f879378400d887114ca61125af1db48e3a642f27d2b075d371ef80b9c9db65e12c7d0cf9a25d6abd109da422f4e9d9d20342c6779de701ce24348257daad5eeab6c82bcef51f351c64a6392034069d9ed1c650b67e9985855466c853e653e4d52fc9f394a3eccd3804ad6c34c8aef5e633d0d77f7c9bc0dac6a53b61c926497f93d23571a87dd4519d51ea603b46e8d50a00dfffa8088afbbc33df940ccc2e281de90930193bba750453df16e91e27c6a1fb517bfb782b8509ec182c85301422ab366a1ecd9eb16360b036c0b7f77f0782e15a9c92039bd3c9ad4ff80791bb6f081e1b1bb1afeeb4c6158d08cefe95193c4",
//         "is_active": true
//     }''';
//
//   final jsonDecoded = jsonDecode(jsonFormate);
//   UserModel userModel = UserModel.formJson(jsonDecoded);
//
//   print(userModel.email);
// }
