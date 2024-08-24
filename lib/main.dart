import 'package:fashion_app/controller/items_data.dart';
import 'package:fashion_app/view/cart_screen.dart';
import 'package:fashion_app/view/checkout_screen.dart';
import 'package:fashion_app/view/details_screen.dart';
import 'package:fashion_app/view/first_screen.dart';
import 'package:fashion_app/view/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (context) => ItemsData(),
      child: const MaterialApp(
        debugShowCheckedModeBanner:false,
        home: HomeScreen(),
      ),
    );
  }
}
