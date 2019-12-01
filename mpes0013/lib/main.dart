import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:quiver/async.dart';

void main() {
  runApp(MaterialApp(title: "iJammer", home: Home()));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List _todoList = [];
  Map<String, dynamic> _lastRemoved = Map();
  int _lastRemovedPos;
  bool isStarted = false;

  int pomoTime = 1;

  // 1 = Pomodoro
  // 2 = Short Break;
  // 3 = Lng Break;

  //int _countPomodoro = 0;
  //int _countBreak = 0;

  int _start = 10;
  int _current = 10;
  CountdownTimer countDownTimer;

  TextEditingController _todoController = TextEditingController();

<<<<<<< HEAD
  void startTimer(int typeTimer) {

    if (typeTimer == 1 )
    {
        _start = 25 * 60;
        _current = _start;
    }

    // int minute = (duration.inMinutes.abs() % 60);
    // int second = (duration.inSeconds.abs() % 60);
    
    countDownTimer = new CountdownTimer(
=======
  void startTimer() {
    CountdownTimer countDownTimer = new CountdownTimer(
>>>>>>> c52b5126ed6c7ca3442cdea9788f248f6946f21b
      new Duration(seconds: _start),
      new Duration(seconds: 1),
    );

    var sub = countDownTimer.listen(null);
<<<<<<< HEAD


    sub.onData((duration) {
      setState(() { _current = _start - duration.elapsed.inSeconds; });
=======
    sub.onData((duration) {
      setState(() {
        _current = _start - duration.elapsed.inSeconds;
      });
>>>>>>> c52b5126ed6c7ca3442cdea9788f248f6946f21b
    });

    sub.onDone(() {
      print("Done");
      sub.cancel();
    });
  }

  @override
  void initState() {
    super.initState();
    _readData().then((data) {
      setState(() {
        _todoList = json.decode(data);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    Scaffold screen = Scaffold(
        appBar: AppBar(
          title: Text("iJammer"),
          backgroundColor: Colors.lightGreen[700],
          centerTitle: true,
        ),
        body:
            //start of app body

            Center(
                // Center is a layout widget. It takes a single child and positions it
                // in the middle of the parent.
                child: Column(
                    // Column is also a layout widget. It takes a list of children and
                    // arranges them vertically. By default, it sizes itself to fit its
                    // children horizontally, and tries to be as tall as its parent.
                    //
                    // Invoke "debug painting" (press "p" in the console, choose the
                    // "Toggle Debug Paint" action from the Flutter Inspector in Android
                    // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
                    // to see the wireframe for each widget.
                    //
                    // Column has various properties to control how it sizes itself and
                    // how it positions its children. Here we use mainAxisAlignment to
                    // center the children vertically; the main axis here is the vertical
                    // axis because Columns are vertical (the cross axis would be
                    // horizontal).
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
              Container(
                // to do container
                margin: const EdgeInsets.all(10.0),
                color: Colors.green[100],
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 2,
                child: Column(
                    //body of to do app
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      // start of body of to do app

                      Container(
                        margin: const EdgeInsets.all(10.0),
                        alignment: Alignment.topCenter,
                        color: Colors.white,
                        //[100],
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height / 2 - 30,
                        child:
                            //* MAIN APP
                            Column(
                          children: <Widget>[
                            Container(
                              padding: EdgeInsets.all(10),
                              //EdgeInsets.fromLTRB(17.0, 1.0, 7.0, 1.0),
                              child: Row(
                                children: <Widget>[
                                  Expanded(
                                    child: TextField(
                                      controller: _todoController,
                                      decoration: InputDecoration(
                                        hintText: "Adicionar tarefa",
                                        labelStyle: TextStyle(
                                            color: Colors.lightGreen[700]),
                                      ),
                                    ),
                                  ),
                                  RaisedButton(
                                    color: Colors.lightGreen[700],
                                    child: Text("+"),
                                    textColor: Colors.white70,
                                    onPressed: addTodo,
                                  )
                                ],
                              ),
                            ),
                            Expanded(
                              child: RefreshIndicator(
                                onRefresh: _refresh,
                                child: ListView.builder(
                                    padding: EdgeInsets.only(top: 10.0),
                                    itemCount: _todoList.length,
                                    itemBuilder: buildItem),
                              ),
                            ),
                          ],
                        ),
                        //   MAIN APP */
                      ),

                      // container branco
                      /*
                      Container(
                        margin: const EdgeInsets.all(10.0),
                        alignment: Alignment.bottomCenter,
                        color: Colors.white,
                        //[100],
                        width: MediaQuery.of(context).size.width,
                        height: 70,
                        //child
                      )
*/

                      // end of body of to do app
                    ]),
              ), //container do todoapp

              Container(
<<<<<<< HEAD
                // o pomodoro precisa rodar dentro desse container
                margin: const EdgeInsets.all(10.0),
                color: Colors.green[100],
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 3,
                child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,

                          children: <Widget>[
                            RaisedButton(
                              onPressed: () {
                                startTimer(1);
                              },
                              child: Text("start"),
                            ),
                             RaisedButton(
                              onPressed: () {
                                startTimer(2);
                              },
                              child: Text("start"),
                            ),
                             RaisedButton(
                              onPressed: () {
                                startTimer(3);
                              },
                              child: Text("start"),
                            ),
                            
                            Text("$_current")
                          ],
                        ),
                ),
=======
                  // o pomodoro precisa rodar dentro desse container
                  margin: const EdgeInsets.all(10.0),
                  color: Colors.green[100],
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height / 3,
                  child: Column(
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          RaisedButton(
                            onPressed: () {
                              startTimer();
                            },
                            child: Text("start"),
                          ),
                          RaisedButton(
                            onPressed: () {
                              startTimer();
                            },
                            child: Text("start"),
                          ),
                          RaisedButton(
                            onPressed: () {
                              startTimer();
                            },
                            child: Text("start"),
                          ),
                        ],
                      ),
                      Text(
                        "$_current",
                      ),
                      Icon(Icons.access_time, color: Colors.white, size: 200),
                    ],
                  )),
>>>>>>> c52b5126ed6c7ca3442cdea9788f248f6946f21b

              // end of app body
            ])));

    return screen;
  }

  Widget buildItem(context, index) {
    return Dismissible(
      key: Key(DateTime.now().millisecondsSinceEpoch.toString()),
      background: Container(
        color: Colors.red,
        child: Align(
          alignment: Alignment(-0.9, 0.0),
          child: Icon(
            Icons.delete,
            color: Colors.white,
          ),
        ),
      ),
      direction: DismissDirection.startToEnd,
      child: CheckboxListTile(
        checkColor: Colors.white,
        activeColor: Colors.white,

        title: Text(_todoList[index]["title"],

          style: new TextStyle(
            color: _todoList[index]["ok"] ? Colors.black38 : Colors.black ,
            decoration: _todoList[index]["ok"] ? TextDecoration.lineThrough : TextDecoration.none ,
          ),




        ),
        value: _todoList[index]["ok"],
        secondary: CircleAvatar(
          child:
              Icon(_todoList[index]["ok"] ? Icons.check : Icons.brightness_1),
        ),

        onChanged: (c) {

          checkTodo(index, c);
        },

      ),
      onDismissed: (direction) {
        setState(() {
          _lastRemoved = Map.from(_todoList[index]);
          _lastRemovedPos = index;
          _todoList.removeAt(index);
          _saveData();

          final snack = SnackBar(
            content: Text("Tarefa ${_lastRemoved["title"]} removida."),
            action: SnackBarAction(
                label: "Desfazer",
                onPressed: () {
                  setState(() {
                    _todoList.insert(_lastRemovedPos, _lastRemoved);
                    _saveData();
                  });
                }),
            duration: Duration(seconds: 2),
          );
          Scaffold.of(context).removeCurrentSnackBar();
          Scaffold.of(context).showSnackBar(snack);
        });
      },
    );
  }

  Future<File> _getFile() async {
    final directory = await getApplicationDocumentsDirectory();
    return File("${directory.path}/data.json");
  }

  Future<File> _saveData() async {
    String data = json.encode(_todoList);
    final file = await _getFile();
    return file.writeAsString(data);
  }

  Future<String> _readData() async {
    try {
      final file = await _getFile();
      return file.readAsString();
    } catch (e) {
      return null;
    }
  }

  void addTodo() {
    setState(() {
      Map<String, dynamic> newTodo = Map();
      newTodo["title"] = _todoController.text;
      _todoController.text = "";
      newTodo["ok"] = false;
      _todoList.add(newTodo);
      _saveData();
    });
  }

  void checkTodo(index, c) {
    setState(() {
      _todoList[index]["ok"] = c;
      _saveData();
    });
  }

  Future<Null> _refresh() async {
    await Future.delayed(Duration(seconds: 1));

    setState(() {
      _todoList.sort((a, b) {
        if (a["ok"] && !b["ok"])
          return 1;
        else if (!a["ok"] && b["ok"])
          return -1;
        else
          return 0;
      });

      _saveData();
    });

    return null;
  }
}
