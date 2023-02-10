import 'package:flutter/material.dart';
import 'package:image_showcase/model/images.dart';
import 'package:image_showcase/widgets/image_item.dart';
import 'package:provider/provider.dart';

class ImageGrid extends StatelessWidget {
  final bool isFavourite;
  const ImageGrid(this.isFavourite, {super.key});
  @override
  Widget build(BuildContext context) {
    final products = isFavourite
        ? Provider.of<Pictures>(context).favourites
        : Provider.of<Pictures>(context).items;
    return GridView.builder(
        shrinkWrap: true,
        itemCount: products.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          childAspectRatio: 3 / 2,
        ),
        itemBuilder: (ctx, index) => ChangeNotifierProvider.value(
              value: products[index],
              child: const ImageItem(),
            ));
  }
}
