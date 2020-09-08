import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rosa/Http/HttpUrl.dart';
import './Pages/HomePage.dart';
import 'package:rosa/Http/DioManager.dart';
import 'package:fluttertoast/fluttertoast.dart';

void main() {
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp, //只能纵向
      DeviceOrientation.portraitDown, //只能纵向
    ]);
    return MaterialApp(
      title: 'Rosa',
      theme: ThemeData(
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
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getInfo();
  }

  /// 获取数据
  getInfo() {
    var param = {'user_id': "10"};

    DioManager.getInstance().post(
      HttpUrl.index,
      param,
      (data) {
      },
      (data) {},
    );
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
                fontSize: 14.0);
            return false;
          }
          return true;
        },
        child: Scaffold(
          body: pages[_selectedIndex],
          backgroundColor: Colors.white,
          drawer: Drawer(
            child: Container(
              color: Colors.green,
            ),
          ),
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
