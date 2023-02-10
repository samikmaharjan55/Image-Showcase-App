import 'package:flutter/material.dart';
import 'package:image_showcase/model/image.dart';
import 'package:provider/provider.dart';

class ImageItem extends StatelessWidget {
  const ImageItem({super.key});
  @override
  Widget build(BuildContext context) {
    final loadedProduct = Provider.of<Picture>(context);
    return ClipRRect(
      borderRadius: BorderRadius.circular(10.0),
      child: GridTile(
        footer: GridTileBar(
          backgroundColor: Colors.black87,
          title: Text(
            loadedProduct.title,
            textAlign: TextAlign.center,
          ),
          leading: IconButton(
            icon: Icon(loadedProduct.isFavourite
                ? Icons.favorite
                : Icons.favorite_border),
            onPressed: () {
              loadedProduct.toggleIsFavourite();
            },
            color: Theme.of(context).colorScheme.secondary,
          ),
        ),
        child: Image.network(
          loadedProduct.imageURL,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
