import 'package:flutter/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/anime.dart';

class AppStateProvider extends ChangeNotifier {
  List<Anime> _favorites = [];
  static const String _storageKey = "favorite_anime";

  List<Anime> get favorites => _favorites;

  AppStateProvider(){
    //_loadFavorites();
  }
  bool isFavorite(String animeId){
    return _favorites.any((anime) => anime.id == animeId);
  }
  
  void toggleFavorite(Anime anime) {
    if(isFavorite(anime.id)){
      removeFavorite(anime.id);
    }else {
      addFavorite(anime);
    }
  }
  
  void addFavorite(Anime anime){
    if(!isFavorite(anime.id)){
      _favorites.add(anime);
      //_saveFavorite();
      notifyListeners();
    }
  }
  void removeFavorite(String animeId){
    _favorites.removeWhere((anime) => anime.id == animeId);
      //_saveFavorite();
      notifyListeners();
    
  }
  // Future<void> _saveFavorites() async {
  //   try{
  //     final prefs = await SharedPreferences.getInstance();
  //     final List<Map<String, dynamic>> favoritesJson = _favorites.map((anime) {
  //       return {
  //
  //       }).toList();
  //     }
  //   }
  // }

}