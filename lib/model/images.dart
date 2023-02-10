import 'package:flutter/cupertino.dart';
import 'package:image_showcase/model/image.dart';

class Pictures with ChangeNotifier {
  final List<Picture> _items = [
    Picture(
        id: "first",
        title: "Watch",
        imageSize: "20mb",
        imageURL:
            "https://www.surfstitch.com/on/demandware.static/-/Sites-ss-master-catalog/default/dwef31ef54/images/MBB-M43BLK/BLACK-WOMENS-ACCESSORIES-ROSEFIELD-WATCHES-MBB-M43BLK_1.JPG",
        isFavourite: false),
    Picture(
        id: "second",
        title: "Shoes",
        imageSize: "20mb",
        imageURL:
            "https://assets.adidas.com/images/w_600,f_auto,q_auto:sensitive,fl_lossy/e06ae7c7b4d14a16acb3a999005a8b6a_9366/Lite_Racer_RBN_Shoes_White_F36653_01_standard.jpg",
        isFavourite: false),
    Picture(
        id: "third",
        title: "Laptop",
        imageSize: "20mb",
        imageURL:
            "https://cdn.mos.cms.futurecdn.net/6t8Zh249QiFmVnkQdCCtHK.jpg",
        isFavourite: false),
    Picture(
        id: "four",
        title: "T-Shirt",
        imageSize: "20mb",
        imageURL:
            "https://5.imimg.com/data5/LM/NA/MY-49778818/mens-round-neck-t-shirt-500x500.jpg",
        isFavourite: false),
  ];

  List<Picture> get items {
    return [..._items];
  }

  // show only favourite items
  List<Picture> get favourites {
    return _items.where((prodItem) {
      return prodItem.isFavourite;
    }).toList();
  }

  // find the selected product using id
  Picture findById(String id) {
    return _items.firstWhere((prod) => prod.id == id);
  }
}
