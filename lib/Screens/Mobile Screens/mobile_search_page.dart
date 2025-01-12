import 'package:flutter/material.dart';
import 'package:mero_anime/Fetching%20Api%20Functions/fetching_anime.dart';
import 'package:mero_anime/Widgets/my_list_tile.dart';
import 'package:mero_anime/Widgets/my_text_field.dart';

class MobileSearchPage extends StatefulWidget {
  const MobileSearchPage({super.key});

  @override
  State<MobileSearchPage> createState() => _MobileSearchPageState();
}

class _MobileSearchPageState extends State<MobileSearchPage> {
  final TextEditingController searchController = TextEditingController();
  Future<dynamic>? searchResults; 

  @override
  void initState() {
    super.initState();
    searchResults = FetchingAnime().fetchAnimeList('One Piece', 10);
  }

  void fetchSearchResults(String query) {
    if (query.isNotEmpty) {
      setState(() {
        searchResults = FetchingAnime().fetchAnimeList(query, 10);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Column(
          children: [
            MyTextfield(
              prefixIcon: const Icon(Icons.search),
              hintText: 'Search',
              obscureText: false,
              controller: searchController,
              onChanged: fetchSearchResults, 
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: SizedBox(
                  child: FutureBuilder(
                    future: searchResults,
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                      if (snapshot.hasData) {
                        return ListView.builder(
                          itemCount: snapshot.data!.data!.length, // Adjust based on actual structure
                          itemBuilder: (context, index) {
                            final anime = snapshot.data!.data![index]; // Access each anime item
                            return MyListTile(
                              leadingImage: anime.node!.mainPicture!.medium.toString(),
                              title: anime.node!.title.toString(),
                            );
                          },
                        );
                      }
                      return const Center(
                        child: Text('Error Loading data'),
                      );
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
