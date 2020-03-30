import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fsuper/fsuper.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
              TabWidget()
            ],
          )),
    );
  }
}

class TabWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new _TabWidgetState();
  }
}

class _TabWidgetState extends State<TabWidget> {
  int _tabSelectPosition = 0;

  void _tabSelectTour(){
    setState(() {
      _tabSelectPosition = 0;
    });
  }

  void _tabSelectTrain(){
    setState(() {
      _tabSelectPosition = 1;
    });
  }

  void _tabSelectFlight(){
    setState(() {
      _tabSelectPosition = 2;
    });
  }

  void _tabSelectHotel(){
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
              onClick:_tabSelectTour,
              width: 50,
              height: 120,
              corner: Corner.all(8),
              strokeColor: Colors.white30,
              strokeWidth: 1,
              backgroundColor: _tabSelectPosition==0?Colors.lightBlue:Colors.transparent,
            ),
            FSuper(
              onClick:_tabSelectTrain,
              width: 50,
              height: 120,
              corner: Corner.all(8),
              strokeColor: Colors.white30,
              strokeWidth: 1,
              backgroundColor: _tabSelectPosition==1?Colors.lightBlue:Colors.transparent,
            ),
            FSuper(
              onClick:_tabSelectFlight,
              width: 50,
              height: 120,
              corner: Corner.all(8),
              strokeColor: Colors.white30,
              strokeWidth: 1,
              backgroundColor: _tabSelectPosition==2?Colors.lightBlue:Colors.transparent,
            ),
            FSuper(
              onClick:_tabSelectHotel,
              width: 50,
              height: 120,
              corner: Corner.all(8),
              strokeColor: Colors.white30,
              strokeWidth: 1,
              backgroundColor: _tabSelectPosition==3?Colors.lightBlue:Colors.transparent,
            ),
          ],
        ));
  }
}
