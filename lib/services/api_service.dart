import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/movie_model.dart';

class ApiService {
  final String _baseUrl = "https://api.themoviedb.org/3";
  final String _apiKey = "394e3e9c7b7dfd7c2edb7fbb9658a871";

  Future<List<Movie>> fetchMoviesByGenre(String genreId) async {
    final response = await http.get(Uri.parse("$_baseUrl/discover/movie?api_key=$_apiKey&with_genres=$genreId"));
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return (data['results'] as List).map((movie) => Movie.fromJson(movie)).toList();
    } else {
      throw Exception("Failed to load movies");
    }
  }
}