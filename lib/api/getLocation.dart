import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:frankies_kitchen/api/baseUrl.dart';
import 'package:frankies_kitchen/model/locationModel.dart';
import 'package:http/http.dart' as http;

// getLocation(BuildContext context) async {
//   var url = Uri.parse('$baseUrl/api/locations');
//   var response =
//       await http.get(url, headers: {"Content-Type": "application/json"});
//   // print(jsonDecode(response.body));
//   return jsonDecode(response.body);
// }
getLocations(BuildContext context) async {
locationList.locationModel!.clear();
  var url = Uri.parse("$baseUrl/api/locations");
  var data = await http.get(url);
  var jsonData = await json.decode(data.body);

  // print(jsonData);

  // List<Location> locations =[];

  for (var loc in jsonData["data"]) {
    // Location location = Location(loc["id"], loc["name"]);
    // locations.add("${location.name}");
    if (loc['id']==4) {
    locationList.locationModel!.add(Location(id: loc["id"], name: 'Restaurant',isRestaurant: loc['isRestaurant'],locationType:loc['locationType']));
    } else {
    locationList.locationModel!.add(Location(id: loc["id"], name: loc['name'],isRestaurant: loc['isRestaurant'],locationType:loc['locationType']));
      
    }
  }
  // print(locationList.locationModel!.length);
  // print(locations);
  // (context as Element).markNeedsBuild();
  // return locations;
}
