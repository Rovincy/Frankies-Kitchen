import 'package:flutter/Material.dart';

class Employees {
  int? id;
  String? firstname;
  String? middlename;
  String? lastname;
  String? code;

  Employees({
    @required this.id,
    @required this.firstname,
    @required this.middlename,
    @required this.lastname,
    @required this.code,
    //this.itemList,
  });

  // Location.fromMapObject(map) {
  //   this.id = map['id'];
  //   this.name = map['name'].toString().trim();
  // }
}

class Employeeslist {
  List<Employees>? employeesModel;

  Employeeslist({@required this.employeesModel});
}

Employeeslist employeesList = Employeeslist(employeesModel: []);
