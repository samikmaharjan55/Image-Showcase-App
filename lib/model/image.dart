import 'package:flutter/cupertino.dart';

class Picture with ChangeNotifier {
  final String id;
  final String title;
  final String imageSize;
  final String imageURL;
  bool isFavourite;

  Picture(
      {required this.id,
      required this.title,
      required this.imageSize,
      required this.imageURL,
      this.isFavourite = false});

  void toggleIsFavourite() {
    isFavourite = !isFavourite;
    notifyListeners();
  }
}
