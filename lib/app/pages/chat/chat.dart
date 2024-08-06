import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';

@RoutePage()
class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: Center(child: Text('chat')));
  }
}
