class NoteModel {
  String id;

  String title;

  String created_at;



  NoteModel({required this.id,
    required this.title,
    required this.created_at,
    });

  factory NoteModel.fromJson(Map<String, dynamic> parseJson){
    return NoteModel(
      id: parseJson['id'].toString(),
        title: parseJson['title'],
        created_at: parseJson['created_at'],
    );
  }

   Map<String,dynamic> toJson(){
    return{
      'id' : id,
      'title':title,
      'created_at':created_at,
    };
   }


}



//
// class NoteModel {
//   String id;
//
//   String title;
//
//   String description;
//
//   String products_count;
//
//   NoteModel({required this.id,
//     required this.title,
//     required this.description,
//     required this.products_count});
//
//   factory NoteModel.fromJson(Map<String, dynamic> parseJson){
//     return NoteModel(
//         id: parseJson['id'].toString(),
//         title: parseJson['title'],
//         description: parseJson['description'],
//         products_count: parseJson['products_count']);
//   }
//
//    Map<String,dynamic> toJson(){
//     return{
//       'id' : id,
//       'title':title,
//       'description':description,
//       'products_count':products_count
//     };
//    }
//
//
// }
