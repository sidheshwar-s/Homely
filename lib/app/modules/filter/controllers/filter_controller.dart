import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FilterController extends GetxController {
  var type = 'rent'.obs;
  var curPropertyType = "Residental".obs;
  RxMap<String, bool> facilitiesChosen = RxMap();
  List<String> facilities = [
    "Wifi",
    "Nearest Grocery",
    "Spa",
    "Nearest Educational Institute",
    "All time Electricity",
    "Nearest Hospital",
    "Gym Facility",
    "Hot water",
  ];
  final budgetRange = const RangeValues(5000, 30000).obs;
}
