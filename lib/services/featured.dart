import 'dart:convert';
import 'package:catatan/models/featuredGames.dart';
import 'package:http/http.dart';
import '../models/featuredGames.dart';

class FeaturedApi {
  static const String url =
      'https://www.freetogame.com/api/games?sort-by=releasedate';

  Future<List<FeaturedListgames>> getFeaturedGames() async {
    final res = await get(url);
    if (res.statusCode == 200) {
      List<dynamic> body = jsonDecode(res.body);
      List<FeaturedListgames> listFeaturedGames =
          body.map((dynamic list) => FeaturedListgames.fromJson(list)).toList();
      return listFeaturedGames;
    } else {
      throw 'Data Kosong cuk';
    }
  }
}
