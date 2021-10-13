import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:rent_app/app/constants/constants.dart';
import 'package:rent_app/app/modules/home/components/home_app_bar.dart';
import 'package:rent_app/app/modules/home/components/home_search.dart';
import 'package:rent_app/app/modules/home/components/popular_properties.dart';
import 'package:rent_app/app/modules/home/components/recommended_properties.dart';
import 'package:rent_app/app/routes/app_pages.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HomeAppBar(),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Container(
              decoration: const BoxDecoration(
                  color: kLightBlue,
                  borderRadius:
                      BorderRadius.only(bottomRight: Radius.circular(60))),
              padding: const EdgeInsets.only(
                top: 10,
                left: 20,
                right: 20,
                bottom: 20,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    "Find the\nBest Properties",
                    style: TextStyle(fontSize: 30, color: Colors.white),
                  ),
                  SizedBox(height: 15),
                  HomeSearchAndFilter(),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Obx(
              () {
                return controller.searchQuery.value == ''
                    ? Padding(
                        padding: const EdgeInsets.only(
                            left: 20.0, top: 15, bottom: 5),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                const Text(
                                  "Popular Properties",
                                  style: TextStyle(fontSize: 20),
                                ),
                                TextButton(
                                  onPressed: () {},
                                  child: const Text(
                                    "See All",
                                    style: TextStyle(color: kLightBlue),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      )
                    : const SizedBox.shrink();
              },
            ),
          ),
          const PopularProperties(),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.only(top: 20, left: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Obx(
                    () => Text(
                      controller.searchQuery.value == ''
                          ? "Recommended"
                          : "Search Result",
                      style: const TextStyle(fontSize: 20),
                    ),
                  )
                ],
              ),
            ),
          ),
          Recommended(controller: controller)
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.toNamed(Routes.ADD_PROPERTY);
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
