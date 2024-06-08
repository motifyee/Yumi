import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yumi/bloc/user/user_bloc.dart';
import 'package:yumi/model/meal_model.dart';
import 'package:yumi/template/customer_news.dart';

class CustomerMenuScreen extends StatelessWidget {
  const CustomerMenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    print('user ............................................');
    print(context.read<UserBloc>().state.address?.toJson());
    print(context.read<UserBloc>().state.user.toJson());
    return CustomerNews(
      menuTarget: MenuTarget.order,
    );
  }
}
