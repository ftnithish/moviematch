class Movie {
  final int id;
  final String title;
  final String overview;
  final double rating;
  final String posterPath;
  final List<String> cast;
  final String genre;

  Movie({
    required this.id,
    required this.title,
    required this.overview,
    required this.rating,
    required this.posterPath,
    required this.cast,
    required this.genre,
  });
  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      id: json['id'],
      title: json['title'],
      overview: json['overview'],
      rating: json['vote_average'].toDouble(),
      cast: List<String>.from(json['cast'] ?? []),
      posterPath: json['posterPath'] ?? '',
      genre: json['genre'] ?? 'Unknown',
    );
  }
}
