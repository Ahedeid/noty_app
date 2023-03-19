//
// import 'package:flutter/widgets.dart';
// import '../model/note_model.dart';
//
//
// class NoteService extends ChangeNotifier{
//   // bool isLoading = false;
//
//   // void setLoading(bool value) {
//   //   isLoading = value;
//   //   notifyListeners();
//   // }
//
//    final List<NoteModel> _note =  <NoteModel>[];
//    final List<NoteModel> _favorites = [];
//
//    List<NoteModel> get getNote {
//      return _note ;
//    }
//    List<NoteModel> get getFavorites => _favorites;
//
//    void addNote (String noteDescription){
//      // setLoading(true);
//      NoteModel note = NoteModel(noteDescription);
//      _note.add(note);
//      // setLoading(false);
//    }
//
//   void editNote (String noteDescription,int index){
//     // setLoading(true);
//     _note[index].note =  noteDescription ;
//     // setLoading(false);
//   }
//
//    void removeItem(int index) {
//      _note.removeAt(index);
//      notifyListeners();
//    }
//
//
//    void toggleFavorite(NoteModel item) {
//      item.isFavorite = !item.isFavorite;
//
//      if (item.isFavorite) {
//        _favorites.add(item);
//      } else {
//        _favorites.remove(item);
//      }
//       debugPrint(_favorites.toString());
//      notifyListeners();
//    }
//
//    void removeItemFav(int index) {
//      _favorites.removeAt(index);
//      notifyListeners();
//    }
// }