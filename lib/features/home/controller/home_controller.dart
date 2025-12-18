import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/list_notifier.dart';
import 'package:get_storage/get_storage.dart';
import 'package:gitrepoexample/core/routes/route.dart';
import 'package:gitrepoexample/core/widgets/widget_text_field.dart';
import 'package:gitrepoexample/features/home/model/article_model.dart';
import 'package:gitrepoexample/features/home/model/task_model.dart';
import 'package:gitrepoexample/features/home/view/tab_news_view.dart';
import 'package:gitrepoexample/features/home/view/tab_profile_view.dart';
import 'package:gitrepoexample/features/home/view/tab_task_view.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import '../../../core/api/api_endpoint.dart';
import '../../../core/values/app_values.dart';
import '../../../core/widgets/widget_button.dart';
import '/core/values/global_values.dart';
import 'package:get/get.dart';
import 'package:uuid/uuid.dart'; // For unique IDs

class HomeController extends GetxController {
  final GlobalValues globalValues = Get.find();
  final GetStorage _box = GetStorage();
  var isLoading = false.obs;
  var articles = <ArticleModel>[].obs;
  var articleDetails = ArticleModel().obs;

  final String _tasksKey = 'tasks_list';
  var tasks = <TaskModel>[].obs;
  TextEditingController taskTitle = TextEditingController();
  var taskPriority = 0.obs;
  final List<int> _options = [0, 1, 2];

  @override
  void onInit() {
    super.onInit();
  }

  var currentTabIndex = 0.obs;
  final List<Widget> pages = [const TabTaskView(), const TabNewsView(), const TabProfileView()];

  void changePage(int index) {
    currentTabIndex.value = index;
  }

  Future<void> fetchNewsData() async {
    try {
      isLoading.value = true;

      final response = await http.get(
        Uri.parse(
          'https://newsapi.org/v2/everything',
        ).replace(queryParameters: {'apiKey': '9cdf2fadc02b40bea0bbd7555af76d55', 'domains': 'techcrunch.com,thenextweb.com'}),
        headers: {'Content-Type': 'application/json', 'accept': 'application/json'},
      );

      debugPrint('${response.request}');
      //debugPrint('Response body : ${response.body}');
      //debugPrint("Status Code : ${response.statusCode}");

      if (response.statusCode == 200) {
        final responseBody = jsonDecode(response.body);

        final List<dynamic> data = responseBody['articles'] as List<dynamic>;

        articles.clear();
        for (var element in data) {
          articles.add(ArticleModel.fromJson(element));
        }
      } else {
        //final responseBody = jsonDecode(response.body);
      }
    } on SocketException {
      debugPrint("SocketException");

      return;
    } on HttpException {
      debugPrint("HttpException");
      return;
    } on FormatException {
      debugPrint("FormatException");
      return;
    } on TimeoutException {
      debugPrint("TimeoutException");
      return;
    } catch (e) {
      debugPrint("Exception : $e");
      rethrow;
    } finally {
      isLoading.value = false;
    }
  }

  void setArticleDetails(ArticleModel article) {
    articleDetails.value = article;
    Get.toNamed(RouteService.articleDetailsView);
  }

  Color getPriorityColor(TaskModel task) {
    switch (task.priority) {
      case 0:
        return Colors.green.shade100;
      case 2:
        return Colors.red.shade100;
      default:
        return Colors.orange.shade100;
    }
  }

  void loadTasksFromStorage() {
    final savedTasks = _box.read<List<dynamic>>(_tasksKey);

    if (savedTasks != null) {
      tasks.assignAll(savedTasks.map((json) => TaskModel.fromJson(Map<String, dynamic>.from(json))).toList());
    }
  }

  void addTask({
    required String title,
    String? description,
    DateTime? dueDate,
    required int priority, // 0: Low, 1: Medium, 2: High
  }) {
    final newTask = TaskModel(
      id: const Uuid().v4(),
      // Generate unique ID
      title: title.trim(),
      description: description?.trim(),
      dueDate: dueDate,
      priority: priority,
      isCompleted: false,
    );

    tasks.add(newTask);
    _saveTasksToStorage(); // Save to storage
    Get.back();
  }

  void _saveTasksToStorage() {
    _box.write(_tasksKey, tasks.map((task) => task.toJson()).toList());
  }

  void toggleComplete(String id) {
    final task = tasks.firstWhere((t) => t.id == id);
    task.isCompleted = !task.isCompleted;
    tasks.refresh();
  }

  void updateTask(TaskModel updatedTask) {
    final index = tasks.indexWhere((t) => t.id == updatedTask.id);
    if (index != -1) {
      tasks[index] = updatedTask;
      tasks.refresh();
      _saveTasksToStorage();
    }
  }

  void deleteTask(String id) {
    tasks.removeWhere((t) => t.id == id);
    _saveTasksToStorage(); // Save to storage
  }

  void openTaskSheet() {
    taskTitle.clear();
    taskPriority.value = 0;

    Get.bottomSheet(
      isScrollControlled: true,
      Container(
        decoration: BoxDecoration(
          color: globalValues.themeMode.value == ThemeMode.dark ? Colors.black : Colors.white,
          borderRadius: BorderRadiusGeometry.only(
            topRight: Radius.circular(AppValues.parentCornerRadius),
            topLeft: Radius.circular(AppValues.parentCornerRadius),
          ),
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(AppValues.contentPadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Center(
                  child: Container(
                    width: MediaQuery.of(Get.context!).size.width * 0.2,
                    height: 6,
                    decoration: BoxDecoration(color: Colors.grey.shade300, borderRadius: BorderRadiusGeometry.circular(AppValues.parentCornerRadius)),
                  ),
                ),
                SizedBox(height: AppValues.contentPadding),
                Text('Add Task', style: Theme.of(Get.context!).textTheme.labelLarge!.copyWith(fontFamily: 'FontBold')),

                SizedBox(height: AppValues.contentPadding * 2),

                WidgetTextField(controller: taskTitle, label: 'Title'),

                SizedBox(height: AppValues.contentPadding),
                Obx(() {
                  return Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadiusGeometry.circular(AppValues.childCornerRadius),
                      border: Border.all(color: globalValues.themeMode.value == ThemeMode.dark ? Colors.white24 : Colors.black12),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: AppValues.contentPadding),
                      child: DropdownButton<int>(
                        underline: SizedBox(),
                        value: taskPriority.value,
                        hint: const Text('Set priority'),
                        // Shown if value is null
                        isExpanded: true,
                        items: _options.map((int value) {
                          return DropdownMenuItem<int>(
                            value: value,
                            child: Text(
                              value == 2
                                  ? 'High'
                                  : value == 0
                                  ? 'Low'
                                  : 'Medium',
                            ),
                          );
                        }).toList(),
                        onChanged: (int? newValue) {
                          taskPriority.value = newValue ?? 0;
                        },
                      ),
                    ),
                  );
                }),
                SizedBox(height: AppValues.contentPadding * 4),
                Obx(() {
                  return SizedBox(
                    width: double.infinity,
                    child: WidgetButton(
                      isLoading: isLoading.value,
                      buttonColor: Colors.green,
                      label: 'Add',
                      labelColor: Colors.white,
                      icon: Icons.save,
                      iconColor: Colors.white,

                      onPressed: () async {
                        addTask(title: taskTitle.text, priority: taskPriority.value);

                        Get.back();
                      },
                    ),
                  );
                }),

                SizedBox(height: MediaQuery.of(Get.context!).padding.bottom + AppValues.contentPadding + kToolbarHeight),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
