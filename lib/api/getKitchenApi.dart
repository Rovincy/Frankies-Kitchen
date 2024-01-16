import 'dart:convert';

import 'package:frankies_kitchen/model/kitchenModel.dart';

import 'baseUrl.dart';
import 'package:http/http.dart' as http;

getKitchens() async {
  var url = Uri.parse('$baseUrl/API/kitchen');
  var data = await http.get(url, headers: {"Content-Type": "application/json"});
  var jsonData = jsonDecode(data.body);
  // List<KitchenModel> kitchens = [];
  kitchenList.kitchenModel!.clear();
  if (data.statusCode == 200) {
    for (var element in jsonData["data"]) {
      // KitchenModel kitchen =
      //     KitchenModel(id: element["id"], name: element["name"]);
      // kitchens.add(kitchen);
      kitchenList.kitchenModel!.add(KitchenModel(id: element['id'], name: element['name']));
    }
    // return kitchens;
  } else {
    throw Exception();
  }
}
