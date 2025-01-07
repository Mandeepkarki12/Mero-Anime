import 'package:flutter/material.dart';
import 'package:mero_anime/Fetching%20Api%20Functions/fetching_anime.dart';
import 'package:mero_anime/Widgets/animeBody/body_anime_template.dart';

class BodyAnime extends StatelessWidget {
  final String title;
  final String rankingType;
  const BodyAnime({super.key, required this.title, required this.rankingType});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w700,
                    color: Theme.of(context).colorScheme.tertiary),
              ),
              TextButton(
                  onPressed: () {},
                  child: const Text(
                    'View all',
                    style: TextStyle(
                      color: Colors.purple,
                      fontWeight: FontWeight.bold,
                    ),
                  ))
            ],
          ),
        ),
        Expanded(
          child: SizedBox(
            child: FutureBuilder(
                future: FetchingAnime().fetchAnimeByRanking(rankingType, 10),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  if (snapshot.hasData) {
                    final animeList = snapshot.data!.data!.toList();
                    return BodyAnimeTemplate(
                      animeList: animeList,
                    );
                  }
                  return const Center(
                    child: Text('Error while loading data'),
                  );
                }),
          ),
        )
      ],
    );
  }
}
