import 'package:electronic_ecommerce/model/detailproductmodel.dart';
import 'package:electronic_ecommerce/model/productmodel.dart';
import 'package:electronic_ecommerce/services/detailproduct_service.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class AllProduct extends StatelessWidget {
  const AllProduct({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Detailproductmodel>>(
        future: DetailproductService().getDetailProductData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasData) {
            var data = snapshot.data as List<ProductModel>;
            return ListView.builder(
                itemCount: data.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Image.network("src"),
                      Text("Product Name"),
                      Row(
                        children: [
                          Text("Product Price"),
                          Text("Rating")
                        ],
                      ),
                      Text("Product Description"),
                      Text("Product Description"),
                      Image.network('image')
                    ],
                  );
                });
          } else {
            return const Center(
              child: Text("Error while fetching data"),
            );
          }
        });
  }
}
// return GridView.builder(
//                 padding: const EdgeInsets.only(left: 20, right: 20),
//                 shrinkWrap: true,
//                 // physics: const NeverScrollableScrollPhysics(),
//                 gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//                   crossAxisCount: 2,
//                   mainAxisSpacing: 10,
//                   crossAxisSpacing: 10,
//                   childAspectRatio: 0.8,
//                 ),
//                 itemCount: data.length,
//                 itemBuilder: (context, index) {
//                   return Card(
//                     // color: const Color.fromARGB(255, 249, 220, 224),
//                     // color: const Color.fromARGB(255, 247, 225, 250),
//                     child: Padding(
//                       padding: const EdgeInsets.symmetric(horizontal: 8),
//                       child: Column(
//                         children: [
//                           Expanded(
//                             child: Padding(
//                               padding: EdgeInsets.only(top: 10),
//                               child: Image.network(
//                                 data[index].thumbnail!,
//                                 fit: BoxFit.fitWidth,
                                
//                               ),
//                             ),
//                           ),
//                           const SizedBox(
//                             height: 10,
//                           ),
//                           Text(
//                             data[index].title!,
//                             textAlign: TextAlign.center,
//                             maxLines: 1,
//                             overflow: TextOverflow.ellipsis,
//                             style: const TextStyle(
//                                 fontSize: 16, fontWeight: FontWeight.bold),
//                           ),
//                           SizedBox(
//                             height: 4,
//                           ),
//                           Padding(
//                             padding: EdgeInsets.only(left: 10, right: 8),
//                             child: Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 Row(
//                                   mainAxisAlignment:
//                                       MainAxisAlignment.spaceBetween,
//                                   children: [
//                                     Text(
//                                       "\$ ${data[index].price!.toStringAsFixed(2)}",
//                                       style: TextStyle(
//                                           fontWeight: FontWeight.w900,
//                                           color: const Color.fromARGB(
//                                               255, 210, 128, 4),
//                                           fontSize: 17),
//                                       textAlign: TextAlign.left,
//                                     ),
//                                   ],
//                                 ),
//                                 Row(
//                                   children: [
//                                     Text(
//                                       "Rating: ${data[index].rating!.toStringAsFixed(3)}",
//                                       style: const TextStyle(
                                          
//                                           color: Colors.black,
//                                           fontSize: 14,),
//                                     ),
//                                     SizedBox(width: 5,),
//                                     Icon(Icons.star,color: const Color.fromARGB(255, 249, 204, 2),size: 30,opticalSize: 10,)
//                                   ],
//                                 )
//                               ],
//                             ),
//                           )
//                         ],
//                       ),
//                     ),
//                   );
//                 });