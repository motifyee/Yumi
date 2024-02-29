class MealModel {
  String? code;
  String? name;
  String? photo;
  String? price1;
  String? caloriesValue;
  String? preparationTime;
  bool? isOrder;
  bool? isPreOrder;
  String? portionPersons;
  List<int>? categoriesids;
  List<IngredientsModel>? ingredients;

  MealModel(
      {this.code,
      this.name,
      this.photo,
      this.price1,
      this.caloriesValue,
      this.preparationTime,
      this.isOrder,
      this.isPreOrder,
      this.portionPersons,
      this.categoriesids,
      this.ingredients});

  MealModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    name = json['name'];
    photo = json['photo'];
    price1 = json['price1']?.toString();
    caloriesValue = json['calories_value'];
    preparationTime = json['preparation_time'];
    isOrder = json['is_order'];
    isPreOrder = json['is_Pre_Order'];
    portionPersons = json['portion_Persons']?.toString();
    categoriesids = json['categoriesIds']?.cast<int>();
    if (json['ingredients'] != null) {
      ingredients = <IngredientsModel>[];
      json['ingredients'].forEach((v) {
        ingredients!.add(IngredientsModel.fromJson(v));
      });
    }
  }

  MealModel copyWith({
    String? code,
    String? name,
    String? photo,
    String? price1,
    String? caloriesValue,
    String? preparationTime,
    bool? isOrder,
    bool? isPreOrder,
    String? portionPersons,
    List<int>? categoriesids,
    List<IngredientsModel>? ingredients,
  }) {
    return MealModel(
      code: code ?? this.code,
      name: name ?? this.name,
      photo: photo ?? this.photo,
      price1: price1 ?? this.price1,
      caloriesValue: caloriesValue ?? this.caloriesValue,
      preparationTime: preparationTime ?? this.preparationTime,
      isOrder: isOrder ?? this.isOrder,
      isPreOrder: isPreOrder ?? this.isPreOrder,
      portionPersons: portionPersons ?? this.portionPersons,
      categoriesids: categoriesids ?? this.categoriesids,
      ingredients: ingredients ?? this.ingredients,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['name'] = this.name;
    data['photo'] = this.photo;
    data['price1'] = this.price1;
    data['calories_Value'] = this.caloriesValue;
    data['preparation_Time'] = this.preparationTime;
    data['is_Order'] = this.isOrder;
    data['is_Pre_Order'] = this.isPreOrder;
    data['portion_Persons'] = this.portionPersons;
    data['categoriesIds'] = this.categoriesids;
    if (this.ingredients != null) {
      data['ingredients'] = this.ingredients!.map((v) => v.toJson()).toList();
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['code'] = this.code;
    data['name'] = this.name;
    data['portion_Grams'] = this.portionGrams;
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
