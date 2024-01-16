import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:frankies_kitchen/api/baseUrl.dart';
import 'package:frankies_kitchen/model/companyModel.dart';
import 'package:http/http.dart' as http;

// getLocation(BuildContext context) async {
//   var url = Uri.parse('$baseUrl/api/locations');
//   var response =
//       await http.get(url, headers: {"Content-Type": "application/json"});
//   // print(jsonDecode(response.body));
//   return jsonDecode(response.body);
// }

getCompanyInfo(BuildContext context) async {
  var url = Uri.parse("$baseUrl/api/companyinfo");
  var data = await http.get(url);
  var jsonData = await json.decode(data.body);

  // print(jsonData);

  // List<Location> locations =[];
  companyInfoList.companyInfoModel!.clear();
  for (var loc in jsonData["data"]) {
    // Location location = Location(loc["id"], loc["name"]);
    // locations.add("${location.name}");
    // print(loc['name']);
    // print(loc['email']);
    // print(loc['phoneNumber']);
    // print(loc['address']);
    // print(loc['image']);
    // print(loc['message']);
    // locationList.locationModel!.add(Location(id: loc["id"], name: loc['name']));
    companyInfoList.companyInfoModel!.add(CompanyInfo(
        id: loc['id'],
        name: loc['name'],
        email: loc['email'],
        phoneNumber: loc['phoneNumber'],
        address: loc['address'],
        image: loc['image'],
        message: loc['message'],
        companyColor: loc['colorCode'],
        isTaxInclusive: loc['isTaxInclusive']));
  }
  // print(locationList.locationModel!.length);
  // print(locations);
  // (context as Element).markNeedsBuild();
  // return locations;
}
