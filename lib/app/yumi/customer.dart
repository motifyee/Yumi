import 'package:common_code/common_code.dart';
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:yumi/core/setup/init.dart';
import 'package:yumi/app/yumi/config/customer/customer_app_config.dart';
import 'package:yumi/app_target.dart';

Future main() async {
  await init();

  Stripe.publishableKey = 'stripePublishableKey';

  AppTarget.user = YumiApp.customers;

  runApp(YumiCustomer(config: CustomerAppConfig()));
}

class YumiCustomer extends StatelessWidget {
  final AppConfig config;

  const YumiCustomer({super.key, required this.config});

  @override
  Widget build(BuildContext context) => App(config: config);
}
