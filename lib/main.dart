import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rent_app/app/constants/constants.dart';
import 'app/routes/app_pages.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Application",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      theme: ThemeData(
        primaryIconTheme: const IconThemeData(color: Colors.black),
        primaryColor: kLightBlue,
        scaffoldBackgroundColor: kScaffoldBg,
        floatingActionButtonTheme:
            const FloatingActionButtonThemeData(backgroundColor: kAccentOrange),
        appBarTheme: const AppBarTheme(
          color: kScaffoldBg,
          elevation: 0,
          titleTextStyle: TextStyle(color: Colors.black, fontSize: 18),
          iconTheme: IconThemeData(color: Colors.black),
        ),
        fontFamily: GoogleFonts.ubuntu().fontFamily,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
    );
  }
}
