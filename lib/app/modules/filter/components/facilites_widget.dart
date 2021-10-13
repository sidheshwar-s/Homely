import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rent_app/app/constants/constants.dart';

import 'package:rent_app/app/modules/filter/controllers/filter_controller.dart';

class Facility extends GetView<FilterController> {
  const Facility({
    Key? key,
    required this.facility,
  }) : super(key: key);
  final String facility;
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      bool isChoosen = controller.facilitiesChosen[facility] ?? false;
      return GestureDetector(
        onTap: () {
          if (controller.facilitiesChosen[facility] == null) {
            controller.facilitiesChosen[facility] = true;
          } else {
            controller.facilitiesChosen[facility] =
                !controller.facilitiesChosen[facility]!;
          }
        },
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: isChoosen ? kAccentOrange : Colors.grey,
                ),
              ),
              margin: const EdgeInsets.only(right: 20, bottom: 5, top: 10),
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
              child: Text(
                facility,
                style:
                    TextStyle(color: isChoosen ? kAccentOrange : Colors.grey),
              ),
            ),
            if (isChoosen == true)
              Positioned(
                top: 5,
                right: 15,
                child: Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.all(5),
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle, color: kAccentOrange),
                  child: const Text(
                    "X",
                    style: TextStyle(
                      fontSize: 10,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
          ],
        ),
      );
    });
  }
}
