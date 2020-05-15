import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fsuper/fsuper.dart';
import './DetailPage.dart';
import './MusicDetail.dart';
import 'dart:math' as math;
import 'package:rosa/model/homeBean.dart';
import 'dart:convert';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String str =
        "{\"code\": 0,\"msg\": \"\",\"result\": [{\"city_id\": 1,\"city_name\": \"上海\",\"city_cover\": 0},{\"city_id\": 3,\"city_name\": \"迈阿密\",\"city_cover\": 0},{\"city_id\": 2,\"city_name\": \"巴黎\",\"city_cover\": 0}]}";
    List<HomeBeanResult> _list =
        new HomeBeanEntity().fromJson(json.decode(str)).result;

    return Scaffold(
      body: Container(
          width: double.infinity,
          height: double.infinity,
          padding: EdgeInsets.fromLTRB(20, 100, 20, 0),
          decoration: BoxDecoration(
            gradient: const LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                colors: [Colors.black, Colors.black54]),
          ),
          child: Column(
            children: <Widget>[
              new Container(
                alignment: Alignment.centerLeft,
                child: new Text(
                  'Planning your\nown travel',
                  style: new TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 32,
                      color: Colors.white),
                ),
              ),
              new Container(
                  margin: EdgeInsets.only(top: 20),
                  height: 50,
                  padding: EdgeInsets.only(left: 20),
                  width: double.infinity,
                  decoration: new BoxDecoration(
                      color: Colors.white10,
                      borderRadius: BorderRadius.circular(25.0)),
                  child: new Row(
                    children: <Widget>[
                      new Icon(Icons.search),
                      new Text("Search cities,hotels ...")
                    ],
                  )),
              TabWidget(),
              Padding(
                padding: EdgeInsets.only(top: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  verticalDirection: VerticalDirection.up,
                  children: <Widget>[
                    Text(
                      "Popular tours",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "see all",
                      style: TextStyle(color: Colors.white30, fontSize: 14),
                    )
                  ],
                ),
              ),
              Padding(
                  padding: EdgeInsets.only(top: 20),
                  child: Container(
                    height: 200,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: _list.length,
                        itemBuilder: (BuildContext context, int index) {
                          return InkWell(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (BuildContext context) {
                                return DetailPage();
                              }));
                            },
                            child: Hero(
                                tag: _list[index].cityId,
                                child: FSuper(
                                  width: 100,
                                  height: 200,
                                  margin: EdgeInsets.only(right: 30),
                                  corner: Corner.all(8),
                                  backgroundImage:
                                      AssetImage("images/hong_kong.png"),
                                  child1: Transform.rotate(
                                    //旋转90度
                                    angle: math.pi / 2,
                                    child: Text(
                                      _list[index].cityName,
                                      style: TextStyle(
                                          fontSize: 16,
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                )),
                          );
                        }),
                  ))
            ],
          )),
    );
  }
}

//分类tab
class TabWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new _TabWidgetState();
  }
}

class _TabWidgetState extends State<TabWidget> {
  int _tabSelectPosition = 0;

  void _tabSelectTour() {
    setState(() {
      _tabSelectPosition = 0;
    });
  }

  void _tabSelectTrain() {
    setState(() {
      _tabSelectPosition = 1;
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (BuildContext context) {
        return (MusicDetail());
      }));
    });
  }

  void _tabSelectFlight() {
    setState(() {
      _tabSelectPosition = 2;
    });
  }

  void _tabSelectHotel() {
    setState(() {
      _tabSelectPosition = 3;
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
        margin: EdgeInsets.only(top: 38),
        child: new Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            FSuper(
              onClick: _tabSelectTour,
              width: 50,
              height: 120,
              corner: Corner.all(8),
              strokeColor: Colors.white30,
              strokeWidth: 1,
              backgroundColor: _tabSelectPosition == 0
                  ? Colors.lightBlue
                  : Colors.transparent,
              child1: Transform.rotate(
                //旋转90度
                angle: math.pi / 2,
                child: Text(
                  "Tour",
                  style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            FSuper(
              onClick: _tabSelectTrain,
              width: 50,
              height: 120,
              corner: Corner.all(8),
              strokeColor: Colors.white30,
              strokeWidth: 1,
              backgroundColor: _tabSelectPosition == 1
                  ? Colors.lightBlue
                  : Colors.transparent,
              child1: Transform.rotate(
                //旋转90度
                angle: math.pi / 2,
                child: Text(
                  "Train",
                  style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            FSuper(
              onClick: _tabSelectFlight,
              width: 50,
              height: 120,
              corner: Corner.all(8),
              strokeColor: Colors.white30,
              strokeWidth: 1,
              backgroundColor: _tabSelectPosition == 2
                  ? Colors.lightBlue
                  : Colors.transparent,
              child1: Transform.rotate(
                //旋转90度
                angle: math.pi / 2,
                child: Text(
                  "Flight",
                  style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            FSuper(
              onClick: _tabSelectHotel,
              width: 50,
              height: 120,
              corner: Corner.all(8),
              strokeColor: Colors.white30,
              strokeWidth: 1,
              backgroundColor: _tabSelectPosition == 3
                  ? Colors.lightBlue
                  : Colors.transparent,
              child1: Transform.rotate(
                //旋转90度
                angle: math.pi / 2,
                child: Text(
                  "Hotel",
                  style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ));
  }
}
