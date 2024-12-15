import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/movie_model.dart';
import '../providers/wishlist_provider.dart';

class DetailsScreen extends StatelessWidget {
  final Movie movie;

  DetailsScreen({required this.movie});

  @override
  Widget build(BuildContext context) {
    final wishlistProvider = Provider.of<WishlistProvider>(context);
    final isInWishlist = wishlistProvider.wishlist.contains(movie);

    return Scaffold(
      appBar: AppBar(title: Text(movie.title)),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(movie.overview),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                if (isInWishlist) {
                  wishlistProvider.removeFromWishlist(movie);
                } else {
                  wishlistProvider.addToWishlist(movie);
                }
              },
              child: Text(isInWishlist ? "Remove from Wishlist" : "Add to Wishlist"),
            )
          ],
        ),
      ),
    );
  }
}

