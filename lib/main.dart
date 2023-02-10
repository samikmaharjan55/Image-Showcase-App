import 'package:flutter/material.dart';
import 'package:image_showcase/model/images.dart';
import 'package:image_showcase/screens/search_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: Pictures(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Image Showcase',
        theme: ThemeData(
            fontFamily: "Lato",
            colorScheme: ColorScheme.fromSwatch().copyWith(
              secondary: Colors.red,
              primary: Colors.blueGrey,
            )),
        initialRoute: "/",
        routes: {
          "/": (ctx) => const SearchScreen(),
        },
      ),
    );
  }
}
