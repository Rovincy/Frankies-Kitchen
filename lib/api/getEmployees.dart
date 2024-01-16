import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:frankies_kitchen/model/employees.dart';
import 'package:http/http.dart' as http;
import 'package:frankies_kitchen/api/baseUrl.dart';

// getLocation(BuildContext context) async {
//   var url = Uri.parse('$baseUrl/api/locations');
//   var response =
//       await http.get(url, headers: {"Content-Type": "application/json"});
//   // print(jsonDecode(response.body));
//   return jsonDecode(response.body);
// }

getEmployees(BuildContext context) async {
  var url = Uri.parse("$baseUrl/api/employees");
  var data = await http.get(url);
  var jsonData = await json.decode(data.body);

  // var data = await getEmployees(context);
  employeesList.employeesModel!.clear();
  for (var val in jsonData['data']) {
    //items.add(val);
    // print(val['firstName']);
    employeesList.employeesModel!.add(Employees(
        id: val['id'],
        firstname: val['firstName'],
        middlename: val['middleName'],
        lastname: val['lastName'],
        code: val['code']));
  }

  // await getCompanyInfo(context);
  }
  // print(jsonData);

  // List<Location> locations =[];

  // for (var loc in jsonData["data"]) {
  //   // Location location = Location(loc["id"], loc["name"]);
  //   // locations.add("${location.name}");
  //   locationList.locationModel!.add(Location(id: loc["id"], name: loc['name']));
  // }
  // print(locationList.locationModel!.length);
  // print(locations);
  // (context as Element).markNeedsBuild();
  // return locations;
  // return jsonData;
// }
