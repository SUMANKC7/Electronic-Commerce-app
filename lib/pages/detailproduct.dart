import 'package:electronic_ecommerce/services/product_services.dart';
import 'package:flutter/material.dart';
import 'package:electronic_ecommerce/model/detailproductmodel.dart';


// ignore: must_be_immutable
class DetailPage extends StatelessWidget {
  final int productId;

  const DetailPage({
    super.key,
    required this.productId,
  });

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Detailproductmodel>(
      future: ProductServices().getProductById(productId),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: Image.asset("assests/images/loading.gif"),
          );
        } else if (snapshot.hasData) {
          // Here we correctly use snapshot.data as a single instance of Detailproductmodel
          var product = snapshot.data!; // Use snapshot.data directly

          return Scaffold(
            appBar: AppBar(
              title: Center(child: Text("Product Details")),
              actions: [
                IconButton(onPressed: () {}, icon: Icon(Icons.shopping_bag)),
              ],
            ),
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.network(
                    product.productImage ?? "assets/images/placeholder.png",
                    fit: BoxFit.cover,
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.36,
                  ),
                  SizedBox(height: 12),
                  Text(
                    product.producttitle ?? "Product Name",
                    style: TextStyle(
                      fontSize: 23,
                      fontWeight: FontWeight.w900,
                      letterSpacing: 1.5,
                    ),
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "\$${product.productPrice!.toStringAsFixed(2)}",
                        style: TextStyle(
                          fontSize: 23,
                          fontWeight: FontWeight.w900,
                          letterSpacing: 1.5,
                          color: Colors.orange,
                        ),
                      ),
                      Row(
                        children: [
                          Text(
                            "Rating: ${product.productRating ?? 0.0}",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w900,
                              letterSpacing: 1.3,
                            ),
                          ),
                          SizedBox(width: 7),
                          Icon(
                            Icons.star,
                            color: const Color.fromARGB(255, 255, 187, 1),
                            size: 24,
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Text(
                    product.productDescription ?? "Product Description",
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.black54,
                    ),
                  ),
                ],
              ),
            ),
          );
        } else {
          return const Center(
            child: Text("Error while fetching data"),
          );
        }
      },
    );
  }
}

