import 'package:get/get.dart';

import 'package:rent_app/app/modules/add_property/bindings/add_property_binding.dart';
import 'package:rent_app/app/modules/add_property/views/add_property_view.dart';
import 'package:rent_app/app/modules/filter/bindings/filter_binding.dart';
import 'package:rent_app/app/modules/filter/views/filter_view.dart';
import 'package:rent_app/app/modules/home/bindings/home_binding.dart';
import 'package:rent_app/app/modules/home/views/home_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.FILTER,
      page: () => FilterView(),
      binding: FilterBinding(),
    ),
    GetPage(
      name: _Paths.ADD_PROPERTY,
      page: () => AddPropertyView(),
      binding: AddPropertyBinding(),
    ),
  ];
}
