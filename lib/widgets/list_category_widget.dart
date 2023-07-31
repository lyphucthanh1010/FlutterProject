import 'package:flutter/material.dart';
//Region Model
import '../models/category.dart';

class ListCategoryWidget extends StatelessWidget {
  final Category category;
  const ListCategoryWidget({Key? key, required this.category})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 8, top: 15),
      width: 90,
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Color(category.colorBegin),
                Color(category.colorEnd),
              ]),
          borderRadius: BorderRadius.circular(8)),
      child: Center(
          child: Text(
        category.category,
        style: const TextStyle(
            color: Colors.white, fontSize: 13, fontWeight: FontWeight.bold),
      )),
    );
  }
}
