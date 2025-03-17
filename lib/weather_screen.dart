import 'dart:convert';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weath_app/addition_info.dart';
import 'package:weath_app/hourly_forecast.dart';
import 'package:http/http.dart' as http;
import 'package:weath_app/secrete_keys.dart';

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({super.key});

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  late Future<Map<String, dynamic>> weather;

  Future<Map<String, dynamic>> getCurrentWeather() async {
    try {
      final result = await http.get(
        Uri.parse(
          "https://api.openweathermap.org/data/2.5/forecast?q=Bamenda&appid=$SecreteKey",
        ),
      );
      final data = jsonDecode(result.body);
      if (data['cod'] != '200') {
        throw "UnExpected error occurred";
      }
      return data;
    } catch (e) {
      throw e.toString();
    }
  }

  @override
  void initState() {
    super.initState();
    weather = getCurrentWeather();
  }

  //
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Weather App",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: () {
              setState(() {
                weather = getCurrentWeather();
              });
            },
          ),
        ],
      ),
      body: FutureBuilder(
        future: weather,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator.adaptive(
                backgroundColor: Colors.black,
              ),
            );
          }
          if (snapshot.hasError) {
            return Center(child: Text(snapshot.error.toString()));
          }
          final data = snapshot.data!;
          final dataHelper = data['list'][0];
          final currentTemp = dataHelper['main']['temp'];
          final weather = dataHelper['weather'][0]['main'];
          final speed = dataHelper['wind']['speed'];
          final humidity = dataHelper['main']['humidity'];
          final pressure = dataHelper['main']['pressure'];
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // main card
                SizedBox(
                  width: double.infinity,
                  child: Card(
                    elevation: 10,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            children: [
                              Text(
                                "$currentTemp °K",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 32.0,
                                ),
                              ),
                              SizedBox(height: 16),
                              Icon(
                                weather == 'Clouds' || weather == 'Rain'
                                    ? Icons.cloud
                                    : Icons.sunny,
                                size: 70,
                              ),
                              SizedBox(height: 16),
                              Text(weather, style: TextStyle(fontSize: 20)),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  "Hourly Forecast",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 16),
                SizedBox(
                  height: 135,

                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      final hourlyForecast = data['list'][index + 1];
                      final hourlySkye =
                          data['list'][index + 1]['weather'][0]['main'];
                      final timeFormate = DateTime.parse(
                        hourlyForecast['dt_txt'],
                      );
                      return HourlyForecast(
                        time: DateFormat.j().format(timeFormate),
                        icon:
                            hourlySkye == 'Clouds' || hourlySkye == 'Rain'
                                ? Icons.cloud
                                : Icons.sunny,
                        value: hourlyForecast['main']['temp'].toString(),
                      );
                    },
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  "Additional Information",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    AdditionalInfoWidget(
                      icon: Icons.water_drop,
                      label: "Humidity",
                      value: "$humidity",
                    ),
                    AdditionalInfoWidget(
                      icon: Icons.air,
                      label: "Wind Speed",
                      value: "$speed",
                    ),
                    AdditionalInfoWidget(
                      icon: Icons.beach_access,
                      label: "Pressure",
                      value: "$pressure",
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
