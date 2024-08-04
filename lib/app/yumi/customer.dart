import 'package:common_code/common_code.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:yumi/core/setup/init.dart';
import 'package:yumi/app/yumi/config/customer/customer_app_config.dart';
import 'package:yumi/app_target.dart';

Future main() async {
  Stripe.publishableKey = StripeKeys.publishableKey;
  await init();

  AppTarget.user = YumiApp.customers;
  runApp(
    BlocProvider(
      create: (context) => AppCubit(CustomerAppConfig()),
      child: const YumiCustomerApp(),
    ),
  );
}

class YumiCustomerApp extends StatelessWidget {
  const YumiCustomerApp({super.key});

  @override
  Widget build(BuildContext context) => const App();
}
