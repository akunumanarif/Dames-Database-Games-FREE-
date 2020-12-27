import 'package:catatan/items/allitems.dart';
import 'package:http/http.dart' as http;

class Service {
  static const String url = 'https://jsonplaceholder.typicode.com/posts';

  static Future<List<FeaturedBook>> getFeaturedBook() async {
    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final List<FeaturedBook> listFeaturedBook =
            featuredBookFromJson(response.body);
        return listFeaturedBook;
      } else {
        return List<FeaturedBook>();
      }
    } catch (e) {
      return List<FeaturedBook>();
    }
  }
}
