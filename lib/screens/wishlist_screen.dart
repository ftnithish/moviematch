import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/wishlist_provider.dart';

class WishlistScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final wishlist = Provider.of<WishlistProvider>(context).wishlist;

    return Scaffold(
      appBar: AppBar(title: Text("Wishlist")),
      body: ListView.builder(
        itemCount: wishlist.length,
        itemBuilder: (context, index) {
          final movie = wishlist[index];
          return ListTile(
            title: Text(movie.title),
            subtitle: Text(movie.genre),
          );
        },
      ),
    );
  }
}
