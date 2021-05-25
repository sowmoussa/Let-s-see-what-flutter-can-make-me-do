import 'package:flutter/material.dart';

class MealsDetailScreen extends StatelessWidget {
  const MealsDetailScreen({Key key}) : super(key: key);
  static const routeName = "meals-detail";

  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context).settings.arguments as String;
    return Scaffold(
      appBar: AppBar(
        title: Text('$mealId'),
      ),
      body: Center(
        child: Text("Detail"),
      ),
    );
  }
}
