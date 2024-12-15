import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/movie_provider.dart';
import '../screens/details_screen.dart';

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Movies by Genre")),
      body: Consumer<MovieProvider>(
        builder: (context, movieProvider, child) {
          return ListView.builder(
            itemCount: movieProvider.movies.length,
            itemBuilder: (context, index) {
              final movie = movieProvider.movies[index];
              return ListTile(
                title: Text(movie.title),
                subtitle: Text(movie.genre),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => DetailsScreen(movie: movie)),
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}
