import 'package:flutter/material.dart';

class PaginationTemplate extends StatefulWidget {
  PaginationTemplate(
      {super.key,
      required this.scrollDirection,
      required this.child,
      required this.loadDate});

  Axis scrollDirection;
  Widget child;
  Function loadDate;

  @override
  State<PaginationTemplate> createState() => _PaginationTemplateState();
}

class _PaginationTemplateState extends State<PaginationTemplate> {
  late ScrollController _controller;

  void _scrollListener() {
    if (_controller.position.pixels == _controller.position.maxScrollExtent) {
      widget.loadDate();
    }
  }

  @override
  void initState() {
    super.initState();
    _controller = ScrollController()..addListener(_scrollListener);
    widget.loadDate();
  }

  @override
  void dispose() {
    _controller.removeListener(_scrollListener);
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      controller: _controller,
      scrollDirection: widget.scrollDirection,
      child: widget.child,
    );
  }
}
