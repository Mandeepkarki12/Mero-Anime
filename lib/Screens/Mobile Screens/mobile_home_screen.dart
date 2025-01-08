import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mero_anime/Authentication/firebase_authentication.dart';
import 'package:mero_anime/Fetching%20Api%20Functions/fetching_anime.dart';
import 'package:mero_anime/Models/get_anime_list_api.dart';
import 'package:mero_anime/Screens/Mobile%20Screens/test_screen.dart';
import 'package:mero_anime/Screens/Web%20Screens/test_screen2.dart';
import 'package:mero_anime/Screens/switch_screen.dart';
import 'package:mero_anime/Widgets/animeBody/body_anime.dart';
import 'package:mero_anime/Widgets/animeHead/head_anime.dart';

class MobileHomeScreen extends StatefulWidget {
  const MobileHomeScreen({super.key});
  @override
  State<MobileHomeScreen> createState() => _MobileHomeScreenState();
}

class _MobileHomeScreenState extends State<MobileHomeScreen> {
  FirebaseAuthentication _auth = FirebaseAuthentication();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              _auth.accountLogout();
            },
          )
        ],
        title:  Text(
          'M E R O A N I M E',
          style: TextStyle(color: Theme.of(context).colorScheme.tertiary),
        ),
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 290,
              child: HeadAnime(),
            ),
            SizedBox(
              height: 320,
              child: BodyAnime(title: 'Popular Animes',rankingType: 'bypopularity', ),
            ),
              SizedBox(
              height: 320,
              child: BodyAnime(title: 'Top Animes', rankingType: 'all',),
            ),
               SizedBox(
              height: 320,
              child: BodyAnime(title: 'Upcoming Animes', rankingType: 'upcoming',),
            ),
              SizedBox(
              height: 320,
              child: BodyAnime(title: 'Airing Animes', rankingType: 'airing',),
            ),


          ],
        ),
      ),
    );
  }
}
