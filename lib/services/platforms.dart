import 'dart:convert';
import 'package:http/http.dart';
import '../models/gameByPlatforms.dart';

class PlatformsApi {
  static const String url = 'https://www.freetogame.com/api/games?platform=all';
  static const String browser =
      'https://www.freetogame.com/api/games?platform=browser';

  static const String pc = 'https://www.freetogame.com/api/games?platform=pc';

  Future<List<GameByPlatforms>> getGameByPlatforms() async {
    final res = await get(url);
    if (res.statusCode == 200) {
      List<dynamic> body = jsonDecode(res.body);
      List<GameByPlatforms> byPlatforms =
          body.map((dynamic listplat) => GameByPlatforms.fromJson(listplat)).toList();
      return byPlatforms;
    } else {
      throw 'Data Kosong cuk';
    }
  }

  Future<List<GameByPlatforms>> getPlatformBrowser() async {
    final res = await get(browser);
    if (res.statusCode == 200) {
      List<dynamic> body = jsonDecode(res.body);
      List<GameByPlatforms> byPlatforms =
          body.map((dynamic listplat) => GameByPlatforms.fromJson(listplat)).toList();
      return byPlatforms;
    } else {
      throw 'Data Kosong cuk';
    }
  }

  Future<List<GameByPlatforms>> getPlatformPC() async {
    final res = await get(pc);
    if (res.statusCode == 200) {
      List<dynamic> body = jsonDecode(res.body);
      List<GameByPlatforms> byPlatforms =
          body.map((dynamic listplat) => GameByPlatforms.fromJson(listplat)).toList();
      return byPlatforms;
    } else {
      throw 'Data Kosong cuk';
    }
  }
}
