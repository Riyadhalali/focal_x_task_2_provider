import 'package:focal_x_task_2_provider/views/home_screen/screen/home_screen.dart';
import 'package:get/get.dart';
import 'views/product_screen/screen/product_screen.dart';

List<GetPage<dynamic>>? routes = [
  GetPage(name: "/homeScreen", page: () => const HomeScreen()),
  GetPage(name: "/productScreen", page: () => ProductListView()),
];
