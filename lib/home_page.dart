import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weatherapp/geoLocation.dart';
import 'package:weatherapp/weatherData.dart';
import 'package:weatherapp/weatherModel.dart';

var dayInfo = DateTime.now();
var dateFormat = DateFormat('MM/dd/yyyy HH:mm').format(dayInfo);

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController _textEditingController = TextEditingController();

  WeatherApiClient client = WeatherApiClient();

  Weather? data;

  Future<void> getData() async {
    data = await client.getCurrentWeather("Osh");
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: FutureBuilder(
        future: getData(),
        builder: ((context, snapshot) {
          return SingleChildScrollView(
            child: Container(
              child: Column(
                children: [
                  Container(
                    margin: const EdgeInsets.only(left: 10.0, right: 10.0),
                    height: size.height * 0.95,
                    width: size.width,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40.0),
                      gradient: const LinearGradient(
                        colors: [
                          Color(0xFF955CD1),
                          Color(0xFF3FA2FA),
                        ],
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                        stops: [0.2, 0.85],
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(50.0),
                      child: Column(
                        children: [
                          const SizedBox(height: 10),
                          Text(
                            '${data?.cityName!}',
                            style: TextStyle(
                                color: Colors.white.withOpacity(0.9),
                                fontSize: 35.0,
                                fontFamily: 'Cookie'),
                          ),
                          Expanded(
                            child: TextField(
                              decoration: InputDecoration(
                                suffixIcon: InkWell(
                                  onTap: () {
                                    setState(() {});

                                    data!.cityName =
                                        _textEditingController.text;
                                  },
                                  child: const Icon(
                                    Icons.search,
                                    color: Colors.black,
                                  ),
                                ),
                                hintText: 'Поиск',
                                border: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                    width: 10,
                                    color: Colors.black,
                                  ),
                                  borderRadius: BorderRadius.circular(
                                    12.0,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 10.0),
                          Text(
                            dateFormat,
                            style: TextStyle(
                                color: Colors.white.withOpacity(0.9),
                                fontSize: 15.0,
                                fontFamily: 'Cookie'),
                          ),
                          const SizedBox(height: 30.0),
                          Image.asset(
                            "assets/images/sun1.png",
                            width: size.width * 0.2,
                          ),
                          const SizedBox(height: 50.0),
                          Text(
                            '${data?.temp!.toStringAsFixed(0)}\u00B0',
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 75.0,
                                fontWeight: FontWeight.w800,
                                fontFamily: 'Hubballi'),
                          ),
                          const SizedBox(height: 50.0),
                          Row(
                            children: [
                              Expanded(
                                child: Column(
                                  children: [
                                    Image.asset(
                                      "assets/images/wind.png",
                                      width: size.width * 0.1,
                                    ),
                                    const SizedBox(height: 10.0),
                                    Text(
                                      '${data?.wind} km/h',
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontFamily: "Hubballi",
                                        fontSize: 20.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    const SizedBox(height: 10.0),
                                    Text(
                                      "Ветер",
                                      style: TextStyle(
                                        color: Colors.white.withOpacity(0.6),
                                        fontFamily: "Hubballi",
                                        fontSize: 17.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Column(
                                  children: [
                                    Image.asset(
                                      "assets/images/icon.png",
                                      width: size.width * 0.1,
                                    ),
                                    const SizedBox(height: 10.0),
                                    Text(
                                      '${data?.humidity}%',
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontFamily: "Hubballi",
                                        fontSize: 20.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    const SizedBox(height: 10.0),
                                    Text(
                                      "Влажность",
                                      style: TextStyle(
                                        color: Colors.white.withOpacity(0.6),
                                        fontFamily: "Hubballi",
                                        fontSize: 17.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                          const Padding(
                            padding: const EdgeInsets.only(top: 97),
                            child: Icon(
                              Icons.expand_more,
                              color: Colors.black,
                              size: 25.0,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}
