import 'package:flutter/material.dart';
import '../models/movie_model.dart';
import '../services/api_service.dart';

class MovieProvider with ChangeNotifier {
  List<Movie> _movies = [];

  List<Movie> get movies => _movies;

  Future<void> loadMovies(String genreId) async {
    try {
      _movies = await ApiService().fetchMoviesByGenre(genreId);
      notifyListeners();
    } catch (error) {
      print("Error loading movies: $error");
    }
  }
}
