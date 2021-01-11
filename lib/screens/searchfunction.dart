import 'package:catatan/models/gamesList.dart';
import 'package:catatan/screens/detailPage/detail.dart';
import 'package:catatan/services/service.dart';
import 'package:flutter/material.dart';

class SearchFunction extends SearchDelegate<String> {

  final GameList gameList;
  SearchFunction({this.gameList});

  final GameApi gameApi = GameApi();
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          if (query.isEmpty) {
            close(context, null);
          } else {
            query = '';
            showSuggestions(context);
          }
        },
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) => FutureBuilder<List<GameList>>(
        future: gameApi.getApi(),
        builder: (context, AsyncSnapshot<List<GameList>> snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return Center(child: CircularProgressIndicator());
            default:
              if (snapshot.hasError) {
                return Container(
                  color: Colors.black,
                  alignment: Alignment.center,
                  child: Text(
                    'Something went wrong!',
                    style: TextStyle(fontSize: 28, color: Colors.white),
                  ),
                );
              } else {
                return Center(
                  child: Text('Kamu nyari apa sih sayang ... '),
                );
                // ListView(children:
                //   data.map((GameList a) => ListTile(
                //     title: a.title,
                //     isThreeLine: false,
                //   )).toList()
                // );
              }
          }
        },
      );

  @override
  Widget buildSuggestions(BuildContext context) {
    // final suggestion = _history;
    // return buildSuggestionsSuccess(suggestion);
    return FutureBuilder<List<GameList>>(
        future: gameApi.getApi(),
        builder: (context, AsyncSnapshot<List<GameList>> snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: Text("Loading ... "),
            );
          }
          final data = snapshot.data
              .where((a) => a.title.toLowerCase().contains(query))
              .toList();
          return ListView(
              children: data
                  .map((GameList a) => InkResponse(
                        child: ListTile(
                          leading: Icon(Icons.gamepad_rounded),
                          title: Text(a.title),
                          isThreeLine: false,
                        ),
                        onTap: () =>
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => DetailPage(
                                      gameList: a,
                                    ))),
                      ))
                  .toList());
        });

    // Container(
    //   child: FutureBuilder<List<String>>(
    //       future: gameApi.searchGame(query: query),
    //       builder: (context, snapshot) {

    //         if (query.isEmpty) return buildNoSuggestions();

    //         switch (snapshot.connectionState) {
    //           case ConnectionState.waiting:
    //             return Center(child: CircularProgressIndicator());
    //           default:
    //             if (snapshot.hasError || snapshot.data.isEmpty) {
    //               return buildNoSuggestions();
    //             } else {
    //               return buildSuggestionsSuccess(snapshot.data);
    //             }
    //         }
    //       }),
    // );
  }

  // Widget buildNoSuggestions() => Center(
  //       child: Text(
  //         'Game belum ada!',
  //         style: TextStyle(fontSize: 28, color: Colors.white),
  //       ),
  //     );

  // Widget buildSuggestionsSuccess(List<String> suggestions) =>
  //     FutureBuilder<List<GameList>>(
  //         future: gameApi.getApi(),
  //         builder: (context, snapshot) {
  //           if (snapshot.hasData) {
  //             List<GameList> game = snapshot.data;
  //             return ListView.builder(
  //               itemCount: suggestions.length,
  //               itemBuilder: (context, index) {
  //                 final suggestion = suggestions[index];
  //                 final queryText = suggestion.substring(0, query.length);
  //                 //final sg = queryText.toLowerCase().contains(query).toString();
  //                 final remainingText = suggestion.substring(query.length);

  //                 return ListTile(
  //                   onTap: () {
  //                     query = suggestion;

  //                     // 1. Show Results
  //                     showResults(context);

  //                     // 2. Close Search & Return Result
  //                     // close(context, suggestion);

  //                     // 3. Navigate to Result Page
  //                     //  Navigator.push(
  //                     //   context,
  //                     //   MaterialPageRoute(
  //                     //     builder: (BuildContext context) => ResultPage(suggestion),
  //                     //   ),
  //                     // );
  //                   },
  //                   leading: Icon(Icons.gamepad_outlined),
  //                   // title: Text(suggestion),
  //                   title: RichText(
  //                     text: TextSpan(
  //                       text: queryText,
  //                       style: TextStyle(
  //                         color: Colors.green,
  //                         fontWeight: FontWeight.bold,
  //                         fontSize: 18,
  //                       ),
  //                       children: [
  //                         TextSpan(
  //                           text: remainingText,
  //                           style: TextStyle(
  //                             color: Colors.green[50],
  //                             fontSize: 18,
  //                           ),
  //                         ),
  //                       ],
  //                     ),
  //                   ),
  //                 );
  //               },
  //             );
  //           } else {
  //             Center(child: Text("Still Loading ... "));
  //           }
  //           return Center(child: Text("Tunggu sebentar ... "));
  //         });

  // Widget buildResultSuccess(List<GameList> listgames) =>
  //     FutureBuilder<List<GameList>>(
  //       future: gameApi.getApi(),
  //       builder: (context, snapshot) {
  //         if (snapshot.hasData) {
  //           return Container(
  //             decoration: BoxDecoration(
  //               gradient: LinearGradient(
  //                 colors: [Color(0xFF3279e2), Colors.purple],
  //                 begin: Alignment.topCenter,
  //                 end: Alignment.bottomCenter,
  //               ),
  //             ),
  //             child: ListView(
  //               padding: EdgeInsets.all(64),
  //               children: [
  //                 Text(
  //                   gameList.title,
  //                   style: TextStyle(
  //                     fontSize: 32,
  //                     color: Colors.white,
  //                   ),
  //                   textAlign: TextAlign.center,
  //                 ),
  //                 const SizedBox(height: 72),
  //                 Text(
  //                   gameList.genre,
  //                   style: TextStyle(
  //                     fontSize: 20,
  //                     color: Colors.white70,
  //                   ),
  //                   textAlign: TextAlign.center,
  //                 ),
  //                 const SizedBox(height: 32),
  //               ],
  //             ),
  //           );
  //         }
  //         return Center(child: Text("Still Loading ... "));
  //       },
  //     );
}

// class SuggestionFunction extends SearchFunction {
//   final GameApi gameApi = GameApi();

//   @override
//   Widget build(BuildContext context) {
//     return FutureBuilder<List<String>>(
//       future: gameApi.searchGame(query: query),
//       builder: (context, snapshot) {
//         return buildSuggestionsSuccess(snapshot.data);
//       },
//     );
//   }

// }
