import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rent_app/app/constants/constants.dart';
import 'package:rent_app/app/modules/home/controllers/home_controller.dart';
import 'package:rent_app/app/modules/home/models/house_model.dart';
import 'package:shimmer/shimmer.dart';

class PopularProperties extends GetView<HomeController> {
  const PopularProperties({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Obx(() => controller.searchQuery.value == ''
          ? Padding(
              padding: const EdgeInsets.only(left: 20),
              child: CarouselSlider.builder(
                itemCount: houseList.length,
                itemBuilder: (context, index, page) {
                  var currentHouse = houseList[index];
                  return PostCard(currentHouse: currentHouse);
                },
                options: CarouselOptions(
                  height: 280,
                  autoPlay: true,
                  viewportFraction: 0.7,
                  scrollDirection: Axis.horizontal,
                ),
              ),
            )
          : const SizedBox.shrink()),
    );
  }
}

class LoadingSkeleton extends StatelessWidget {
  const LoadingSkeleton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SizedBox(
          width: 200,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Shimmer.fromColors(
                      child: const SizedBox(
                        height: 130,
                        width: 300,
                      ),
                      baseColor: Colors.grey[300]!,
                      highlightColor: Colors.grey[100]!)),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Shimmer.fromColors(
                        child: const SizedBox(
                          height: 20,
                          width: 40,
                        ),
                        baseColor: Colors.grey[300]!,
                        highlightColor: Colors.grey[100]!),
                    const SizedBox(
                      height: 5,
                    ),
                    Shimmer.fromColors(
                        child: const SizedBox(
                          height: 20,
                          width: 40,
                        ),
                        baseColor: Colors.grey[300]!,
                        highlightColor: Colors.grey[100]!),
                    const SizedBox(
                      height: 5,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(right: 5.0),
                          child: Icon(
                            Icons.location_on,
                            color: kAccentOrange,
                          ),
                        ),
                        Shimmer.fromColors(
                            child: const SizedBox(
                              height: 40,
                              width: 80,
                            ),
                            baseColor: Colors.grey[300]!,
                            highlightColor: Colors.grey[100]!),
                      ],
                    ),
                    const SizedBox(height: 10)
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class PostCard extends StatelessWidget {
  const PostCard({
    Key? key,
    required this.currentHouse,
  }) : super(key: key);

  final House currentHouse;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SizedBox(
          width: 200,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: SizedBox(
                      height: 130,
                      child: Image.network(
                        currentHouse.images[0],
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 8,
                    right: 8,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 5,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: currentHouse.type == 'Rent'
                            ? Colors.red.withOpacity(0.8)
                            : Colors.green.withOpacity(0.8),
                      ),
                      child: Text(
                        currentHouse.type.toUpperCase(),
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 8,
                    bottom: 8,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 3,
                        vertical: 2,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                        children: [
                          const Icon(
                            Icons.star_rate_rounded,
                            color: Colors.amber,
                          ),
                          const SizedBox(
                            width: 3,
                          ),
                          Text(
                            currentHouse.rating.toString(),
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(
                            width: 3,
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "₹ ${currentHouse.price}",
                      style: const TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 17,
                        color: kAccentOrange,
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      currentHouse.name,
                      style: const TextStyle(fontSize: 18),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(right: 5.0),
                          child: Icon(
                            Icons.location_on,
                            color: kAccentOrange,
                          ),
                        ),
                        Flexible(
                          child: Text(
                            currentHouse.address,
                            style: const TextStyle(
                                height: 1.5, color: Colors.black),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10)
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
