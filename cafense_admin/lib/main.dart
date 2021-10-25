import 'package:cafense_admin/controllers/menu_controller.dart';
import 'package:cafense_admin/layout.dart';
import 'package:cafense_admin/pages/404/error.dart';
import 'package:cafense_admin/pages/authentication/login_page.dart';
import 'package:cafense_admin/pages/authentication/widgets/authservices.dart';
import 'package:cafense_admin/pages/authentication/widgets/instance_binding.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cafense_admin/controllers/navigation_controller.dart';
import 'package:google_fonts/google_fonts.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  Get.put(MenuController());
  Get.put(NavigationController());
  return runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
     initialBinding: InstanceBinding(),
      unknownRoute: GetPage(
          name: "/not-found",
          page: () => const PageNotFound(),
          transition: Transition.fadeIn),
      home:
          Obx(() =>(Get.find<Authservices>().user == null) ? const LoginPage() :
          SiteLayout()),
      title: 'Caffense Admin',
      theme: ThemeData(
        textTheme: GoogleFonts.mulishTextTheme(Theme.of(context).textTheme)
            .apply(bodyColor: Colors.black),
        pageTransitionsTheme: const PageTransitionsTheme(builders: {
          TargetPlatform.android: FadeUpwardsPageTransitionsBuilder(),
          TargetPlatform.iOS: CupertinoPageTransitionsBuilder()
        }),
        primaryColor: const Color(0xffffab5c),
      ),
    );
  }
}
