import 'package:flutter/material.dart';
import 'package:mero_anime/Fetching%20Api%20Functions/fetching_anime.dart';
import 'package:mero_anime/Widgets/my_list_tile.dart';

class MobileAnimeListPage extends StatelessWidget {
  const MobileAnimeListPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Padding(
          padding:const  EdgeInsets.symmetric(vertical: 10),
          child: FutureBuilder(
              future: FetchingAnime().fetchAnimeByRanking('all', 20),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                if (snapshot.hasData) {
                  return ListView.builder(
                      itemCount: 20,
                      itemBuilder: (context, index) {
                        return const MyListTile();
                      });
                }
                return const Center(
                  child: Text('error'),
                );
              }),
        ));
  }
}
