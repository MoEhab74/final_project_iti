class ProductModel {
  int? id;
  String? title;
  String? slug;
  double? price;
  String? description;
  List<String>? images;
  String? creationAt;
  String? updatedAt;

  ProductModel({
    this.id,
    this.title,
    this.slug,
    this.price,
    this.description,
    this.images,
    this.creationAt,
    this.updatedAt,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'],
      title: json['title'],
      price: (json['price'] as num).toDouble(),
      description: json['description'],
      // category: json['category'],
      images: json['images'] != null
          ? List<String>.from(json['images'] as List<dynamic>)
          : null,
    );
  }
}

List<ProductModel> productModelFromJson(List<dynamic> productsJson) =>
    List<ProductModel>.from(productsJson.map((x) => ProductModel.fromJson(x)));