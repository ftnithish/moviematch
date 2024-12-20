import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:carousel_slider/carousel_slider.dart' as carousel_slider;
import 'package:carousel_slider/carousel_controller.dart'
    as carousel_controller;
import '../providers/movie_provider.dart';
import '../screens/details_screen.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final carouselController = carousel_controller.CarouselController();

  @override
  void initState() {
    super.initState();
    // Load movies for a default genre (e.g., Action)
    Provider.of<MovieProvider>(context, listen: false).loadMovies("28");
  }

  @override
  Widget build(BuildContext context) {
    final movieProvider = Provider.of<MovieProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Movies Carousel"),
        centerTitle: true,
      ),
      body: movieProvider.movies.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : carousel_slider.CarouselSlider.builder(
              itemCount: movieProvider.movies.length,
              itemBuilder: (context, index, realIndex) {
                final movie = movieProvider.movies[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailsScreen(movie: movie),
                      ),
                    );
                  },
                  child: Stack(
                    children: [
                      // Movie Thumbnail
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 8),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                            image: NetworkImage(
                              "https://image.tmdb.org/t/p/w500${movie.posterPath}",
                            ),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      // Movie Title Overlay
                      Positioned(
                        bottom: 10,
                        left: 10,
                        right: 10,
                        child: Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: Colors.black54,
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Text(
                            movie.title,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
              options: carousel_slider.CarouselOptions(
                height: 400,
                autoPlay: true,
                enlargeCenterPage: true,
                aspectRatio: 16 / 9,
                autoPlayInterval: const Duration(seconds: 3),
              ),
              carouselController: carouselController,
            ),
    );
  }
}
