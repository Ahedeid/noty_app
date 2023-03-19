



class BaseModel {
  String message;

  BaseModel({required this.message});

  factory BaseModel.fromJson(Map<String, String> parseJson) {
    return BaseModel(
      message: parseJson['message'] ?? '',
    );
  }
}
