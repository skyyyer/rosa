import 'package:flutter/material.dart';
import 'package:fsuper/fsuper.dart';

class DetailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: <Widget>[
          Stack(
            alignment: Alignment.topCenter,
            children: <Widget>[
              AspectRatio(
                aspectRatio: 5 / 6,
                child: ClipRRect(
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(30),
                        bottomRight: Radius.circular(30)),
                    child: Image.asset(
                      "images/hong_kong.png",
                      width: 100.0,
                      fit: BoxFit.cover,
                    )),
              ),
              Positioned(
                  bottom: 30,
                  left: 0,
                  right: 0,
                  child: FSuper(
                    height: 40,
                    width: double.infinity,
                    corner: Corner.all(20),
                    gradient: LinearGradient(colors: [
                      Color(0x8A000000),
                      Color(0x42000000),
                    ]),
                    margin: EdgeInsets.all(25),
                  )),
              Positioned(
                  bottom: 130,
                  left: 25,
                  child: Text(
                    "Hong Kong",
                    style: TextStyle(fontSize: 40, color: Colors.white),
                  ))
            ],
          ),
          Text(
            "Description",
            style: TextStyle(color: Colors.white, fontSize: 20),
          )
        ],
      ),
    );
  }
}
