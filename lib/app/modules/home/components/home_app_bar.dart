import 'package:flutter/material.dart';
import 'package:rent_app/app/constants/constants.dart';

class HomeAppBar extends StatelessWidget with PreferredSizeWidget {
  HomeAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: kLightBlue,
      title: const Text(
        "Rent App",
        style: TextStyle(color: Colors.white),
      ),
      leading: const Icon(
        Icons.menu,
        color: Colors.white,
      ),
      actionsIconTheme: const IconThemeData(color: Colors.white),
      actions: [
        IconButton(
          icon: const Icon(Icons.notifications),
          onPressed: () {},
        ),
        IconButton(
          icon: const Icon(Icons.person),
          onPressed: () {},
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size(double.infinity, kToolbarHeight);
}
