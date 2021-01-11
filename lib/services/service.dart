import 'dart:convert';
import 'package:catatan/models/gamesList.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';

class GameApi {
  static const String url = 'https://www.freetogame.com/api/games';
  static const String mmorpg =
      'https://www.freetogame.com/api/games?category=mmorpg';

  static const String shooter =
      'https://www.freetogame.com/api/games?category=shooter';

  static const String mmo = 'https://www.freetogame.com/api/games?category=mmo';

  static const String strategy =
      'https://www.freetogame.com/api/games?category=strategy';

  static const String racing =
      'https://www.freetogame.com/api/games?category=racing';

  Future<List<String>> searchGame({@required String query}) async {
    final res = await get(url);
    final body = json.decode(res.body);

    return body.map<String>((json) {
      final gameTitle = json['title'];
      final gameGenre = json['genre'];
      return '$gameTitle, $gameGenre';
    }).toList();
  }

  Future<List<GameList>> getApi() async {
    final res = await get(url);
    if (res.statusCode == 200) {
      List<dynamic> body = jsonDecode(res.body);
      List<GameList> post =
          body.map((dynamic list) => GameList.fromJson(list)).toList();
      return post;
    } else {
      throw 'Data Kosong cuk';
    }
  }

  Future<List<GameList>> getMmorpg() async {
    final res = await get(mmorpg);
    if (res.statusCode == 200) {
      List<dynamic> body = jsonDecode(res.body);
      List<GameList> post =
          body.map((dynamic list) => GameList.fromJson(list)).toList();
      return post;
    } else {
      throw 'Fucking null cuk';
    }
  }

  Future<List<GameList>> getShooter() async {
    final res = await get(shooter);
    if (res.statusCode == 200) {
      List<dynamic> body = jsonDecode(res.body);
      List<GameList> post =
          body.map((dynamic list) => GameList.fromJson(list)).toList();
      return post;
    } else {
      throw 'Fucking null cuk';
    }
  }

  Future<List<GameList>> getMmo() async {
    final res = await get(mmo);
    if (res.statusCode == 200) {
      List<dynamic> body = jsonDecode(res.body);
      List<GameList> post =
          body.map((dynamic list) => GameList.fromJson(list)).toList();
      return post;
    } else {
      throw 'Fucking null cuk';
    }
  }

  Future<List<GameList>> getstrategy() async {
    final res = await get(strategy);
    if (res.statusCode == 200) {
      List<dynamic> body = jsonDecode(res.body);
      List<GameList> post =
          body.map((dynamic list) => GameList.fromJson(list)).toList();
      return post;
    } else {
      throw 'Fucking null cuk';
    }
  }

  Future<List<GameList>> getracing() async {
    final res = await get(racing);
    if (res.statusCode == 200) {
      List<dynamic> body = jsonDecode(res.body);
      List<GameList> post =
          body.map((dynamic list) => GameList.fromJson(list)).toList();
      return post;
    } else {
      throw 'Fucking null cuk';
    }
  }
}
