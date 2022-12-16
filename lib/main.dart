import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
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
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

   Stack<int> _stack = Stack<int>();
  int i = 0;

@override
  void initState() {

  super.initState();
  }

  @override
  Widget build(BuildContext context) {


    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: SafeArea(
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
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
           Padding(
             padding: const EdgeInsets.symmetric(horizontal: 24),
             child: SizedBox(
               height: 100,
               width: double.infinity,
               child: ListView.builder(
                   scrollDirection: Axis.horizontal,
                   itemCount: _stack.length ?? 0,
                   itemBuilder: (context,index){
                     int value = _stack.getStack[index];
                     String arrayValue =  " ${value.toString()} ,";
                  return Text(arrayValue,style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold
                  ),);
               }),
             ),
           ),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FloatingActionButton(
                  child: Text("push"),
                    onPressed: (){
                    setState(() {
                      _stack.push(i);
                      i += 1;
                    });
                }),
                SizedBox(width: 20,),
                FloatingActionButton(
                    child: Text("pop"),
                    onPressed: (){
                      setState(() {
                        _stack.pop();
                        if(_stack.isEmpty){
                          i = 0;
                        }

                      });
                    })
              ],
            )
          ],
        ),
      ),
     // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  stackOperation() {

  }
}


class Stack<T> {
  final List<T> _list = <T>[];


  void push(T value) => _list.add(value);
  T? pop() => isNotEmpty ? _list.removeLast() : null;
  T? get peek => isNotEmpty ? _list.last : null;

  bool get isEmpty => _list.isEmpty;
  bool get isNotEmpty => _list.isNotEmpty;

  List<T> get getStack => _list;

  int get length => _list.length;

  @override
  String toString() =>  _list.toString();
}