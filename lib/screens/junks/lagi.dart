import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class Ambud extends StatelessWidget {
  final url =
      'https://manybooks.net/sites/default/files/styles/220x330sc/public/2018-06/49.jpg?itok=mmlKB9p-';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          color: Colors.yellow,
          height: 300,
          // width: MediaQuery.of(context).size.width,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              Container(
                color: Colors.blue,
                width: 160.0,
                height: 200,
                child: Card(
                  child: Wrap(
                    children: [
                      Image.network(url),
                    ],
                  ),
                ),
              )
            ],
          )
          //ListView.builder(
          //     scrollDirection: Axis.horizontal,
          //     itemCount: 5,
          //     itemBuilder: (context, index) {
          //       return Container(
          //         color: Colors.blue,
          //         width: 160.0,
          //         child: Card(
          //           child: Wrap(
          //             children: [
          //               Image.network(
          //                 url,
          //                 //fit: BoxFit.cover,
          //               ),
          //               ListTile(

          //                 title: Text('This is the title', style: TextStyle(fontSize: 15),),
          //                 subtitle: Text('This is the subtitle', style: TextStyle(fontSize: 8),),
          //               )
          //             ],
          //           ),
          //         ),
          //       );
          //     }),
          ),
    );
  }
}
