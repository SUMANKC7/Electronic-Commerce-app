import 'dart:convert';

import 'package:electronic_ecommerce/model/detailproductmodel.dart';
import 'package:http/http.dart' as http;

class DetailproductService {
  Future<List<Detailproductmodel>> getDetailProductData() async {
    List<Detailproductmodel> storeDetailProduct = [];
    String baseURL = "https://dummyjson.com/products/category/";
    try {
      var response = await http.get(Uri.parse(baseURL + "smartphones"));
      if (response.statusCode == 200) {
        var decodeData = jsonDecode(response.body);

        for (var product in decodeData["products"]) {
          storeDetailProduct.add(Detailproductmodel.fromJson(product));
        }
        return storeDetailProduct;
      } else {
        throw Exception("failed to load the product. Code is not 200");
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
