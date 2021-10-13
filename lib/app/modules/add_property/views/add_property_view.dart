import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rent_app/app/constants/constants.dart';
import 'package:rent_app/app/modules/add_property/components/property_address_field.dart';
import 'package:rent_app/app/modules/add_property/components/property_facilities.dart';
import 'package:rent_app/app/modules/add_property/components/property_images.dart';
import 'package:rent_app/app/modules/add_property/components/property_name_field.dart';

import '../controllers/add_property_controller.dart';

class AddPropertyView extends GetView<AddPropertyController> {
  const AddPropertyView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: const Icon(
            Icons.arrow_back,
          ),
        ),
        centerTitle: true,
        title: const Text(
          "Add Property",
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
              child: Text(
                "Images of your property",
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
            ),
            const PropertyImages(),
            const Padding(
              padding: EdgeInsets.only(left: 20.0, top: 10),
              child: Text(
                "Property Name",
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
            ),
            PropertyNameField(controller: controller),
            const Padding(
              padding: EdgeInsets.only(left: 20.0, top: 20),
              child: Text(
                "Address",
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
            ),
            PropertyAddressField(controller: controller),
            const Padding(
              padding: EdgeInsets.only(left: 20.0, top: 5),
              child: Text(
                "Facilities",
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              child: Wrap(
                children: List.generate(
                  controller.facilities.length,
                  (index) => PropertyFacilities(
                    facility: controller.facilities[index],
                  ),
                ),
              ),
            ),
            Center(
              child: TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: kLightBlue,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 10,
                  ),
                ),
                onPressed: () {
                  Get.back();
                },
                child: const Text(
                  "Confirm",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
