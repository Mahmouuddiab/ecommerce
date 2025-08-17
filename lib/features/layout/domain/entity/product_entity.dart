class ProductEntity {
  final String id;
  final String title;
  final String description;
  final double price;
  final double? review;
  final String image;

  ProductEntity({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.review,
    required this.image
  });
}
