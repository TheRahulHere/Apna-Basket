
import 'package:flutter/material.dart';

class banners extends StatelessWidget {
  const banners({
    super.key,  required this.imageUrl, required this.isNetworkImage,
  });
  final String imageUrl;
  final bool isNetworkImage;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 200,
        width: 400,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(15),),
        child: Image(fit: BoxFit.cover,image: isNetworkImage? NetworkImage(imageUrl): AssetImage(imageUrl) as ImageProvider,),
      ),
    );
  }
}