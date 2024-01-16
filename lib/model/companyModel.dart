import 'package:flutter/Material.dart';

class CompanyInfo {
  int? id;
  String? name;
  String? email;
  String? phoneNumber;
  String? address;
  String? image;
  String? message;
  String? companyColor;
  bool? isTaxInclusive;

  CompanyInfo(
      {@required this.id,
      @required this.name,
      @required this.email,
      @required this.phoneNumber,
      @required this.address,
      @required this.image,
      @required this.message,
      @required this.companyColor,
      @required this.isTaxInclusive});

  // Location.fromMapObject(map) {
  //   this.id = map['id'];
  //   this.name = map['name'].toString().trim();
  // }
}

class CompanyInfolist {
  List<CompanyInfo>? companyInfoModel;

  CompanyInfolist({@required this.companyInfoModel});
}

CompanyInfolist companyInfoList = CompanyInfolist(companyInfoModel: []);
