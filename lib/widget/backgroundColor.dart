import 'package:flutter/material.dart';
import 'package:frankies_kitchen/model/companyModel.dart';

backgroundColor() {
    return Color(
        int.parse("0xff${companyInfoList.companyInfoModel![0].companyColor!}"));
    // Colors.red[400];
    // return const Color.fromRGBO(14, 96, 169, 1);
  }
