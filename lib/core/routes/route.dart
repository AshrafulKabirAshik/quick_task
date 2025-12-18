import '../../features/home/view/tab_news_details_view.dart';
import '/features/home/view/home_view.dart';
import 'package:get/get.dart';
import '/features/home/bindings.dart';

class RouteService {
  static const homeView = '/home';
  static const articleDetailsView = '/article-details';

  static final pages = [
    GetPage(name: homeView, page: () => const HomeView(), binding: HomeBinding()),
    GetPage(name: articleDetailsView, page: () => const TabNewsDetailsView(), binding: HomeBinding()),
  ];
}
