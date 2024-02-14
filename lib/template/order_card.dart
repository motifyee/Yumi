import 'package:flutter/material.dart';

class OrderCard extends StatelessWidget {
  const OrderCard({super.key, required this.data});

  final data;

  @override
  Widget build(BuildContext context) {
    return Center(child: Text('Card' + data));
  }
}
