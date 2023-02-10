// ignore_for_file: constant_identifier_names

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:image_showcase/model/pictures.dart';
import 'package:image_showcase/widgets/image_grid.dart';
import 'package:http/http.dart' as http;

enum FilterOptions { Favourites, All }

// Future<Album> fetchAlbum() async {
//   final response = await http.get(Uri.parse(
//       'https://pixabay.com/api/?key=33231416-f8d99950846947f22eaf07b74&q=yellow+flowers&image_type=photo'));
//
//   if (response.statusCode == 200) {
//     return Album.fromJson(jsonDecode(response.body));
//   } else {
//     throw Exception('Failed to load album');
//   }
// }

Future<Hit> fetchHit() async {
  final response = await http.get(Uri.parse(
      'https://pixabay.com/api/?key=33231416-f8d99950846947f22eaf07b74&q=yellow+flowers&image_type=photo'));
  print(response.body);
  if (response.statusCode == 200) {
    return Hit.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to load album');
  }
}

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  bool _showFavourites = false;
  //late Future<Album> futureAlbum;
  late Future<Hit> futureHit;
  @override
  void initState() {
    super.initState();
    // futureAlbum = fetchAlbum();
    futureHit = fetchHit();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Image Showcase'),
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
      body: Column(
        children: [
          TextField(
            showCursor: false,
            decoration: InputDecoration(
              hintText: 'Search here...',
              hintStyle: const TextStyle(
                color: Color(0xFF9CA3AF),
              ),
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
              suffixIcon: IconButton(
                icon: const Icon(Icons.search),
                onPressed: () {},
              ),
            ),
            style: const TextStyle(
              color: Color(0xFF111827),
              fontSize: 16.0,
              fontWeight: FontWeight.w400,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          ImageGrid(_showFavourites),
          FutureBuilder<Hit>(
            future: futureHit,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return SizedBox(
                  height: 100,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemCount: 4,
                    itemBuilder: (_, index) =>
                        Image.network(snapshot.data!.webformatUrl.toString()),
                  ),
                );
              } else if (snapshot.hasError) {
                return Text('${snapshot.error}');
              }
              return const CircularProgressIndicator();
            },
          ),
          // FutureBuilder<Album>(
          //   future: futureAlbum,
          //   builder: (context, snapshot) {
          //     if (snapshot.hasData) {
          //       return SizedBox(
          //         height: 100,
          //         child: ListView.builder(
          //           scrollDirection: Axis.horizontal,
          //           shrinkWrap: true,
          //           itemCount: 4,
          //           itemBuilder: (_, index) => Padding(
          //             padding: const EdgeInsets.all(8.0),
          //             child: Text(snapshot.data!.total.toString()),
          //           ),
          //         ),
          //       );
          //     } else if (snapshot.hasError) {
          //       return Text('${snapshot.error}');
          //     }
          //     return const CircularProgressIndicator();
          //   },
          // ),
        ],
      ),
    );
  }
}
