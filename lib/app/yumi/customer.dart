import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:yumi/core/setup/init.dart';
import 'package:yumi/app/yumi/config/customer/customer_app_config.dart';
import 'package:yumi/app/yumi/config/yumi_app.dart';
import 'package:yumi/app_target.dart';
import 'package:yumi/global.dart';
import 'package:yumi/statics/theme_statics.dart';

Future main() async {
  Stripe.publishableKey = StripeKeys.publishableKey;
  await init();

  AppTarget.user = AppTargetUser.customers;

  runApp(const YumiCustomer());
}

var config = CustomerAppConfig();

class YumiCustomer extends StatelessWidget {
  const YumiCustomer({super.key});

  @override
  Widget build(BuildContext context) {
    return YumiApp(
      config: config,
      builder: (context, child) => _builder(context, child),
    );
  }
}

Widget _builder(context, child) {
  return Builder(
      key: G.builderKey,
      builder: (context) {
        return Container(
          decoration: const BoxDecoration(color: Colors.transparent),
          child: SafeArea(
            child: Container(
              color: ThemeSelector.colors.background,
              child: child ?? const Text(''),
            ),
          ),
        );
      });
}
