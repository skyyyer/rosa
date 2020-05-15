import 'package:flutter/material.dart';
import 'package:fsuper/fsuper.dart';

class DetailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Column(
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
                      child: Hero(
                          tag: 1,
                          child: Image.asset(
                            "images/hong_kong.png",
                            width: 100.0,
                            fit: BoxFit.cover,
                          ))),
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
                      "Shang Hai",
                      style: TextStyle(
                          fontSize: 40,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ))
              ],
            ),
            Container(
                margin: EdgeInsets.only(left: 25, top: 30),
                alignment: Alignment.topLeft,
                child: Text(
                  "Description",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                )),
            Container(
                margin: EdgeInsets.all(25),
                alignment: Alignment.topLeft,
                child: Text(
                  "Hong Kong is a highly prosperous free port and an international metropolis. It is also known as New York port together with New York and London. It is the third largest financial center in the world, an important international financial, trade, shipping center and international innovation and technology center. It is also one of the most free economy and the most competitive cities in the world. It enjoys a high reputation in the world and is rated as the third tier city in the world by GaWC.",
                  style: TextStyle(color: Colors.white70, fontSize: 14),
                )),
            HistoryWidget()
          ],
        ),
      ),
    );
  }
}

class HistoryWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new _HistoryWidgetState();
  }
}

class _HistoryWidgetState extends State<HistoryWidget> {
  List avatarList = [
    {"image": "https://segmentfault.com/img/bVbubxL?w=1000&h=1000"},
    {"image": "https://segmentfault.com/img/bVbubxL?w=1000&h=1000"},
    {"image": 'http://pic31.nipic.com/20130711/8952533_164845225000_2.jpg'},
  ];

  Widget buildWidget() {
    List<Widget> avatarWidget = []; //先建一个数组用于存放循环生成的widget

    for (var item in avatarList) {
      avatarWidget.add(
        FSuper(
          height: 50,
          width: 50,
          corner: Corner.all(25),
//          backgroundColor: Colors.orange,
          backgroundImage: NetworkImage(item['image']),
          margin: EdgeInsets.all(5),
        ),
      );
    }

    Widget content = new FSuper(
        height: 60,
        width: double.infinity,
        corner: Corner.all(20),
        child1: Row(children: avatarWidget),
        backgroundColor: Colors.white30,
        margin: EdgeInsets.all(25));

    return content;
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return buildWidget();
  }
}
