import 'dart:convert';
import 'package:electronic_ecommerce/model/productmodel.dart';
import 'package:http/http.dart' as http;

class ProductServices {
  String baseURL = "https://dummyjson.com/products/category/";

  Future<List<ProductModel>> getAllProductData() async {
    List<ProductModel> allproduct = [];
    try {
      var response = await http.get(Uri.parse(baseURL + "smartphones"));
      if (response.statusCode == 200) {
        var decodedData = jsonDecode(response.body);
        print(decodedData);

        for (var product in decodedData["products"]) {
          allproduct.add(ProductModel.fromJson(product));
        }
        return allproduct;
      } else {
        throw Exception("Failed to load products");
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
