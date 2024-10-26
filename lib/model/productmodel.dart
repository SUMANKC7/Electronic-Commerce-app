
class ProductModel {
  int? id;
  String? title;
  double? price;
  double? rating;
  String? thumbnail;

  ProductModel(
    this.id,
    this.title,
    this.price,
    this.rating,
    this.thumbnail,
  );

  ProductModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    price = (json['price'] as num).toDouble(); // Ensures price is a double
    rating = (json['rating'] as num).toDouble(); // Ensures rating is a double
    thumbnail = json['thumbnail'];
  }
}
