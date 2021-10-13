import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rent_app/app/constants/constants.dart';
import 'package:rent_app/app/modules/add_property/controllers/add_property_controller.dart';

class PropertyImages extends GetView<AddPropertyController> {
  const PropertyImages({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        return controller.propertyImages.isEmpty
            ? InkWell(
                onTap: () {
                  addImages(controller: controller);
                },
                borderRadius: BorderRadius.circular(20),
                child: Center(
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Container(
                        margin: const EdgeInsets.all(20),
                        height: 300,
                        width: 250,
                        decoration: BoxDecoration(
                          color: Colors.grey.withOpacity(0.3),
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      const Icon(Icons.add_a_photo)
                    ],
                  ),
                ),
              )
            : Padding(
                padding: const EdgeInsets.all(10.0),
                child: Center(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 300,
                        width: 250,
                        child: PageView.builder(
                          physics: const BouncingScrollPhysics(),
                          itemCount: controller.propertyImages.length,
                          controller: controller.propertyImageController,
                          onPageChanged: (index) {
                            controller.currentImageIndex.value = index;
                          },
                          itemBuilder: (context, index) {
                            var currentImage = controller.propertyImages[index];
                            return Image.file(
                              currentImage,
                              fit: BoxFit.fitHeight,
                            );
                          },
                        ),
                      ),
                      if (controller.propertyImages.length > 1)
                        Padding(
                          padding: const EdgeInsets.only(top: 15.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: List.generate(
                              controller.propertyImages.length,
                              (index) => Obx(
                                () {
                                  final bool isCurrentPage = index ==
                                      controller.currentImageIndex.value;
                                  return Container(
                                    margin: const EdgeInsets.all(3),
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: isCurrentPage
                                          ? kAccentOrange
                                          : Colors.grey,
                                    ),
                                    height: 8,
                                    width: 8,
                                  );
                                },
                              ),
                            ),
                          ),
                        )
                    ],
                  ),
                ),
              );
      },
    );
  }
}

void addImages({required AddPropertyController controller}) async {
  FilePickerResult? result =
      await FilePicker.platform.pickFiles(allowMultiple: true);

  if (result != null) {
    controller.propertyImages.value =
        result.paths.map((path) => File(path!)).toList();
  } else {
    Get.snackbar(
      "Property can't be added without image",
      "Kindly insert atleast one image",
      snackPosition: SnackPosition.BOTTOM,
      margin: const EdgeInsets.all(20),
    );
  }
}
