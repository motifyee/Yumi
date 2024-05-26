import 'package:flutter/material.dart';
import 'package:yumi/app/core/setup/signalr.dart';

class PaginationTemplate extends StatefulWidget {
  PaginationTemplate({
    super.key,
    required this.scrollDirection,
    required this.child,
    required this.loadDate,
    this.controller,
    this.signalRListener,
    this.signalRFun,
  });

  Axis scrollDirection;
  Widget child;
  Function loadDate;
  ScrollController? controller;
  List<Signals>? signalRListener;
  bool Function(dynamic message)? signalRFun;

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

  void _signalRListener() {
    for (var i = 0; i < widget.signalRListener!.length; i++) {
      Signalr.on<Signals>(widget.signalRListener![i], (p0) {
        bool isReset = false;
        if (widget.signalRFun != null) isReset = widget.signalRFun!(p0);
        if (isReset) {
          widget.loadDate();
        }
      });
    }
  }

  void _signalRRemove() {
    for (var i = 0; i < widget.signalRListener!.length; i++) {
      Signalr.off(widget.signalRListener![i]);
    }
  }

  @override
  void initState() {
    super.initState();
    _controller = (widget.controller ?? ScrollController())
      ..addListener(_scrollListener);
    widget.loadDate();
    if (widget.signalRListener != null) _signalRListener();
  }

  @override
  void dispose() {
    _controller.removeListener(_scrollListener);
    _controller.dispose();
    if (widget.signalRListener != null) _signalRRemove();
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
