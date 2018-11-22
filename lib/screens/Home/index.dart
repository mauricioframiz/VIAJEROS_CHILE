import 'package:flutter/material.dart';
import 'package:flutter_flat_app/screens/Home/help.dart';
import 'package:flutter_flat_app/screens/Home/videos.dart';
import 'package:flutter_flat_app/screens/Home/pages/home.dart';
import 'package:flutter_flat_app/screens/Home/pages/settings.dart';
import 'package:flutter_flat_app/screens/Home/pages/battery.dart';

void main() {
  runApp(new MaterialApp(home: MyTabs(), 
  
  routes: <String, WidgetBuilder>{
    Settings.routeName: (BuildContext context) => new Settings(),
    Battery.routeName: (BuildContext context) => new Battery(),
  }));
}

class MyTabs extends StatefulWidget {
  const MyTabs({Key key}) : super(key: key);

  @override
  _MyTabsState createState() => new _MyTabsState();
}

class _MyTabsState extends State<MyTabs> with SingleTickerProviderStateMixin {
  Drawer _getDrawer(BuildContext context) {
    var header = new DrawerHeader(
      child: new Text("Ajustes"),
    );
    var info = new AboutListTile(
      child: new Text("Información App"),
      applicationVersion: "v1.0.0",
      applicationName: "Viajeros Chilecito",
      applicationIcon: new Icon(Icons.favorite),
      icon: new Icon(Icons.info),
    );

    ListTile _getItem(Icon icon, String description, String route) {
      return new ListTile(
          leading: icon,
          title: new Text(description),
          onTap: () {
            setState(() {
              Navigator.of(context).pushNamed(route);
            });
          });
    }

    ListView listView = new ListView(children: <Widget>[
      header,
      _getItem(new Icon(Icons.settings), 'Configuracion', "/configuracion"),
      _getItem(new Icon(Icons.home), 'Página Principal', "/HomePage"),
      _getItem(new Icon(Icons.battery_charging_full), "Batería", "/bateria"),
      info
    ]);

    return new Drawer(
      child: listView,
    );
  }

  TabController controller;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = new TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text("VIAJEROS CHILE"),
          backgroundColor: Colors.redAccent,
          bottom: new TabBar(
            tabs: <Widget>[
              new Tab(
                icon: new Icon(Icons.home),
              ),
              new Tab(
                icon: new Icon(Icons.ondemand_video),
              ),
              new Tab(
                icon: new Icon(Icons.help_outline),
              )
            ],
            controller: controller,
          ),
        ),
        drawer: _getDrawer(context),
        body: new TabBarView(
            children: <Widget>[new Home(), new VideoScreen(), new MyStepper()],
            controller: controller));
  }
}
