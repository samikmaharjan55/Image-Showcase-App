// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';
import 'package:image_showcase/widgets/image_grid.dart';

enum FilterOptions { Favourites, All }

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  bool _showFavourites = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Shop Venue'),
        actions: [
          PopupMenuButton(
              icon: const Icon(Icons.more_vert),
              onSelected: (FilterOptions selectedValue) {
                setState(() {
                  if (selectedValue == FilterOptions.Favourites) {
                    _showFavourites = true;
                  } else {
                    _showFavourites = false;
                  }
                });
              },
              itemBuilder: (context) => [
                    const PopupMenuItem(
                        value: FilterOptions.Favourites,
                        child: Text("Show Favourites")),
                    const PopupMenuItem(
                        value: FilterOptions.All, child: Text("Show All")),
                  ]),
        ],
      ),
      body: ImageGrid(_showFavourites),
    );
  }
}
