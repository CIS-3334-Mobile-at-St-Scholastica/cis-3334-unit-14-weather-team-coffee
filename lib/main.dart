import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(MyApp());
  //runApp(Text("Hello World"));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'CIS 3334 Weather App'),
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

  Widget weatherTile (int position) {
    print ("Inside weatherTile and setting up tile for positon ${position}");
    return ListTile(
      leading: Image(image: AssetImage('graphics/sun.png')),
      title: Text("Title Here"),
      subtitle: Text("Subtitle Jere"),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView.builder(
        itemCount: 4,
        itemBuilder: (BuildContext context, int position) {
          return Card(
              child: weatherTile(position),
          );
        },
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}