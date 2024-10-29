class Detailproductmodel {
  String? productImage;
  int? id;
  double? productPrice;
  String? producttitle;
  String? productDescription;
  double? productRating;
  int? stock;
  List<String>? otherImages;  // Adjusted to List<String> to handle array data

  Detailproductmodel({
    this.id,
    this.productDescription,
    this.productImage,
    this.productPrice,
    this.productRating,
    this.producttitle,
    this.stock,
    this.otherImages,
  });

  Detailproductmodel.fromJson(Map<String, dynamic> json) {
    productImage = json["thumbnail"] as String?;
    id = json["id"] as int?;
    productPrice = (json["price"] as num?)?.toDouble();
    producttitle = json["title"] as String?;
    productDescription = json["description"] as String?;
    productRating = (json["rating"] as num?)?.toDouble();
    stock = json["stock"] as int?;
    
    
    if (json["images"] is List) {
      otherImages = List<String>.from(json["images"]);
    } else {
      otherImages = [];
    }
  }
}
