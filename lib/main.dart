import 'package:fashion_app/controller/cart_screen_controller.dart';
import 'package:fashion_app/controller/details_screen_controller.dart';
import 'package:fashion_app/controller/home_screen_controller.dart';
import 'package:fashion_app/view/first_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    ///PROVIDER
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ItemsData()),
        ChangeNotifierProvider(create: (context) => DetailsScreenProvider()),
        ChangeNotifierProvider(create: (context) => CartScreenProvider())
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: FirstScreen(),
      ),
    );
  }
}
