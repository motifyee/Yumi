class MealModel {
  int? id;
  int? productVariantID;
  String? chefId;
  String? code;
  String? name;
  String? photo;
  String? price1;
  String? caloriesValue;
  String? preparationTime;
  bool? isOrder;
  bool? isPreOrder;
  bool? isPickUpOnly;
  String? portionPersons;
  List<int>? categoriesids;
  List<IngredientsModel>? ingredients;
  bool? isFavorite;

  MealModel({
    this.id,
    this.productVariantID,
    this.chefId,
    this.code,
    this.name,
    this.photo,
    this.price1,
    this.caloriesValue,
    this.preparationTime,
    this.isOrder,
    this.isPreOrder,
    this.isPickUpOnly,
    this.portionPersons,
    this.categoriesids,
    this.ingredients,
    this.isFavorite = false,
  });

  MealModel copyWith({
    int? id,
    int? productVariantID,
    String? chefId,
    String? code,
    String? name,
    String? photo,
    String? price1,
    String? caloriesValue,
    String? preparationTime,
    bool? isOrder,
    bool? isPreOrder,
    bool? isPickUpOnly,
    String? portionPersons,
    List<int>? categoriesids,
    List<IngredientsModel>? ingredients,
    bool? isFavorite,
  }) {
    return MealModel(
      id: id ?? this.id,
      productVariantID: productVariantID ?? this.productVariantID,
      chefId: chefId ?? this.chefId,
      code: code ?? this.code,
      name: name ?? this.name,
      photo: photo ?? this.photo,
      price1: price1 ?? this.price1,
      caloriesValue: caloriesValue ?? this.caloriesValue,
      preparationTime: preparationTime ?? this.preparationTime,
      isOrder: isOrder ?? this.isOrder,
      isPreOrder: isPreOrder ?? this.isPreOrder,
      isPickUpOnly: isPickUpOnly ?? this.isPickUpOnly,
      portionPersons: portionPersons ?? this.portionPersons,
      categoriesids: categoriesids ?? this.categoriesids,
      ingredients: ingredients ?? this.ingredients,
      isFavorite: isFavorite ?? this.isFavorite,
    );
  }

  MealModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    productVariantID = json['productVariantID'];
    chefId = json['chefId'];
    code = json['code'];
    name = json['name'];
    photo = json['photo'];
    price1 = json['price1']?.toString();
    caloriesValue = json['calories_Value']?.toString();
    preparationTime = json['preparation_time']?.toString();
    isOrder = json['is_Order'];
    isPreOrder = json['is_Pre_Order'];
    isPickUpOnly = json['pickup_Only'];
    portionPersons = json['portion_Persons']?.toString();
    categoriesids = json['categoriesIds']?.cast<int>();
    isFavorite = json['isFavorite'];
    if (json['ingredients'] != null) {
      ingredients = <IngredientsModel>[];
      json['ingredients'].forEach((v) {
        ingredients!.add(IngredientsModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson({bool? showID}) {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (showID == true) {
      data['id'] = id;
      data['productVariantID'] = productVariantID;
    }
    data['chefId'] = chefId;
    data['code'] = code;
    data['name'] = name;
    data['photo'] = photo;
    data['price1'] = price1;
    data['calories_Value'] = caloriesValue;
    data['preparation_Time'] = preparationTime;
    data['is_Order'] = isOrder;
    data['is_Pre_Order'] = isPreOrder;
    data['pickup_Only'] = isPickUpOnly;
    data['portion_Persons'] = portionPersons;
    data['categoriesIds'] = categoriesids;
    if (ingredients != null) {
      data['ingredients'] = ingredients!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class IngredientsModel {
  String? id;
  String? code;
  String? name;
  double? portionGrams;

  IngredientsModel({this.id, this.code, this.portionGrams, this.name});

  IngredientsModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    code = json['code'];
    name = json['name'];
    portionGrams = json['portion_Grams'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['code'] = code;
    data['name'] = name;
    data['portion_Grams'] = portionGrams;
    return data;
  }

  IngredientsModel copyWith(
      {String? id, String? code, String? name, double? portionGrams}) {
    return IngredientsModel(
      id: id ?? this.id,
      code: code ?? this.code,
      name: name ?? this.name,
      portionGrams: portionGrams ?? this.portionGrams,
    );
  }
}

enum MenuTarget { order, preOrder }
