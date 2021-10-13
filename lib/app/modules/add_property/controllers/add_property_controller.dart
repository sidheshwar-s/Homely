import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class AddPropertyController extends GetxController {
  var propertyNameController = TextEditingController();
  var propertyAddressController = TextEditingController();
  var propertyImageController = PageController();
  var currentImageIndex = 0.obs;
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
  var propertyImages = [].obs;

  @override
  void onClose() {
    propertyAddressController.dispose();
    propertyNameController.dispose();
    propertyImageController.dispose();
    super.onClose();
  }
}
