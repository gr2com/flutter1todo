import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'models/item.dart';

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

class HomePage extends StatefulWidget {
  var itens = new List<Item>();
  HomePage() {
    itens = [];
    itens.add(Item(title: "Item 1", done: false));
    itens.add(Item(title: "Item 2", done: true));
    itens.add(Item(title: "Item 3", done: false));
  }
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var newTaskCtrl = TextEditingController();

  void add() {
    if (newTaskCtrl.text.isEmpty) return;
    setState(() {
      widget.itens.add(
        Item(
          title: newTaskCtrl.text,
          done: false,
        ),
      );
      newTaskCtrl.text = "";
    });
  }

  void remov(int index) {
    setState(() {
      widget.itens.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Text("OI.."),
        //title: Text("ToDo List"),
        title: TextFormField(
          controller: newTaskCtrl,
          keyboardType: TextInputType.text,
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
          ),
          decoration: InputDecoration(
              labelText: "Nova tarefa",
              labelStyle: TextStyle(
                color: Colors.green,
              )),
        ),
        actions: <Widget>[
          Icon(Icons.plus_one),
        ],
      ),
      body: ListView.builder(
        itemCount: widget.itens.length,
        itemBuilder: (BuildContext ctxt, int index) {
          final item = widget.itens[index];
          return Dismissible(
            child: CheckboxListTile(
              title: Text(item.title),
              value: item.done,
              onChanged: (value) {
                setState(() {
                  item.done = value;
                });
                print(value);
              },
            ),
            key: Key(item.title),
            background: Container(
              color: Colors.red.withOpacity(0.2),
            ),
            onDismissed: (direction) {
              print(direction);
              renove(index);
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: add,
        child: Icon(Icons.add_alarm),
        backgroundColor: Colors.red,
      ),
    );
  }

  void renove(int index) {}
}
