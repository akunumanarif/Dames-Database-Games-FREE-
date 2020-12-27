import 'package:flutter/material.dart';
import 'dart:convert';

class Rekomendasi extends StatefulWidget {
  @override
  _RekomendasiState createState() => _RekomendasiState();
}

class _RekomendasiState extends State<Rekomendasi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Load from JSON'),
      ),
      body: FutureBuilder(
          builder: (context, snapshot) {
            var tampilkan = json.decode(snapshot.data.toString());
            return Container(
              //color: Colors.yellow,
              height: 300,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: tampilkan.length,
                itemBuilder: (context, index) {
                  return Container(
                    width: 160,
                    child: Card(
                      elevation: 10,
                      child: Wrap(
                        children: [
                          Image.network(
                            tampilkan[index]['img'],
                            fit: BoxFit.cover,
                            
                          ),
                          ListTile(
                            title: Text(tampilkan[index]['title']),
                            subtitle: Text(tampilkan[index]['text']),
                          )
                        ],
                      ),
                    ),
                  );
                },
              ),
            );
          },
          future: DefaultAssetBundle.of(context)
              .loadString('assets/featured.json')),
    );
  }
}
