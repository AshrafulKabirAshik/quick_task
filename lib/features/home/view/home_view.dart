import '/features/home/view/home_drawer_layout.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '/core/values/app_values.dart';
import '../controller/home_controller.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final controller = Get.find<HomeController>();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      loadInitial();
    });
  }

  loadInitial() async {
    try {
      controller.isLoading.value = true;
      controller.fetchNewsData();
      controller.loadTasksFromStorage();
    } catch (e) {
      debugPrint("Exception : $e");
    } finally {
      controller.isLoading.value = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Quick Task'),
        actions: [
          Obx(() {
            return Row(
              children: [
                const SizedBox(width: AppValues.contentPadding),
                Icon(controller.globalValues.themeMode.value == ThemeMode.dark ? Icons.dark_mode : Icons.light_mode, size: 16),
                const SizedBox(width: AppValues.contentPadding),

                Switch(
                  value: controller.globalValues.themeMode.value == ThemeMode.dark,
                  onChanged: (value) {
                    controller.globalValues.toggleTheme();
                  },
                ),
                const SizedBox(width: AppValues.contentPadding),
              ],
            );
          }),
        ],
      ),
      body: Obx(() {
        return controller.pages[controller.currentTabIndex.value];
      }),
      drawer: HomeDrawerLayout(),
      bottomNavigationBar: Obx(() {
        return BottomNavigationBar(
          currentIndex: controller.currentTabIndex.value,
          onTap: (value) {
            controller.changePage(value);
          },
          items: [
            BottomNavigationBarItem(icon: Icon(controller.currentTabIndex.value == 0 ? Icons.task : Icons.task_outlined), label: 'Task'),
            BottomNavigationBarItem(icon: Icon(controller.currentTabIndex.value == 1 ? Icons.newspaper : Icons.newspaper), label: 'News'),
            BottomNavigationBarItem(
              icon: Icon(controller.currentTabIndex.value == 2 ? Icons.account_circle : Icons.account_circle_outlined),
              label: 'Profile',
            ),
          ],
        );
      }),
    );
  }
}
