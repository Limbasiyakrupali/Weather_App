// import 'dart:convert';
//
// import 'package:http/http.dart' as http;
//
// import '../datamodel.dart';
//
// class Apihelper {
//   Apihelper._();
//
//   static Apihelper apihelper = Apihelper._();
//
//   Future<Datamodel?> featchapi() async {
//     http.Response response = await http.get(Uri.parse(
//         "https://api.openweathermap.org/data/2.5/weather?q=rajkot&appid=c1249f14d6a2dfa2b91d112e54937781"));
//
//     if (response.statusCode == 200) {
//       String body = response.body;
//       Map data = jsonDecode(body);
//       // Map<String, dynamic> location = {
//       //   'name': data['name'],
//       //   'country': data['sys']['country'],
//       //   'lat': data['coord']['lat'],
//       //   'lon': data['coord']['lon']
//       // };
//       Map<String, dynamic> locationData = {
//         'location': data['name'],
//         'country': data['sys']['country'],
//       };
//
//       Datamodel location = Datamodel.frommap(data: locationData);
//       print(location);
//
//       return location;
//     }
//     return null;
//   }
// }
import 'dart:convert';

import 'package:http/http.dart' as http;

import '../datamodel.dart';

class ApiHelpers {
  ApiHelpers._();

  static final ApiHelpers apiHelper = ApiHelpers._();

  Future<Weather?> fetchData({required String search}) async {
    final response = await http.get(
      Uri.parse(
          "https://api.weatherapi.com/v1/current.json?key=3cd73ba36dd847d98a4100033242607&q=$search&aqi=no"),
    );

    if (response.statusCode == 200) {
      Map<String, dynamic> decodedData = jsonDecode(response.body);
      Weather weather = Weather.fromJson(decodedData);

      return weather;
    } else {
      return null;
    }
  }
}
