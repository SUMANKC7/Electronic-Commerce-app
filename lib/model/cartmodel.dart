import 'package:electronic_ecommerce/model/productmodel.dart';

class Cartmodel {
  final ProductModel product;
  int quantity;

  Cartmodel(
    {
     required this.product,
     this.quantity=1,
    }
  );
}
