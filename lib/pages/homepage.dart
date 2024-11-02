// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:electronic_ecommerce/features/product.dart';
import 'package:electronic_ecommerce/pages/allproduct.dart';
import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final GlobalKey<ScaffoldState> _globalKey = GlobalKey<ScaffoldState>();
  List<Categories> categories = [
    Categories("Beauty ", "assests/images/beauty.png"),
    Categories("Fragrances ", "assests/images/fragrance.png"),
    Categories("Laptops ", "assests/images/laptop.png"),
    Categories("Groceries", "assests/images/grocery.png"),
    Categories("Furniture ", "assests/images/furniture.png"),
    Categories("Watches", "assests/images/smartwatch.png"),
    Categories("Smartphones", "assests/images/phone.png"),
    Categories("Tablets", "assests/images/tablets.png"),
    Categories("Women-Bags", "assests/images/bag.png"),
    Categories("Sports-Accessories", "assests/images/sports.png"),
   Categories("Sunglasses", "assests/images/sunglasses.png"),
   Categories("Shoes", "assests/images/shoes.png"),
  ];

  List carosulImage = [
    "assests/carosuelImage/deal1.png",
    "assests/carosuelImage/deal2.png",
    "assests/carosuelImage/deal3.webp",
    "assests/carosuelImage/deal4.jpg",
    "assests/carosuelImage/deal5.jpg",
    "assests/carosuelImage/banner.png",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _globalKey,
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              _globalKey.currentState?.openDrawer();
            },
            icon: const Icon(Icons.menu)),
        title: const Text("Home"),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.notifications)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.shopping_bag)),
          const SizedBox(
            width: 10,
          )
        ],
      ),
      drawer: Drawer(
        child: Container(
          width: MediaQuery.of(context).size.width * 0.5,
          child: ListView(
            children: [
              DrawerHeader(
                  margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  decoration: BoxDecoration(color: Colors.green),
                  child: Column(
                    children: [
                      Image.asset(
                        "assests/images/file.png",
                        width: MediaQuery.of(context).size.width * 0.25,
                      ),
                      Text(
                        "Suman KC",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w900),
                      )
                    ],
                  )),
              ListTile(
                leading: Icon(Icons.wallet),
                title: Text("Order"),
                onTap: () {},
              ),
              ListTile(
                leading: Icon(Icons.message),
                title: Text("Message"),
                onTap: () {},
              ),
              ListTile(
                leading: Icon(Icons.favorite),
                title: Text("Favorite"),
                onTap: () {},
              ),
              ListTile(
                leading: Icon(Icons.settings),
                title: Text("Setting"),
                onTap: () {},
              ),
              ListTile(
                leading: Icon(Icons.account_box),
                title: Text("Account "),
                onTap: () {},
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: MediaQuery.sizeOf(context).height * 0.1,
              padding: const EdgeInsets.only(
                  left: 20, right: 20, top: 15, bottom: 10),
              child: TextField(
                decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.search,
                    size: 30,
                  ),
                  hintText: " Search Anything...",
                  hintStyle: TextStyle(
                      fontSize: 19,
                      fontWeight: FontWeight.w900,
                      color: Colors.grey),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 25, right: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Categories",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Row(
                      children: [
                        Text("View All",
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.normal,
                                color: Colors.grey)),
                        Icon(
                          Icons.arrow_forward,
                          color: Colors.grey,
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: MediaQuery.sizeOf(context).height * 0.15,
              child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: categories.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return CategoryItem(category: categories[index]);
                  }),
            ),
            SizedBox(
              height: MediaQuery.sizeOf(context).height * 0.15,
              child: CarouselItem(carosulImage: carosulImage),
            ),
            Padding(
              padding: EdgeInsets.only(left: 25, right: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Top Deals",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                          context, MaterialPageRoute(builder: (context)=>AllProduct()));
                    },
                    child: Row(
                      children: [
                        Text("All Products",
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.normal,
                                color: Colors.grey)),
                        Icon(
                          Icons.arrow_forward,
                          color: Colors.grey,
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            ProductView()
          ],
        ),
      ),
      
    );
  }
}


class CarouselItem extends StatelessWidget {
  const CarouselItem({
    super.key,
    required this.carosulImage,
  });

  final List<dynamic> carosulImage;

  @override
  Widget build(BuildContext context) {
    return CarouselView(
        itemExtent: MediaQuery.sizeOf(context).width * 0.8,
        children: List.generate(carosulImage.length, (int index) {
          return Image.asset(
            carosulImage[index],
            fit: BoxFit.cover,
          );
        }));
  }
}

class CategoryItem extends StatelessWidget {
  final Categories category;
  const CategoryItem({
    super.key,
    required this.category,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          CircleAvatar(
            radius: 30,
            child: Image.asset(
              category.categoryimages,
              width: 43,
              height: 45,
              fit: BoxFit.contain,
            ),
          ),
          SizedBox(
            height: 3,
          ),
          Text(
            category.categoryName,
            style:
                TextStyle(color: Colors.black54, fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }
}

class Categories {
  final String categoryimages;
  final String categoryName;

  Categories(this.categoryName, this.categoryimages);
}
