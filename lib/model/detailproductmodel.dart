class Detailproductmodel {
  String? productImage;
  int? id;
  double? productPrice;
  String? producttitle;
  String? productDescription;
  double? productRating;
  int? stock;
  String? otherImage;

  Detailproductmodel(
    this.id,
    this.productDescription,
    this.productImage,
    this.productPrice,
    this.productRating,
    this.producttitle,
    this.stock,
    this.otherImage
    );

    Detailproductmodel.fromJson(Map<String,dynamic>json){
       productImage=json["thumbnail"];
       id=json["id"];
       productPrice=json["price"];
       producttitle=json["title"];
       productDescription=json["description"];
       productRating=json["rating"];
       stock=json["stock"];
       otherImage=json["images"];
    }
}
