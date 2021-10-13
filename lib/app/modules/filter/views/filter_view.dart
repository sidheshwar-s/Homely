import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rent_app/app/constants/constants.dart';
import 'package:rent_app/app/modules/filter/components/facilites_widget.dart';
import 'package:rent_app/app/modules/filter/components/filter_app_bart.dart';
import 'package:rent_app/app/modules/filter/components/type_button.dart';

import '../controllers/filter_controller.dart';

class FilterView extends GetView<FilterController> {
  const FilterView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const FilterAppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Add Filters",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                "I am looking to",
                style: TextStyle(fontSize: 18),
              ),
              const SizedBox(height: 5),
              Row(
                children: const [
                  TypeButton(type: "rent", text: "Rent a property"),
                  SizedBox(width: 20),
                  TypeButton(type: "sell", text: "Buy a property"),
                ],
              ),
              const SizedBox(height: 20),
              const Text(
                "Property Type",
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
              const SizedBox(height: 10),
              _propertyDropDown(),
              const SizedBox(height: 20),
              const Text(
                "Add Location",
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
              const SizedBox(height: 10),
              _addLocation(),
              const SizedBox(height: 20),
              const Text(
                "Add Facilites",
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
              const SizedBox(height: 10),
              _addFacility(),
              const SizedBox(height: 20),
              const Text(
                "Add Budget",
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
              const SizedBox(height: 10),
              _addBudget(),
              const SizedBox(height: 10),
              _applyFilter()
            ],
          ),
        ),
      ),
    );
  }

  Center _applyFilter() {
    return Center(
      child: TextButton(
        style: TextButton.styleFrom(
          backgroundColor: kLightBlue,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        ),
        onPressed: () {
          Get.back();
        },
        child: const Text(
          "Apply Filter",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  Obx _addBudget() {
    return Obx(
      () {
        var current = controller.budgetRange.value;
        return Row(
          children: [
            Text(
              "₹${current.start.toStringAsFixed(0)}",
              style: const TextStyle(color: kAccentOrange),
            ),
            const SizedBox(
              width: 5,
            ),
            Expanded(
              child: RangeSlider(
                divisions: 10,
                min: 1000,
                max: 50000,
                values: current,
                onChanged: (values) {
                  controller.budgetRange.value = values;
                },
                labels: RangeLabels(
                  current.start.toStringAsFixed(0),
                  current.end.toStringAsFixed(0),
                ),
              ),
            ),
            const SizedBox(
              width: 5,
            ),
            Text(
              "₹${current.end.toStringAsFixed(0)}",
              style: const TextStyle(color: kAccentOrange),
            ),
          ],
        );
      },
    );
  }

  Wrap _addFacility() {
    return Wrap(
      children: List.generate(controller.facilities.length,
          (index) => Facility(facility: controller.facilities[index])),
    );
  }

  Obx _propertyDropDown() {
    return Obx(
      () => Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5),
          border: Border.all(color: kLightBlue),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
        child: DropdownButton(
          borderRadius: BorderRadius.circular(5),
          underline: const SizedBox.shrink(),
          onChanged: (String? value) {
            controller.curPropertyType.value = value!;
          },
          value: controller.curPropertyType.value,
          items: ["Residental", "Commercial", "Agricultural", "Special Use"]
              .map((e) => DropdownMenuItem(value: e, child: Text(e)))
              .toList(),
        ),
      ),
    );
  }
}

TextField _addLocation() {
  return TextField(
    decoration: InputDecoration(
      contentPadding: const EdgeInsets.all(10),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      hintText: "Search Location",
      suffixIcon: const Icon(
        Icons.location_on_outlined,
      ),
    ),
  );
}
