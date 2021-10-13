import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rent_app/app/constants/constants.dart';
import 'package:rent_app/app/modules/filter/controllers/filter_controller.dart';

class TypeButton extends GetView<FilterController> {
  final String type;
  final String text;
  const TypeButton({
    Key? key,
    required this.type,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => TextButton(
        style: TextButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
            side: BorderSide(
              color: controller.type.value != type
                  ? kLightBlue
                  : Colors.transparent,
            ),
          ),
          backgroundColor:
              controller.type.value == type ? kLightBlue : Colors.white,
        ),
        onPressed: () {
          controller.type.value = type;
        },
        child: Text(
          text,
          style: TextStyle(
              color: controller.type.value == type ? Colors.white : kLightBlue),
        ),
      ),
    );
  }
}
