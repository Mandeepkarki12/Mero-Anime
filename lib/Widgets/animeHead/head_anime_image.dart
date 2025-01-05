import 'package:flutter/material.dart';

class HeadAnimeImage extends StatelessWidget {
  final animeList;
  const HeadAnimeImage({super.key, required this.animeList});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){

      },
      splashColor: Colors.white,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: AspectRatio(
          aspectRatio: 16/9,
          child: Image.network(
            animeList.node!.mainPicture!.large,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
