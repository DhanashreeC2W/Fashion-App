import 'package:fashion_app/controller/items_data.dart';
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
    return ChangeNotifierProvider(
      create: (context) => ItemsData(),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: FirstScreen(),
      ),
    );
  }
}
