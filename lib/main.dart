import 'package:flutter/material.dart';
import 'package:flutter_weather/weather.dart';
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

  List<Weather> myList = [];
  String _myText = "Hello";

  Future<List<Weather>> _getListItems() async {
    Uri url = Uri.parse('https://api.openweathermap.org/data/2.5/onecall?lat=46.8&lon=-92.1&exclude=hourly,current,minutely,alerts&units=imperial&appid=b15632ec4a9f1a874aeb15b3e22c4503');
    http.Response response = await http.get(url);
    if (response.statusCode == 200) {
      List<Weather> newUsers = userFromJson(response.body);
      return newUsers;
    } else {
      print("HTTP Error with code ${response.statusCode}");
      return myList;
    }
  }

  Widget weatherTile (int position) {
    print ("Inside weatherTile and setting up tile for positon ${position}");
    var daily;
    return ListTile(
      leading: Image(image: weatherImage(daily.weather[0].main)),
      title: Text("Weather API/ JSON"),
      subtitle: Text("Subtitle Jere"),
    );
  }

  weatherImage(String imageName) {

    switch(imageName) {
      case "sunny": {
        imageName = "graphics/sun.png";
      }
      break;

      case "cloudy": {
        imageName = "graphics/cloud.png";
      }
      break;

      case "drizzle": {
        imageName = "graphics/drizzle.png";
      }
      break;

      case "fog": {
        imageName = "graphics/fog.png";
      }
      break;

      case "light rain": {
        imageName = "graphics/light_rain.png";
      }
      break;

      case "partial clouds": {
        imageName = "graphics/partial_cloud.png";
      }
      break;

      case "rain": {
        imageName = "graphics/rain.png";
      }
      break;

      case "snow": {
        imageName = "graphics/snow.png";
      }
      break;

      default: {
        imageName = "graphics/sun.png";
      }
      break;
    }

  }

  @override
  initState() {
    super.initState();
    _getListItems().then((newWeatherData) {
      setState(() {
        myList = newWeatherData;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView.builder(
        itemCount: 7,
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