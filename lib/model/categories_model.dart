class CategoriesModel {
  int? id;
  String? name;
  String? description;
  String? color;
  String? image;
  bool? isPreOrder;

  CategoriesModel(
      {this.id,
      this.name,
      this.description,
      this.color,
      this.image,
      this.isPreOrder = false});

  CategoriesModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    color = json['color'];
    image = json['image'];
    isPreOrder = json['isPreOrder'] ?? false;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['description'] = this.description;
    data['color'] = this.color;
    data['image'] = this.image;
    data['isPreOrder'] = this.isPreOrder;
    return data;
  }
}
