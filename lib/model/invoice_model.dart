import 'package:yumi/model/meal_model.dart';
import 'package:yumi/statics/code_generator.dart';

class InvoiceModel {
  int? id;
  Invoice? invoice;
  List<InvoiceDetails>? invoiceDetails;
  int? bankId;
  int? shippedAddressId;
  bool? isSchedule;
  bool? isPickup;
  bool? isDelivery;
  bool? isPreorder;

  InvoiceModel({
    this.id,
    this.invoice,
    this.invoiceDetails,
    this.bankId = 44,
    this.shippedAddressId,
    this.isSchedule,
    this.isPickup = false,
    this.isDelivery = true,
    this.isPreorder,
  });

  InvoiceModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
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
    if (this.id != null) {
      data['id'] = this.id;
    }
    if (this.invoice != null) {
      data['invoice'] = this.invoice!.toJson();
    }
    if (this.invoiceDetails != null) {
      data['invoiceDetails'] =
          this.invoiceDetails!.map((v) => v.toJson()).toList();
    }
    if (this.bankId != null) data['bankId'] = this.bankId;
    if (this.shippedAddressId != null)
      data['shippedAddressId'] = this.shippedAddressId;
    if (this.isSchedule != null) data['isSchedule'] = this.isSchedule;
    if (this.isPickup != null) data['is_Pickup'] = this.isPickup;
    if (this.isDelivery != null) data['is_Delivery'] = this.isDelivery;
    if (this.isPreorder != null) data['is_Preorder'] = this.isPreorder;
    return data;
  }

  InvoiceModel copyWith({
    int? id,
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
      id: id ?? this.id,
      invoice: invoice ?? this.invoice,
      bankId: bankId ?? this.bankId,
      invoiceDetails: invoiceDetails ?? this.invoiceDetails,
      isDelivery: isDelivery ?? this.isDelivery,
      isPickup: isPickup ?? this.isPickup,
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
  double? invoiceTax;
  double? finalPrice;
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
      this.invoiceTax = 0.0,
      this.finalPrice = 0.0,
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
    invoiceTax = json['invoicetax'];
    finalPrice = json['finalprice'];
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
    data['invoicetax'] = this.invoiceTax;
    data['finalprice'] = this.finalPrice;
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
    double? invoiceTax,
    double? finalPrice,
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
      finalPrice: finalPrice ?? this.finalPrice,
      invoiceDiscount: invoiceDiscount ?? this.invoiceDiscount,
      invoiceTax: invoiceTax ?? this.invoiceTax,
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
  int? discountListId;
  MealModel? meal;
  String? note;

  InvoiceDetails({
    this.productVarintId,
    this.quantity,
    this.productVarintPrice,
    this.meal,
    this.note = '',
    this.discountListId = 1205,
  });

  InvoiceDetails.fromMeal({required MealModel meal}) {
    productVarintId = meal.productVariantID;
    quantity = "1";
    productVarintPrice = double.tryParse(meal.price1 ?? '');
    discountListId = 1205;
    note = '';
    this.meal = meal;
  }

  InvoiceDetails.fromJson(Map<String, dynamic> json) {
    productVarintId = json['productVarintId'];
    quantity = json['quantity'];
    productVarintPrice = json['productVarintPrice'];
    discountListId = json['discountListId'];
    note = json['note'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['productVarintId'] = this.productVarintId;
    data['quantity'] = this.quantity;
    data['productVarintPrice'] = this.productVarintPrice;
    data['discountListId'] = this.discountListId;
    data['note'] = this.note;
    return data;
  }

  InvoiceDetails copyWith({
    int? productVarintId,
    String? quantity,
    double? productVarintPrice,
    int? discountListId,
    String? note,
  }) {
    return InvoiceDetails(
      discountListId: discountListId ?? this.discountListId,
      productVarintId: productVarintId ?? this.productVarintId,
      productVarintPrice: productVarintPrice ?? this.productVarintPrice,
      quantity: quantity ?? this.quantity,
      note: note ?? this.note,
      meal: this.meal,
    );
  }
}
