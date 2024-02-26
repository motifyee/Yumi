class MealModel {
  String? code;
  String? name;
  String? photo;
  int? price1;
  int? caloriesValue;
  int? preparationTime;
  bool? isOrder;
  bool? isPreOrder;
  int? portionPersons;
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
    code = json['Code'];
    name = json['Name'];
    photo = json['Photo'];
    price1 = json['Price1'];
    caloriesValue = json['calories_value'];
    preparationTime = json['preparation_time'];
    isOrder = json['Is_order'];
    isPreOrder = json['Is_Pre_order'];
    portionPersons = json['Portion Persons'];
    categoriesids = json['Categoriesids'].cast<int>();
    if (json['Ingredients'] != null) {
      ingredients = <IngredientsModel>[];
      json['Ingredients'].forEach((v) {
        ingredients!.add(new IngredientsModel.fromJson(v));
      });
    }
  }

  MealModel copyWith({
    String? code,
    String? name,
    String? photo,
    int? price1,
    int? caloriesValue,
    int? preparationTime,
    bool? isOrder,
    bool? isPreOrder,
    int? portionPersons,
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
    data['Code'] = this.code;
    data['Name'] = this.name;
    data['Photo'] = this.photo;
    data['Price1'] = this.price1;
    data['calories_value'] = this.caloriesValue;
    data['preparation_time'] = this.preparationTime;
    data['Is_order'] = this.isOrder;
    data['Is_Pre_order'] = this.isPreOrder;
    data['Portion Persons'] = this.portionPersons;
    data['Categoriesids'] = this.categoriesids;
    if (this.ingredients != null) {
      data['Ingredients'] = this.ingredients!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class IngredientsModel {
  String? id;
  String? code;
  String? name;
  int? portionGrams;

  IngredientsModel({this.id, this.code, this.portionGrams, this.name});

  IngredientsModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    code = json['code'];
    name = json['name'];
    portionGrams = json['Portion_grams'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['code'] = this.code;
    data['name'] = this.name;
    data['Portion_grams'] = this.portionGrams;
    return data;
  }

  IngredientsModel copyWith(
      {String? id, String? code, String? name, int? portionGrams}) {
    return IngredientsModel(
      id: id ?? this.id,
      code: code ?? this.code,
      name: name ?? this.name,
      portionGrams: portionGrams ?? this.portionGrams,
    );
  }
}
