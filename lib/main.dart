import 'package:flutter/material.dart';

import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'core/routes/route.dart';
import 'core/services/connectivity_service.dart';

import 'core/themes/theme.dart';
import 'core/utils/util.dart';
import 'core/values/app_values.dart';
import 'core/values/global_values.dart';

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  await Get.putAsync(() => ConnectivityService().init());

  await GetStorage.init();

  Get.put(GlobalValues());

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    FlutterNativeSplash.remove();

    final controller = Get.find<GlobalValues>();

    final connectivityService = Get.find<ConnectivityService>();

    TextTheme textTheme = createTextTheme(context);

    MaterialTheme theme = MaterialTheme(textTheme);

    return Obx(() {
      return GetMaterialApp(
        debugShowCheckedModeBanner: true,
        title: 'GitRepo',
        theme: theme.light(),
        darkTheme: theme.dark(),
        themeMode: controller.themeMode.value,
        defaultTransition: Transition.native,
        initialRoute: RouteService.homeView,
        getPages: RouteService.pages,
        builder: (context, child) {
          return Stack(
            children: [
              if (child != null) child,
              Obx(() {
                return Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: AnimatedSlide(
                    duration: Duration(milliseconds: 500),
                    curve: Curves.easeInOut,
                    offset: Offset(0, !connectivityService.hasNetwork.value ? (kToolbarHeight + MediaQuery.of(context).padding.bottom) : 0.0),
                    child: Material(
                      child: Container(
                        color: Colors.red,
                        width: double.infinity,
                        height: kToolbarHeight + MediaQuery.of(context).padding.bottom,
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: EdgeInsets.only(left: AppValues.contentPadding + 6, bottom: MediaQuery.of(context).padding.bottom),
                            child: Text(
                              'No internet connection',
                              style: Theme.of(context).textTheme.titleSmall!.copyWith(color: Colors.white, fontFamily: 'FontExtraBold'),
                              textAlign: TextAlign.start,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              }),
            ],
          );
        },
      );
    });
  }
}
