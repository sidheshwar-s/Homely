import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:rent_app/app/constants/constants.dart';
import 'package:rent_app/app/modules/home/controllers/home_controller.dart';

class Recommended extends StatelessWidget {
  const Recommended({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final HomeController controller;

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.all(20),
      sliver: Obx(
        () => SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) {
              var currentHouse = controller.results[index];
              return Card(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: SizedBox(
                          height: 90,
                          width: 90,
                          child: Image.network(
                            currentHouse.images[0],
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            currentHouse.name,
                            style: const TextStyle(
                              fontSize: 18,
                            ),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Text(
                            "₹${currentHouse.price}",
                            style: const TextStyle(
                              color: kAccentOrange,
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              height: 1.3,
                            ),
                          ),
                          SizedBox(
                            width: 180,
                            child: Text(
                              currentHouse.address,
                              style: const TextStyle(height: 1.3),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              );
            },
            childCount: controller.results.length,
          ),
        ),
      ),
    );
  }
}
