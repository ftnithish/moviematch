import 'package:flutter/material.dart';
import '../models/movie_model.dart';

class WishlistProvider with ChangeNotifier {
  final List<Movie> _wishlist = [];

  List<Movie> get wishlist => _wishlist;

  void addToWishlist(Movie movie) {
    if (!_wishlist.contains(movie)) {
      _wishlist.add(movie);
      notifyListeners();
    }
  }

  void removeFromWishlist(Movie movie) {
    _wishlist.remove(movie);
    notifyListeners();
  }
}
