import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:mero_anime/Models/get_anime_by_ranking_api.dart';
import 'package:mero_anime/Models/get_anime_detail_api.dart';
import 'package:mero_anime/Models/get_anime_list_api.dart';

class FetchingAnime {
  final String clientId = 'ef6416b4ea4d438e874251af28237198';
  Future<GetAnimeList?> fetchAnimeList(String searchQuery, int limit) async {
    try {
      String animeListurl =
          "https://api.myanimelist.net/v2/anime?q=$searchQuery&limit=$limit";
      final response = await http.get(Uri.parse(animeListurl), headers: {
        'X-MAL-CLIENT-ID': clientId,
      });

      if (response.statusCode == 200) {
        // Parse the JSON response
        final Map<String, dynamic> json = jsonDecode(response.body);
        return GetAnimeList.fromJson(json);
      } else {
        // Handle error response
        print(
            "Failed to fetch anime list. Status code: ${response.statusCode}");
        return null;
      }
    } catch (e) {
      // Handle exceptions
      print("Error occurred while fetching anime list: $e");
      return null;
    }
  }

  

  Future<GetAnimeList?> fetchSeasonalAnime(
      String season, int year, int limit) async {
    try {
      String seasonalAnimeUrl =
          'https://api.myanimelist.net/v2/anime/season/$year/$season?limit=$limit';
      final response = await http.get(Uri.parse(seasonalAnimeUrl), headers: {
        'X-MAL-CLIENT-ID': clientId,
      });

      if (response.statusCode == 200) {
        final Map<String, dynamic> json = jsonDecode(response.body);
        return GetAnimeList.fromJson(json);
      } else {
        print(
            "Failed to fetch seasonal anime list. Status code: ${response.statusCode}");
        return null;
      }
    } catch (e) {
      print("Error occurred while fetching seasonal anime list: $e");
      return null;
    }
  }

  Future<GetAnimeDetail?> fetchAnimeDetail(int animeId) async {
    try {
      String animeDetailUrl =
          'https://api.myanimelist.net/v2/anime/$animeId?fields=id,title,main_picture,alternative_titles,start_date,end_date,synopsis,mean,rank,popularity,media_type,status,genres,num_episodes,broadcast,source,rating,related_anime,recommendations';
      final response = await http.get(Uri.parse(animeDetailUrl), headers: {
        'X-MAL-CLIENT-ID': clientId,
      });

      if (response.statusCode == 200) {
        final Map<String, dynamic> json = jsonDecode(response.body);
        return GetAnimeDetail.fromJson(json);
      } else {
        print(
            "Failed to fetch anime detail. Status code: ${response.statusCode}");
        return null;
      }
    } catch (e) {
      print("Error occurred while fetching anime detail: $e");
      return null;
    }
  }
  Future<GetAnimeRanking?> fetchAnimeByRanking(
      String rankingType, int limit) async {
    try {
      String animeRankingUrl =
          "https://api.myanimelist.net/v2/anime/ranking?ranking_type=$rankingType&limit=$limit";
      final response = await http.get(Uri.parse(animeRankingUrl), headers: {
        'X-MAL-CLIENT-ID': clientId,
      });
      if (response.statusCode == 200) {
        final Map<String, dynamic> json = jsonDecode(response.body);
        return GetAnimeRanking.fromJson(json);
      } else {
        print(
            "Failed to fetch anime list. Status code: ${response.statusCode}");
        return null;
      }
    } catch (e) {
      print("Error occurred while fetching anime list: $e");
      return null;
    }
  }
}
