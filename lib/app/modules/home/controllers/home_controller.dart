import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:rent_app/app/modules/home/models/house_model.dart';

class HomeController extends GetxController with StateMixin<List<House>> {
  var searchController = TextEditingController().obs;
  var searchQuery = ''.obs;
  RxList<House> results = houseList.obs;
  searchHouses(String value) {
    value = value.toLowerCase();
    results.value = houseList
        .where((house) => house.name.toLowerCase().contains(value))
        .toList();
  }
}
