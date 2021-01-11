import 'package:catatan/screens/customLoader/loader.dart';
import 'package:catatan/screens/homePage.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:shimmer/shimmer.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState(){
    super.initState();

    _mockCheckForSession().then(
        (status) {
          if (status) {
            _navigateToHome();
          }
        }
    );
  }

  Future<bool> _mockCheckForSession() async {
    await Future.delayed(Duration(milliseconds: 6000), () {});

    return true;
  }

  void _navigateToHome() {
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (BuildContext context) => Homepage()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Container(
              height: MediaQuery.of(context).size.height,
              child: Opacity(
                  opacity: 0.5,
                  child: Image.asset(
                    'assets/bg2.png',
                    fit: BoxFit.fill,
                  )),
            ),
            Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height / 2.5,
                ),
                Shimmer.fromColors(
                  period: Duration(milliseconds: 1500),
                  baseColor: Colors.grey[50],
                  highlightColor: Colors.green,
                  child: Container(
                    padding: EdgeInsets.all(16.0),
                    child: Text(
                      "Dames ",
                      style: GoogleFonts.lobster(
                          fontSize: 90.0,
                          fontStyle: FontStyle.italic,
                          shadows: <Shadow>[
                            Shadow(
                                blurRadius: 18.0,
                                color: Colors.black26,
                                offset: Offset.fromDirection(100, 12))
                          ]),
                    ),
                  ),
                ),
                CustomLoader()
              ],
            ),
            // SizedBox(
            //   height: 30,
            // ),
          ],
        ),
      ),
    );
  }
}
