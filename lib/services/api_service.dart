import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/movie_model.dart';

class ApiService {
  final String _baseUrl = "https://api.themoviedb.org/3";
  final String _apiKey =
      "394e3e9c7b7dfd7c2edb7fbb9658a871"; // Replace with your TMDb API key.

  /// Fetch movies by genre.
  Future<List<Movie>> fetchMoviesByGenre(String genreId, {int page = 1}) async {
    final url = Uri.parse(
        "$_baseUrl/discover/movie?api_key=$_apiKey&with_genres=$genreId&page=$page");

    try {
      print("Fetching movies from: $url");
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final data = json.decode(response.body);

        // Log raw response (optional, for debugging)
        print("Raw API Response: ${response.body}");

        // Parse and return movie list
        return (data['results'] as List)
            .map((movie) => Movie.fromJson(movie))
            .toList();
      } else {
        print("API Error: ${response.statusCode} - ${response.reasonPhrase}");
        throw Exception(
            "Failed to load movies. Status Code: ${response.statusCode}");
      }
    } catch (error) {
      print("Exception during API call: $error");
      throw Exception("Network error occurred: $error");
    }
  }

  /// Fetch movie details (optional, for detailed information on a single movie).
  Future<Movie> fetchMovieDetails(int movieId) async {
    final url = Uri.parse("$_baseUrl/movie/$movieId?api_key=$_apiKey");

    try {
      print("Fetching movie details from: $url");
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final data = json.decode(response.body);

        // Log raw response (optional, for debugging)
        print("Raw Movie Details: ${response.body}");

        // Parse and return movie details
        return Movie.fromJson(data);
      } else {
        print("API Error: ${response.statusCode} - ${response.reasonPhrase}");
        throw Exception(
            "Failed to load movie details. Status Code: ${response.statusCode}");
      }
    } catch (error) {
      print("Exception during API call: $error");
      throw Exception("Network error occurred: $error");
    }
  }
}
