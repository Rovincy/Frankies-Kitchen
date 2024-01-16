import 'package:flutter/Material.dart';

class Location {
  int? id;
  String? name;
  bool? isRestaurant;
  String? locationType;

  Location({@required this.id, @required this.name, @required this.isRestaurant,@required this.locationType

      //this.itemList,
      });

  // Location.fromMapObject(map) {
  //   this.id = map['id'];
  //   this.name = map['name'].toString().trim();
  // }
}

class Locationlist {
  List<Location>? locationModel;

  Locationlist({@required this.locationModel});
}

Locationlist locationList = Locationlist(locationModel: []);
