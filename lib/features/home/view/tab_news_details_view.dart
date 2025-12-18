import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gitrepoexample/core/values/app_values.dart';
import 'package:intl/intl.dart';

import '../controller/home_controller.dart';

class TabNewsDetailsView extends StatelessWidget {
  const TabNewsDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<HomeController>();

    final article = controller.articleDetails.value;

    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(AppValues.contentPadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(borderRadius: BorderRadiusGeometry.circular(AppValues.parentCornerRadius)),
                  child: Image.network(
                    article.urlToImage ?? '',
                    width: MediaQuery.of(context).size.width,
                    fit: BoxFit.cover,
                    loadingBuilder: (context, child, loadingProgress) {
                      if (loadingProgress == null) {
                        return child;
                      }
                      return Container(
                        height: MediaQuery.of(context).size.height * 0.3,
                        width: MediaQuery.of(context).size.width,
                        color: Colors.grey[200],
                        child: const Center(child: Icon(Icons.image, color: Colors.grey)),
                      );
                    },
                    errorBuilder: (context, child, loadingProgress) {
                      return Container(
                        height: MediaQuery.of(context).size.height * 0.3,
                        width: MediaQuery.of(context).size.width,
                        color: Colors.red[200],
                        child: const Center(child: Icon(Icons.image_not_supported, color: Colors.red)),
                      );
                    },
                  ),
                ),
                SizedBox(height: AppValues.contentPadding),
                Text(
                  '${article.source?.name ?? ''} . ${DateFormat('dd MMM yyyy').format(DateTime.parse(article.publishedAt ?? ''))}',
                  style: Theme.of(context).textTheme.labelMedium!.copyWith(color: Colors.grey, fontFamily: 'FontBold'),
                ),
                SizedBox(height: AppValues.contentPadding / 2),
                Obx(() {
                  return Text(
                    article.title ?? '',
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      color: controller.globalValues.themeMode.value == ThemeMode.dark ? Colors.white : Colors.black,
                      fontFamily: 'FontBold',
                    ),
                  );
                }),
                SizedBox(height: AppValues.contentPadding / 2),
                Text(
                  article.author ?? '',
                  style: Theme.of(context).textTheme.labelMedium!.copyWith(color: Colors.grey, fontFamily: 'FontBold'),
                ),
                SizedBox(height: AppValues.contentPadding / 2),

                Obx(() {
                  return Text(
                    article.content ?? '',
                    style: Theme.of(
                      context,
                    ).textTheme.labelMedium!.copyWith(color: controller.globalValues.themeMode.value == ThemeMode.dark ? Colors.white : Colors.black),
                  );
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
