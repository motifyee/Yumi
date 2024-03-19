import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

part 'event.dart';
part 'state.dart';
part 'bloc.freezed.dart';

class RegisterationBloc extends Bloc<RegisterationEvent, RegisterationState> {
  RegisterationBloc() : super(const RegisterationState()) {
    on<RegisterationEvent>(
      (event, emit) async {
        event.map(
            init: (_init value) {},
            loading: (_loading value) {},
            loaded: (_loaded value) {},
            next: (_next value) {});
      },
    );
  }
}
