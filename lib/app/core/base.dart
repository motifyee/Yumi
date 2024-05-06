import 'dart:collection';

import 'package:yumi/bloc/util/status.dart';

abstract class EntityBase {
  abstract final EntityStatus status;
}

class EntityList<E> extends ListBase<E> {
  final List<E> items;

  const EntityList(this.items) : super();

  final EntityStatus status = const EntityStatus(status: Status.idle);

  @override
  int get length => items.length;

  @override
  set length(int length) {
    items.length = length;
  }

  @override
  void operator []=(int index, E value) {
    items[index] = value;
  }

  @override
  E operator [](int index) => items[index];
}
