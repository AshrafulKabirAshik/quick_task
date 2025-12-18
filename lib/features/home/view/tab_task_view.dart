import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gitrepoexample/core/values/app_values.dart';

import '../controller/home_controller.dart';

class TabTaskView extends StatelessWidget {
  const TabTaskView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<HomeController>();

    return Scaffold(
      body: Obx(() {
        return controller.tasks.isEmpty
            ? Center(
                child: Text(
                  'No Task Available',
                  style: Theme.of(context).textTheme.labelMedium!.copyWith(color: Colors.grey, fontFamily: 'FontBold'),
                ),
              )
            : ListView.builder(
                padding: const EdgeInsets.all(AppValues.contentPadding),
                itemCount: controller.tasks.length,
                itemBuilder: (context, index) {
                  final task = controller.tasks[index];
                  return Obx(() {
                    final isDark = controller.globalValues.themeMode.value == ThemeMode.dark;
                    return Card(
                      color: isDark ? Colors.black12 : Colors.grey.shade100,
                      elevation: 0,
                      margin: const EdgeInsets.only(bottom: AppValues.contentPadding),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(AppValues.parentCornerRadius),
                        side: BorderSide(color: isDark ? Colors.black26 : Colors.grey.shade300),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(AppValues.contentPadding),
                        child: Row(
                          children: [
                            Checkbox(
                              value: task.isCompleted,
                              onChanged: (value) {
                                controller.toggleComplete(task.id);
                                controller.updateTask(task.copyWith(isCompleted: value));
                              },
                            ),
                            const SizedBox(width: 12),

                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    task.title,
                                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                                      decoration: task.isCompleted ? TextDecoration.lineThrough : null,
                                      decorationThickness: 3,
                                      decorationColor: isDark ? Colors.white : Colors.black,
                                      color: isDark ? Colors.white : Colors.black,
                                    ),
                                  ),
                                  if (task.description != null && task.description!.isNotEmpty)
                                    Padding(
                                      padding: const EdgeInsets.only(top: 4),
                                      child: Text(
                                        task.description!,
                                        style: Theme.of(
                                          context,
                                        ).textTheme.bodyMedium?.copyWith(color: Theme.of(context).colorScheme.onSurfaceVariant),
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                  const SizedBox(height: 8),
                                  Row(
                                    children: [
                                      Container(
                                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                                        decoration: BoxDecoration(
                                          color: isDark
                                              ? controller.getPriorityColor(task).withAlpha(50)
                                              : controller.getPriorityColor(task).withAlpha(100),
                                          borderRadius: BorderRadius.circular(12),
                                        ),
                                        child: Text(
                                          task.priority == 2
                                              ? 'High'
                                              : task.priority == 0
                                              ? 'Low'
                                              : 'Medium',
                                          style: TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.bold,
                                            color: task.priority == 2
                                                ? Colors.red.shade800
                                                : task.priority == 0
                                                ? Colors.green.shade800
                                                : Colors.orange.shade800,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),

                            // Trailing Arrow
                            IconButton(
                              icon: Icon(Icons.delete, color: Colors.redAccent),
                              onPressed: () {
                                controller.deleteTask(task.id);
                              },
                            ),
                          ],
                        ),
                      ),
                    );
                  });
                },
              );
      }),
      floatingActionButton: Obx(() {
        final isDark = controller.globalValues.themeMode.value == ThemeMode.dark;
        return FloatingActionButton(
          child: Icon(Icons.add, color: isDark ? Colors.black : Colors.white),

          onPressed: () {
            controller.openTaskSheet();
          },
        );
      }),
    );
  }
}
