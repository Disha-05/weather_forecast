import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:weather_forecast/model/weather_model.dart';
import 'package:weather_forecast/services/getLocation.dart';
import 'package:weather_forecast/services/weather_api_client.dart';

class WeatherForecastScreen extends StatefulWidget {
  @override
  _WeatherForecastScreenState createState() => _WeatherForecastScreenState();
}

class _WeatherForecastScreenState extends State<WeatherForecastScreen> {
  var client = WeatherApiClient();

  var data;
  info() async {
    var position = await GetPosition();
    data =
        await client.getCurrentWeather(position.latitude, position.longitude);
    return data;
  }

  AssetImage getBackgroundImage(String weatherCondition) {
    AssetImage backgroundImage;
    switch (weatherCondition) {
      case 'Cloudy':
        backgroundImage = AssetImage('assets/images/cloudy_bg.jpg');
        break;
      case 'Partly cloudy':
        backgroundImage = AssetImage('assets/images/cloudy_bg.jpg');
        break;
      case 'Sunny':
        backgroundImage = AssetImage('assets/images/sunny_bg.jpg');
        break;
      default:
        backgroundImage = AssetImage('assets/images/rainy_bg.jpg');
    }
    return backgroundImage;
  }

  List<Map<String, dynamic>> hourlyWeather = [
    {
      'time': '12:00 PM',
      'temperature': '72°F',
      'icon': 'assets/images/sunny.png'
    },
    {
      'time': '01:00 PM',
      'temperature': '75°F',
      'icon': 'assets/images/sunny.png'
    },
    {
      'time': '02:00 PM',
      'temperature': '78°F',
      'icon': 'assets/images/sunny.png'
    },
    {
      'time': '03:00 PM',
      'temperature': '80°F',
      'icon': 'assets/images/sunny.png'
    },
    {
      'time': '04:00 PM',
      'temperature': '81°F',
      'icon': 'assets/images/sunny.png'
    },
  ];

  List<Map<String, dynamic>> dailyWeather = [
    {
      'date': '19 April',
      'temperature': '72°F',
      'icon': 'assets/images/sunny.png'
    },
    {
      'date': '20 April 23',
      'temperature': '75°F',
      'icon': 'assets/images/sunny.png'
    },
    {
      'date': '21 April 23',
      'temperature': '78°F',
      'icon': 'assets/images/sunny.png'
    },
    {
      'date': '22 April 23',
      'temperature': '80°F',
      'icon': 'assets/images/sunny.png'
    },
    {
      'date': '23 April 23',
      'temperature': '81°F',
      'icon': 'assets/images/sunny.png'
    },
  ];
  @override
  Widget build(BuildContext context) {
    // var backgroundImage;
    // List<String> weatherConditions = ['cloudy', 'sunny', 'rainy'];
    // String weatherCondition = weatherConditions[0];
    // switch (weatherCondition) {
    //   case 'cloudy':
    //     backgroundImage = AssetImage('assets/images/cloudy_bg.jpg');
    //     break;
    //   case 'sunny':
    //     backgroundImage = AssetImage('assets/images/sunny_bg.jpg');
    //     break;
    //   default:
    //     backgroundImage = AssetImage('assets/images/rainy_bg.jpg');
    // }
    return Scaffold(
        // set the background color of the scaffold to transparent
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: Text(
            'Weather Forecast',
            style: TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle: true,
          //backgroundColor: Color(0xFF354B5E),
          elevation: 0.0,
        ),
        body: FutureBuilder(
          future: info(),
          builder: ((context, snapshot) {
            return Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: getBackgroundImage(data?.description),
                  fit: BoxFit.cover,
                ),
              ),
              child: SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "${data?.cityName}",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 32.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 5.0),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            'assets/images/cloudy.png',
                            width: 100.0,
                            height: 100.0,
                          ),
                          SizedBox(width: 16.0),
                          Text(
                            "${data?.description}",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 24.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 15.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Column(
                            children: [
                              Text(
                                'Temperature',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20.0,
                                ),
                              ),
                              SizedBox(height: 8.0),
                              Text(
                                "${data?.temp}",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 28.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              Text(
                                'Wind',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20.0,
                                ),
                              ),
                              SizedBox(height: 8.0),
                              Text(
                                "${data?.wind}",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 28.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              Text(
                                'Humidity',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20.0,
                                ),
                              ),
                              SizedBox(height: 8.0),
                              Text(
                                "${data?.humidity}",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 28.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: 15.0),
                      Divider(
                        color: Color.fromARGB(255, 246, 244,
                            244), // optionally specify the color of the line
                        thickness: 2,
                      ),
                      SizedBox(height: 15.0),
                      Text(
                        'Hourly Forecast',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 15.0),
                      Container(
                        height: 150.0,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: hourlyWeather.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Card(
                              color: Colors.transparent,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Text(
                                      hourlyWeather[index]['time'],
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Image.asset(
                                      hourlyWeather[index]['icon'],
                                      width: 50.0,
                                      height: 50.0,
                                    ),
                                    Text(
                                      hourlyWeather[index]['temperature'],
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16.0,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      SizedBox(height: 15.0),
                      Divider(
                        color: Color.fromARGB(255, 246, 244,
                            244), // optionally specify the color of the line
                        thickness: 2,
                      ),
                      SizedBox(height: 15.0),
                      Text(
                        '7 Day Forecast',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 15.0),
                      Container(
                        height: 150.0,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: dailyWeather.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Card(
                              color: Colors.transparent,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Text(
                                      dailyWeather[index]['date'],
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Image.asset(
                                      dailyWeather[index]['icon'],
                                      width: 50.0,
                                      height: 50.0,
                                    ),
                                    Text(
                                      dailyWeather[index]['temperature'],
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16.0,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }),
        ));
  }
}
