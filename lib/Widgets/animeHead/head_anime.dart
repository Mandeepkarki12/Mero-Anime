import 'package:flutter/material.dart';
import 'package:mero_anime/Fetching%20Api%20Functions/fetching_anime.dart';
import 'package:mero_anime/Widgets/animeHead/headanime_image_slider.dart';

class HeadAnime extends StatelessWidget {
  const HeadAnime({super.key});
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: FetchingAnime().fetchAnimeByRanking('all', 4),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (snapshot.hasData) {
            final animeList = snapshot.data!.data!.toList();
            return HeadanimeImageSlider(animeList: animeList,);
          }
          return const Center(
            child: Text('Error while loading Data'),
          );
        });
  }
}
