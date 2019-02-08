import 'package:flutter/material.dart';

import 'IP.dart';
import 'bloc.dart';

void main() {
  Bloc bloc = new Bloc();
  runApp(new MaterialApp(
    home: MyApp(bloc: bloc),
    theme: ThemeData.dark(),
  ));
}

class MyApp extends StatefulWidget {
  final Bloc bloc;
  MyApp({this.bloc});
  @override
  _MyAppState createState() => _MyAppState(bloc: bloc);
}

class _MyAppState extends State<MyApp> {
  Bloc bloc;

  _MyAppState({this.bloc});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: new Text("Prova Bloc Pattern"),
      ),
      body: StreamBuilder(
        builder: _builder,
        stream: bloc.ipInfo,
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.refresh),
        onPressed: bloc.refresh,
      ),
    );
  }

  Widget _builder(BuildContext context, AsyncSnapshot<IPInfo> snap) {
    if (snap.hasData) {
      return new Center(
          child: new ExpansionTile(
        title: new Text(snap.data.ip),
        children: <Widget>[
          new Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              new Text(snap.data.city),
              new Text(snap.data.region),
              new Text(snap.data.country),
              new Text(snap.data.postal),
              new Text(snap.data.org)
            ],
          )
        ],
      ));
    } else {
      return new Center(
        child: new CircularProgressIndicator(),
      );
    }
  }
}
