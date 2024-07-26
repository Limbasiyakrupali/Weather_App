import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weather_app/model/datamodel.dart';
import 'package:weather_app/model/helper/singleton_helper.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  TextEditingController searchController = TextEditingController();
  List<Weather> weatherList = [];

  Future<void> fetchWeather(String search) async {
    Weather? weather = await ApiHelpers.apiHelper.fetchData(search: search);
    if (weather != null) {
      setState(() {
        weatherList.add(weather);
      });
    }
  }

  @override
  void initState() {
    super.initState();
    fetchWeather("Rajkot");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: 900,
        width: double.infinity,
        decoration: BoxDecoration(
            image: DecorationImage(
                //opacity: 0.7,
                fit: BoxFit.cover,
                image: NetworkImage(
                    "https://ubuntuhandbook.org/wp-content/uploads/2021/07/M-Maggs-pixabay.jpg"))),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 50, left: 20),
              child: Row(
                children: [
                  Text(
                    "Weather App",
                    style: GoogleFonts.getFont("Mulish",
                        textStyle:
                            const TextStyle(fontSize: 26, color: Colors.white)),
                  )
                ],
              ),
            ),
            Expanded(
              flex: 2,
              child: Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: TextField(
                        controller: searchController,
                        decoration: InputDecoration(
                          hintText: "Search Location",
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      setState(() {
                        fetchWeather(searchController.text);
                      });
                    },
                    icon: Icon(
                      Icons.search,
                      size: 25,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 12,
              child: ListView.builder(
                itemCount: weatherList.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Container(
                        height: 120,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            color: Colors.grey.withOpacity(0.5),
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                        padding: EdgeInsets.all(16.0),
                        child: Text(
                          " ${weatherList[index].country}",
                          style: GoogleFonts.getFont("Mulish",
                              textStyle: const TextStyle(
                                  fontSize: 23, color: Colors.white)),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
