class ProductModel {
  ProductModel({
    this.ratingsQuantity,
    this.id,
    this.title,
    this.description,
    this.quantity,
    this.price,
    this.imageCover,
    this.ratingsAverage,
  });

  ProductModel.fromJson(Map<String, dynamic> json) {
    ratingsQuantity = (json['ratingsQuantity'] as num?)?.toDouble();
    id = json['_id'] ?? json['id'];
    title = json['title'];
    description = json['description'];
    quantity = json['quantity'];
    price = (json['price'] as num?)?.toDouble();
    imageCover = json['imageCover'];
    ratingsAverage = (json['ratingsAverage'] as num?)?.toDouble();
  }

  double? ratingsQuantity;
  String? id;
  String? title;
  String? description;
  int? quantity;
  double? price;
  String? imageCover;
  double? ratingsAverage;


}