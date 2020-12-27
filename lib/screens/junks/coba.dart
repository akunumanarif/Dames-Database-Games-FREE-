import 'package:catatan/items/allitems.dart';
import 'package:catatan/services/service.dart';
import 'package:flutter/material.dart';

class IniListview extends StatefulWidget {
  @override
  _IniListviewState createState() => _IniListviewState();
}

class _IniListviewState extends State<IniListview> {
  List<FeaturedBook> testPost = [];
  bool loading;

  @override
  void initState() {
    super.initState();
    loading = true;
    Service.getFeaturedBook().then((value) {
      setState(() {
        loading = false;
        testPost = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("This is Test"),
        ),
        body: ListView.builder(
            itemCount: testPost.length,
            itemBuilder: (context, index) {
              FeaturedBook book = testPost[10];
              return ListTile(
                title: Text(book.title),
                subtitle: Text(book.body),
              );
            }));
  }
}
