import 'package:flutter/material.dart';
import 'package:yumi/template/order_card.dart';

class NewsOrders extends StatelessWidget {
  NewsOrders({super.key, required this.data});

  final data;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Column(
      children: [
        for (var i in data) OrderCard(data: i.toString()),
      ],
    ));
  }
}
