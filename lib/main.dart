import 'package:flutter/material.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Todo Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: Text("OI.."),
          title: Text("ToDo List"),
          actions: <Widget>[
            Icon(Icons.plus_one),
          ],
        ),
        body: Container(
          child: Center(
            child: Text("Olá vc"),
          ),
        ));
  }
}
