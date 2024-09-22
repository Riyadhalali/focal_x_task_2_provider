import 'package:flutter/material.dart';
import 'package:focal_x_task_2_provider/views/product_screen/controller/product_controller.dart';
import 'package:focal_x_task_2_provider/views/product_screen/screen/product_screen.dart';
import 'package:provider/provider.dart';
import 'core/service/my_services.dart';
import 'core/service/routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
            create: (context) =>
                ProductController()), // Register ProductController
        ChangeNotifierProvider(
            create: (context) => MyService()), // Register MyService
      ],
      child: Consumer<MyService>(
        builder: (context, myService, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',
            themeMode: myService.themeMode, // Use themeMode from MyService
            initialRoute:
                Routes.productScreen, // Initial route using custom routing
            routes: {
              Routes.productScreen: (context) =>
                  ProductListView(), // Define ProductListView route
            },
          );
        },
      ),
    );
  }
}
