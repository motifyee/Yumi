import 'package:common_code/util/global_context.dart';
import 'package:yumi/app_target.dart';

extension GX on GlobalContext {
  bool get isChefApp => appConfig.appTitle == YumiApp.chefs.name;
  bool get isDriverApp => appConfig.appTitle == YumiApp.drivers.name;
  bool get isCustomerApp => appConfig.appTitle == YumiApp.customers.name;
}

typedef G = GlobalContext;
