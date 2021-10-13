import 'package:flutter/material.dart';
import 'package:rent_app/app/constants/constants.dart';
import 'package:rent_app/app/modules/add_property/controllers/add_property_controller.dart';

class PropertyAddressField extends StatelessWidget {
  const PropertyAddressField({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final AddPropertyController controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20.0,
        vertical: 0,
      ),
      child: TextField(
        controller: controller.propertyAddressController,
        maxLength: 100,
        decoration: const InputDecoration(
          hintText: "eg:  No: 62, rue Nationale, Paris",
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: kLightBlue, width: 2),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: kLightBlue, width: 2),
          ),
          disabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: kLightBlue, width: 2),
          ),
        ),
      ),
    );
  }
}
