// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/getLocation.dart';

import 'package:weather_app/weatherData.dart';

var dayInfo = DateTime.now();
var dateFormat = DateFormat('EEEE, d MMM, yyyy').format(dayInfo);

// ignore: must_be_immutable
class HomeScreen extends StatelessWidget {
  var client = WeatherData();
  var data;

  HomeScreen({super.key});

  info() async {
    var position = await getPosition();
    data = await client.getData(position.latitude, position.longitude);
    return data;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: FutureBuilder(
        future: info(),
        builder: ((context, snapshot) {
          return Column(
            children: [
              Container(
                height: size.height * 0.75,
                width: size.width,
                padding: const EdgeInsets.only(
                  top: 20,
                ),
                margin: const EdgeInsets.only(right: 10, left: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40),
                  gradient: const LinearGradient(
                    colors: [
                      Color(0xFF955cd1),
                      Color(0xff3fa2fa),
                    ],
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    stops: [0.1, 0.85],
                  ),
                ),
                child: Column(
                  children: [
                    Text(
                      '${data?.cityName}',
                      style: TextStyle(
                          color: Colors.white.withOpacity(0.9),
                          fontSize: 35,
                          fontFamily: 'MavenPro'),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      dateFormat,
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.9),
                        fontSize: 15,
                        fontFamily: 'MavenPro',
                      ),
                    ),
                    Image.network(
                      'https:${data?.icon}',
                      width: size.width * 0.4,
                      fit: BoxFit.fill,
                    ),
                    const SizedBox(
                      height: 1,
                    ),
                    Text(
                      '${data?.condition}',
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 35,
                        fontFamily: 'Hubballi',
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      '${data?.temp}',
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w800,
                        fontSize: 60,
                        fontFamily: 'Hubballi',
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            children: [
                              Image.asset(
                                'assets/images/wind.png',
                                width: size.width * 0.10,
                              ),
                              Text(
                                '${data?.wind}',
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                    fontFamily: 'Hubballi'),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Text(
                                'Rüzgar Hızı',
                                style: TextStyle(
                                    color: Colors.white.withOpacity(0.8),
                                    fontSize: 15,
                                    fontFamily: 'MavenPro'),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Column(
                            children: [
                              Image.asset(
                                'assets/images/humidity.png',
                                width: size.width * 0.10,
                              ),
                              Text(
                                '${data?.humidity}',
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                    fontFamily: 'Hubballi'),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Text(
                                'Nem',
                                style: TextStyle(
                                    color: Colors.white.withOpacity(0.8),
                                    fontSize: 15,
                                    fontFamily: 'MavenPro'),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Column(
                            children: [
                              Image.asset(
                                'assets/images/flag.png',
                                width: size.width * 0.10,
                              ),
                              Text(
                                '${data?.wind_dir}',
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                    fontFamily: 'Hubballi'),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Text(
                                'Rüzgar Yönü',
                                style: TextStyle(
                                    color: Colors.white.withOpacity(0.8),
                                    fontSize: 15,
                                    fontFamily: 'MavenPro'),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              Row(
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        Text(
                          'Azami Rüzgar Hızı ',
                          style: TextStyle(
                            color: Colors.white.withOpacity(0.5),
                            fontFamily: 'MavenPro',
                            fontSize: 16,
                          ),
                        ),
                        Text(
                          '${data?.gust} kp/h',
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'MavenPro',
                            fontSize: 17,
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Text(
                          'Basınç',
                          style: TextStyle(
                            color: Colors.white.withOpacity(0.5),
                            fontFamily: 'MavenPro',
                            fontSize: 17,
                          ),
                        ),
                        Text(
                          '${data?.pressure} hpa',
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'MavenPro',
                            fontSize: 17,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        Text(
                          'UV Miktarı',
                          style: TextStyle(
                            color: Colors.white.withOpacity(0.5),
                            fontFamily: 'MavenPro',
                            fontSize: 17,
                          ),
                        ),
                        Text(
                          '${data?.uv}',
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'MavenPro',
                            fontSize: 17,
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Text(
                          'Yağış Miktarı',
                          style: TextStyle(
                            color: Colors.white.withOpacity(0.5),
                            fontFamily: 'MavenPro',
                            fontSize: 17,
                          ),
                        ),
                        Text(
                          '${data?.pricipe} mm',
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'MavenPro',
                            fontSize: 17,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        Text(
                          'Rüzgar Şiddeti',
                          style: TextStyle(
                            color: Colors.white.withOpacity(0.5),
                            fontFamily: 'MavenPro',
                            fontSize: 17,
                          ),
                        ),
                        Text(
                          '${data?.wind} km/h',
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'MavenPro',
                            fontSize: 17,
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Text(
                          'Son Güncelleme',
                          style: TextStyle(
                            color: Colors.white.withOpacity(0.5),
                            fontFamily: 'MavenPro',
                            fontSize: 17,
                          ),
                        ),
                        Text(
                          '${data?.last_update}',
                          style: const TextStyle(
                            color: Colors.green,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'MavenPro',
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          );
        }),
      ),
    );
  }
}
