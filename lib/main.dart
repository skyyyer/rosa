import 'package:flutter/material.dart';
import 'package:rosa/Http/HttpUrl.dart';
import './Pages/HomePage.dart';
import 'package:rosa/Http/DioUtil.dart';
import 'package:fluttertoast/fluttertoast.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Rosa',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Rosa'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;
  final pages = [HomePage(), HomePage(), HomePage(), HomePage()];

  void _onItemTapped(int index) {
    DioManager.getInstance().get(
        HttpUrl.now,
        {"location": "青岛", "key": "ea277e4e200a4df4a662ccb64a4fed63"},
        (data) {},
        (error) {});
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    DateTime _lastPressedAt; //上次点击时间
    return new WillPopScope(
        onWillPop: () async {
          if (_lastPressedAt == null ||
              DateTime.now().difference(_lastPressedAt) >
                  Duration(seconds: 1)) {
            //两次点击间隔超过1秒则重新计时
            _lastPressedAt = DateTime.now();
            Fluttertoast.showToast(
                msg: "连续按返回键退出应用",
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.CENTER,
                timeInSecForIosWeb: 1,
                backgroundColor: Colors.black54,
                textColor: Colors.white,
                fontSize: 16.0);
            return false;
          }
          return true;
        },
        child: Scaffold(
          body: pages[_selectedIndex],
          backgroundColor: Colors.white,
          bottomNavigationBar: BottomNavigationBar(
            items: [
              BottomNavigationBarItem(
                  icon: Icon(Icons.home), title: Text("home")),
              BottomNavigationBarItem(
                  icon: Icon(Icons.local_activity), title: Text("home")),
              BottomNavigationBarItem(
                  icon: Icon(Icons.folder), title: Text("home")),
              BottomNavigationBarItem(
                  icon: Icon(Icons.mail), title: Text("home")),
            ],
            backgroundColor: Colors.black,
            type: BottomNavigationBarType.fixed,
            selectedItemColor: Colors.lightBlue,
            currentIndex: _selectedIndex,
            unselectedItemColor: Colors.white,
            onTap: _onItemTapped,
          ),
        ));
  }
}
