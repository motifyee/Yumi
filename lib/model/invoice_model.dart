import 'package:yumi/model/meal_model.dart';
import 'package:yumi/statics/code_generator.dart';

class InvoiceModel {
  Invoice? invoice;
  List<InvoiceDetails>? invoiceDetails;
  int? bankId;
  int? shippedAddressId;
  bool? isSchedule;
  bool? isPickup;
  bool? isDelivery;
  bool? isPreorder;

  InvoiceModel(
      {this.invoice,
      this.invoiceDetails,
      this.bankId,
      this.shippedAddressId,
      this.isSchedule,
      this.isPickup,
      this.isDelivery,
      this.isPreorder});

  InvoiceModel.fromJson(Map<String, dynamic> json) {
    invoice =
        json['invoice'] != null ? Invoice.fromJson(json['invoice']) : null;
    if (json['invoiceDetails'] != null) {
      invoiceDetails = <InvoiceDetails>[];
      json['invoiceDetails'].forEach((v) {
        invoiceDetails!.add(InvoiceDetails.fromJson(v));
      });
    }
    bankId = json['bankId'];
    shippedAddressId = json['shippedAddressId'];
    isSchedule = json['isSchedule'];
    isPickup = json['is_Pickup'];
    isDelivery = json['is_Delivery'];
    isPreorder = json['is_Preorder'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.invoice != null) {
      data['invoice'] = this.invoice!.toJson();
    }
    if (this.invoiceDetails != null) {
      data['invoiceDetails'] =
          this.invoiceDetails!.map((v) => v.toJson()).toList();
    }
    data['bankId'] = this.bankId;
    data['shippedAddressId'] = this.shippedAddressId;
    data['isSchedule'] = this.isSchedule;
    data['is_Pickup'] = this.isPickup;
    data['is_Delivery'] = this.isDelivery;
    data['is_Preorder'] = this.isPreorder;
    return data;
  }

  InvoiceModel copyWith({
    Invoice? invoice,
    List<InvoiceDetails>? invoiceDetails,
    int? bankId,
    int? shippedAddressId,
    bool? isSchedule,
    bool? isPickup,
    bool? isDelivery,
    bool? isPreorder,
  }) {
    return InvoiceModel(
      invoice: invoice ?? this.invoice,
      bankId: bankId ?? this.bankId,
      invoiceDetails: invoiceDetails ?? this.invoiceDetails,
      isDelivery: isDelivery ?? this.isDelivery,
      isPickup: isDelivery ?? this.isPickup,
      isPreorder: isPreorder ?? this.isPreorder,
      isSchedule: isSchedule ?? this.isSchedule,
      shippedAddressId: shippedAddressId ?? this.shippedAddressId,
    );
  }
}

class Invoice {
  int? createdBy;
  String? chefID;
  String? clientNote;
  String? preparationNotes;
  String? employeeNote;
  double? deliveryCostPrice;
  double? deliveryAreaPrice;
  double? invoiceDiscount;
  double? invoicetax;
  double? finalprice;
  double? totalPrice;
  DateTime? scheduleDate;
  String invoiceCode = CodeGenerator.getRandomCode(codeLength: 15);

  Invoice(
      {this.createdBy,
      this.chefID,
      this.clientNote = '',
      this.preparationNotes = '',
      this.employeeNote = '',
      this.deliveryCostPrice = 4.5,
      this.deliveryAreaPrice = 4.5,
      this.invoiceDiscount = 0.0,
      this.invoicetax = 0.0,
      this.finalprice = 0.0,
      this.totalPrice = 0.0,
      this.scheduleDate});

  Invoice.fromJson(Map<String, dynamic> json) {
    createdBy = json['createdBy'];
    chefID = json['chef_ID'];
    clientNote = json['clientNote'];
    preparationNotes = json['preparationNotes'];
    employeeNote = json['employeeNote'];
    deliveryCostPrice = json['deliveryCostPrice'];
    deliveryAreaPrice = json['deliveryAreaPrice'];
    invoiceDiscount = json['invoiceDiscount'];
    invoicetax = json['invoicetax'];
    finalprice = json['finalprice'];
    totalPrice = json['totalPrice'];
    scheduleDate =
        json['scheduleDate'] ? DateTime.parse(json['scheduleDate']) : null;
    invoiceCode = json['invoiceCode'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    // data['createdBy'] = this.createdBy;
    data['chef_ID'] = this.chefID;
    data['clientNote'] = this.clientNote;
    data['preparationNotes'] = this.preparationNotes;
    data['employeeNote'] = this.employeeNote;
    data['deliveryCostPrice'] = this.deliveryCostPrice;
    data['deliveryAreaPrice'] = this.deliveryAreaPrice;
    data['invoiceDiscount'] = this.invoiceDiscount;
    data['invoicetax'] = this.invoicetax;
    data['finalprice'] = this.finalprice;
    data['totalPrice'] = this.totalPrice;
    data['scheduleDate'] = this.scheduleDate?.toIso8601String();
    data['invoiceCode'] = this.invoiceCode;
    return data;
  }

  Invoice copyWith({
    int? createdBy,
    String? chefID,
    String? clientNote,
    String? preparationNotes,
    String? employeeNote,
    double? deliveryCostPrice,
    double? deliveryAreaPrice,
    double? invoiceDiscount,
    double? invoicetax,
    double? finalprice,
    double? totalPrice,
    DateTime? scheduleDate,
  }) {
    return Invoice(
      chefID: chefID ?? this.chefID,
      clientNote: clientNote ?? this.clientNote,
      createdBy: createdBy ?? this.createdBy,
      deliveryAreaPrice: deliveryAreaPrice ?? this.deliveryAreaPrice,
      deliveryCostPrice: deliveryCostPrice ?? this.deliveryCostPrice,
      employeeNote: employeeNote ?? this.employeeNote,
      finalprice: finalprice ?? this.finalprice,
      invoiceDiscount: invoiceDiscount ?? this.invoiceDiscount,
      invoicetax: invoicetax ?? this.invoicetax,
      preparationNotes: preparationNotes ?? this.preparationNotes,
      totalPrice: totalPrice ?? this.totalPrice,
      scheduleDate: scheduleDate ?? this.scheduleDate,
    );
  }
}

class InvoiceDetails {
  int? productVarintId;
  String? quantity;
  double? productVarintPrice;
  double? discountListId;
  MealModel? meal;

  InvoiceDetails(
      {this.productVarintId,
      this.quantity,
      this.productVarintPrice,
      this.meal,
      this.discountListId = 1205});

  InvoiceDetails.fromMeal({required MealModel meal}) {
    productVarintId = meal.productVariantID;
    quantity = "1";
    productVarintPrice = double.tryParse(meal.price1 ?? '');
    discountListId = 1205;
    this.meal = meal;
  }

  InvoiceDetails.fromJson(Map<String, dynamic> json) {
    productVarintId = json['productVarintId'];
    quantity = json['quantity'];
    productVarintPrice = json['productVarintPrice'];
    discountListId = json['discountListId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['productVarintId'] = this.productVarintId;
    data['quantity'] = this.quantity;
    data['productVarintPrice'] = this.productVarintPrice;
    data['discountListId'] = this.discountListId;
    return data;
  }

  InvoiceDetails copyWith({
    int? productVarintId,
    String? quantity,
    double? productVarintPrice,
    double? discountListId,
  }) {
    return InvoiceDetails(
      discountListId: discountListId ?? this.discountListId,
      productVarintId: productVarintId ?? this.productVarintId,
      productVarintPrice: productVarintPrice ?? this.productVarintPrice,
      quantity: quantity ?? this.quantity,
      meal: this.meal,
    );
  }
}
