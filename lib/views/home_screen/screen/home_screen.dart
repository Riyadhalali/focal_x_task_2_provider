import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/service/my_services.dart';
import '../controller/home_controller.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final MyService myService = Get.find<MyService>();

    return Scaffold(
      body: GetBuilder<HomeController>(
        init: HomeController(),
        builder: (controller) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 200,
                  width: 200,
                  color: Colors.blue,
                  child: Center(
                    child: Text(
                      '${controller.count}',
                      style: const TextStyle(
                        fontSize: 32.0, // MySize.fontSizeXl equivalent
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    controller.inc();
                  },
                  child: Container(
                    height: 100,
                    width: 100,
                    color: Colors.yellow,
                    child: const Icon(
                      Icons.add,
                      color: Colors.black,
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () async {
                    ThemeMode newMode = myService.themeMode == ThemeMode.dark
                        ? ThemeMode.light
                        : ThemeMode.dark;
                    await myService.saveThemeMode(
                        newMode); // Update and save the theme mode

                    // ANOTHER WAY IS : using getx and i must comment thememode in main
                    // controller.changeTheme();
                  },
                  child: const Text("Change Theme Mode"),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
