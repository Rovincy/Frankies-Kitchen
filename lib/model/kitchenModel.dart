import 'package:flutter/Material.dart';
// class KitchenModel {
//   String? name;
//   int? id;

//   KitchenModel({required this.id, required this.name});
//   factory KitchenModel.fromJson(Map<String, dynamic> json) =>
//       KitchenModel(id: json["id"], name: json["name"]);
// }



class KitchenModel {
  int? id;
  String? name;
  // bool? isRestaurant;
  // String? locationType;

  KitchenModel({@required this.id, @required this.name
  // , @required this.isRestaurant,@required this.locationType

      //this.itemList,
      });

  // Location.fromMapObject(map) {
  //   this.id = map['id'];
  //   this.name = map['name'].toString().trim();
  // }
}

class Kitchenlist {
  List<KitchenModel>? kitchenModel;

  Kitchenlist({@required this.kitchenModel});
}

Kitchenlist kitchenList = Kitchenlist(kitchenModel: []);
