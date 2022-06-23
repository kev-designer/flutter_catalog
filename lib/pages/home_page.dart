import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const int days = 30;
    const String name = "Keval Gadhiya";
    return Scaffold(
      appBar: AppBar(
        title: const Text("Catalog App"),
      ),
      body: const Center(
        child: Text("Welcom to $days days of Flutter by $name"),
      ),
    );
  }
}
