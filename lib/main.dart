import 'package:fashion_app/controller/bottom_navigation_controller.dart';
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
    /// MULTI-PROVIDER SETUP
    /// REGISTERING ALL REQUIRED PROVIDERS FOR STATE MANAGEMENT
    return MultiProvider(
      providers: [
        /// PROVIDER FOR MANAGING ITEMS DATA (HOME SCREEN)
        ChangeNotifierProvider(create: (context) => ItemsData()),

        /// PROVIDER FOR MANAGING STATE IN THE DETAILS SCREEN
        ChangeNotifierProvider(create: (context) => DetailsScreenProvider()),

        /// PROVIDER FOR MANAGING CART STATE AND FUNCTIONALITY
        ChangeNotifierProvider(create: (context) => CartScreenProvider()),

        /// PROVIDER FOR MANAGING BOTTOM NAVIGATION BAR STATE
        ChangeNotifierProvider(
            create: (context) => BottomNavigationController()),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: FirstScreen(),
      ),
    );
  }
}
