import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yumi/global.dart';

mixin CubitX<T> on Cubit<T> {
  Cubit<T> get read => G().rd<Cubit<T>>();

  Cubit<T> get r => read;

  // @override
  // T get state => read.state;
}

mixin BlocX<T, S> on Bloc<T, S> {
  Bloc<T, S> get read => G().read<Bloc<T, S>>();

  Bloc<T, S> get r => read;

  // @override
  // S get state => read.state;

  // @override
  // void add(T event) => read.add(event);

  // // ignore: invalid_use_of_visible_for_testing_member
  // @override
  // void emit(S state) => read.emit(state);
}
