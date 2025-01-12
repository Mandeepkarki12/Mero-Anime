import 'package:flutter/material.dart';
import 'package:mero_anime/Fetching%20Api%20Functions/fetching_anime.dart';
import 'package:mero_anime/Widgets/my_list_tile.dart';

class MobileAnimeListPage extends StatelessWidget {
  final String rankingType;
  const MobileAnimeListPage({super.key, required this.rankingType});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: FutureBuilder(
              future: FetchingAnime().fetchAnimeByRanking(rankingType, 100),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                if (snapshot.hasData) {
                  final animeList = snapshot.data!.data!.toList();
                  return ListView.builder(
                      itemCount: animeList.length,
                      itemBuilder: (context, index) {
                        return MyListTile(
                          leadingImage: animeList[index]
                              .node!
                              .mainPicture!
                              .medium
                              .toString(),
                          title: animeList[index].node!.title.toString(),
                          subtitle: animeList[index].ranking!.rank.toString(),
                        );
                      });
                }
                return const Center(
                  child: Text('error'),
                );
              }),
        ));
  }
}
