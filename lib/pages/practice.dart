import 'package:flutter/material.dart';

class Practice extends StatelessWidget {
  const Practice({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Product")),
        actions: [
          IconButton(onPressed: (){}, icon: Icon(Icons.shopping_bag))
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
          
                          Image.asset(
                            fit:BoxFit.contain,
                            "assests/images/fragrance.png",
                            width: MediaQuery.sizeOf(context).width*1,
                            height: MediaQuery.sizeOf(context).height*0.36,
                          ),
                          SizedBox(height: 12,),
                          Text(
                            "Product Name",
                            style: TextStyle(
                              fontSize: 23,
                              fontWeight: FontWeight.w900,
                              letterSpacing: 1.5,
                            ),

                          ),
                          SizedBox(height: 10,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("\$20.99",
                              style: TextStyle(
                              fontSize: 23,
                              fontWeight: FontWeight.w900,
                              letterSpacing: 1.5,
                              color: Colors.orange
                            ),
                               ),
                              Row(children: [
                                Text(
                                  "Rating: 3.5",
                                  style: TextStyle(
                                    fontSize: 16,
                              fontWeight: FontWeight.w900,
                              letterSpacing: 1.3,
                              
                                  ),
                                ),
                                SizedBox(width: 7,),
                                Icon(
                                  Icons.star,
                                  color: const Color.fromARGB(255, 255, 187, 1),
                                  size: 24,
                                  
                                  )
                                ]
                                ),
                            ],
                          ),
                          SizedBox(height: 10,),
                          Text(
                            "Product Description",
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.black54,
                              
                            ),
                            ),
                         SizedBox(height: 14,),
                          Image.asset(
                            fit: BoxFit.cover,
                            "assests/images/shoes.png",
                             width: MediaQuery.sizeOf(context).width*1,
                            height: MediaQuery.sizeOf(context).height*0.36,

                            )
                        ],
                      ),
        ),
      ),
    );
  }
}