class NoteModel {
  String id;

  String title;

  String description;

  String products_count;

  NoteModel({required this.id,
    required this.title,
    required this.description,
    required this.products_count});

  factory NoteModel.fromJson(Map<String, dynamic> parseJson){
    return NoteModel(
        id: parseJson['id'].toString(),
        title: parseJson['title'],
        description: parseJson['description'],
        products_count: parseJson['products_count']);
  }

   Map<String,dynamic> toJson(){
    return{
      'id' : id,
      'title':title,
      'description':description,
      'products_count':products_count
    };
   }


}
