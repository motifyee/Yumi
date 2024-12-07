import 'package:common_code/common_code.dart';
import 'package:common_code/util/global_context.dart';

// const defaultOriginApi = 'https://10.99.77.247:5012';
// const defaultOriginApi = 'https://vroot.tarabia.online';
const defaultOriginApi = 'https://beta.vroot.com:8099';
String originApi = '';

class BaseUrl {
  static Future<void> load() async {
    final value =
        await LocalStorage.sharedRef.getValue(LocalStorage.domainName);

    originApi = value ?? defaultOriginApi;
    APIClient.baseUrl = originApi;
  }

  static void set(String value) {
    if (value.isEmpty) return;

    LocalStorage.sharedRef.setValue(LocalStorage.domainName, value);

    originApi = value;
    APIClient.baseUrl = originApi;
  }
}

class Endpoints {
  factory Endpoints() => _inner;
  static final Endpoints _inner = Endpoints._init();
  Endpoints._init();

  static String getApiKey(String apiKey) {
    return apiKey.replaceAll("_", GlobalContext().appConfig.appTitle);
  }

  static String actionApiKeyString(
      {required String apiKey, required String id}) {
    return apiKey.replaceAll("_", id);
  }

  /// user ( _ ) where
  /// chefs || customers || drivers
  /// at in api end point
  ///

  /// stripe
  String stripeApi = 'https://api.stripe.com/v1';
  String stripePaymentIntent = '/payment_intents';

  final String _login = '/accounts/_/login';
  String get login => getApiKey(_login);
  final String _signup = '/accounts/_/register';
  String get signup => getApiKey(_signup);
  final String _profile = '/accounts/_';
  String get profile => getApiKey(_profile);
  final String _info = '/_';
  String get info => getApiKey(_info);
  String address = '/accounts/address';
  String userStatus = '/accounts/status';
  String notifications = '/notifications';
  String transactions = '/account/transactions';
  String wallet = '/account/balance';

  String categories = '/categories';
  String categoriesForCustomer = '/meals/categories';
  String categoriesForChef = '/meals/categories/chef';
  String categoriesForCustomerByChefId = '/meals/categories/chef';
  String ingredient = '/Product/Ingredients';

  final String _meal = '/Product/_/meal'; //  => chefs
  String get meal => getApiKey(_meal);
  String getMeal = '/meals';
  final String getMealById = '/product/meal/_'; //  => id
  String getMealByCategory = '/meals/category';
  String getMealByChef = '/meals/chef';
  String getMealByChefByCategory = '/meals/category/chef';
  String favoriteMeals = '/meals/favorite';
  final String _mealCalories = '/Product/_/calories';
  String get mealCalories => getApiKey(_mealCalories);

  String chefs = '/accounts/chefs';
  String chefsOrder = '/accounts/chefs/Order';
  String chefsPreOrder = '/accounts/chefs/PreOrder';
  String favoriteChefs = '/accounts/favorite';
  String favoriteChef = '/accounts/favorit';
  String chefStatus = '/accounts/WorkStatus';

  String preOrderDelivery = '/preorder/delivery';
  String preOrderPickUp = '/preorder/pickup';
  String orderDelivery = '/order/delivery';
  String orderPickUp = '/order/pickup';
  String order = '/order';
  String voucher = '/Voucher/CheckVoucherValidation';

  // get order && get preOrder X(
  String preOrderCustomerActive = '/preorder/customer/active';
  String preOrderCustomerClosed = '/preorder/customer/closed';
  String orderCustomerActive = '/order/customer/active';
  String orderCustomerClosed = '/order/customer/closed';
  String orderDriverAvailable = '/order/driver/available';
  String orderDriverActive = '/order/driver/active';
  String orderDriverClosed = '/order/driver/closed';
  String preOrderDriverAvailable = '/preorder/driver/available';
  String preOrderDriverActive = '/preorder/driver/active';
  String preOrderDriverClosed = '/preorder/driver/closed';
  String orderDriverAvailableById = '/order/driver/available/';
  String orderChefReceived = '/order/chef/received';
  String orderChefPreparing = '/order/chef/preparing';
  String orderChefReady = '/order/chef/ready';
  String orderChefClosed = '/order/chef/closed';
  String preOrderChefReceived = '/preorder/chef/received';
  String preOrderChefAccepted = '/preorder/chef/accepted';
  String preOrderChefPreparing = '/preorder/chef/preparing';
  String preOrderChefReady = '/preorder/chef/ready';
  String preOrderChefClosed = '/preorder/chef/closed';

  // action order && preOrder
  /// replace ( _ ) with order id
  final String orderDriverAccept = '/order/_/driver/accept'; // id
  final String orderDriverReceived = '/order/_/driver/received'; // id
  String orderDriverDelivered = '/order/delivery/driver/delivered';
  final String preOrderDriverAccept = '/preorder/_/driver/accept'; // id
  final String preOrderDriverReceived = '/preorder/_/driver/received'; // id
  final String preOrderDriverDelivered =
      '/preorder/delivery/driver/delivered'; // id

  final String orderChefDeliveryStart = '/order/_/chef/start'; // id
  final String orderChefDeliveryFinished = '/order/_/chef/finished'; // id
  final String orderChefPickUpStart = '/order/_/chef/pickup/start'; // id
  final String orderChefPickUpFinished = '/order/_/chef/pickup/finished'; // id
  String orderChefPickUpDelivered = '/order/pickup/chef/delivered';

  final String preOrderChefDeliveryAccept = '/preorder/_/chef/accept'; // id
  final String preOrderChefDeliveryStart = '/preorder/_/chef/start'; // id
  final String preOrderChefDeliveryFinished = '/preorder/_/chef/finished'; // id
  final String preOrderChefPickUpAccept =
      '/preorder/_/chef/pickup/accept'; // id
  final String preOrderChefPickUpStart = '/preorder/_/chef/pickup/start'; // id
  final String preOrderChefPickUpFinished =
      '/preorder/_/chef/pickup/finished'; // id
  String preOrderChefPickUpDelivered = '/preorder/pickup/chef/delivered';

  // customers
  String waitChefOrder = '/order/wait/chef';
  String cancelChefOrder = '/order/cancel/chef';
  String waitDriverOrder = '/order/wait/driver';
  String cancelDriverOrder = '/order/cancel/driver';

  // chef
  String preorderCancelChefDelivery = '/preorder/cancel/chef/delivery';
  String preorderCancelChefPickup = '/preorder/cancel/chef/pickup';

  final String _updateInvoice = '/api/Invoices/UpdateRestaurantInvoice/_/48';
  String get updateInvoice => getApiKey(_updateInvoice);

  String review = '/accounts/review';
}
