import 'package:electronic_ecommerce/features/product.dart';
import 'package:electronic_ecommerce/model/categorymodel.dart';
import 'package:electronic_ecommerce/pages/allproduct.dart';
import 'package:electronic_ecommerce/pages/categorypage.dart';
import 'package:electronic_ecommerce/pages/productscreen.dart';
import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final GlobalKey<ScaffoldState> _globalKey = GlobalKey<ScaffoldState>();
  final List<CategoryModel> categories = [
    CategoryModel(
      name: "Beauty ",
      imagePath: "assests/images/beauty.png",
      slug: "beauty",
      color:Colors.pink
    ),
    CategoryModel(
        name: "Fragrances ",
        imagePath: "assests/images/fragrance.png",
        slug: "fragrances",
        color:Colors.green),
    CategoryModel(
      name: "Laptops ",
      imagePath: "assests/images/laptop.png",
      slug: "laptops",
      color:Colors.lightBlue
    ),
    CategoryModel(
      name: "Groceries ",
      imagePath: "assests/images/grocery.png",
      slug: "groceries",
      color:const Color.fromARGB(255, 249, 197, 7)
    ),
    CategoryModel(
      name: "Furniture ",
      imagePath: "assests/images/furniture.png",
      slug: "furniture",
      color:Colors.orangeAccent
    ),
    CategoryModel(
      name: "Watches ",
      imagePath: "assests/images/smartwatch.png",
      slug: "mens-watches",
      color:Colors.purpleAccent
    ),
    CategoryModel(
      name: "Smartphones",
      imagePath: "assests/images/phone.png",
      slug: "smartphones",
      color:Colors.amber
    ),
    CategoryModel(
      name: "Tablelets",
      imagePath: "assests/images/tablets.png",
      slug: "tablets",
      color:Colors.red
    ),
    CategoryModel(
        name: "Women-Bags ",
        imagePath: "assests/images/bag.png",
        slug: "womens-bags",
        color:Colors.purple),
        
    CategoryModel(
      name: " Sports-Accessories",
      imagePath: "assests/images/sports.png",
      slug: "sports-accessories",
      color:Colors.brown
    ),
    CategoryModel(
      name: "Sunglasses",
      imagePath: "assests/images/sunglasses.png",
      slug: "sunglasses",
      color:Colors.lightBlue
    ),
    CategoryModel(
      name: "Mens-Shoes ",
      imagePath: "assests/images/shoes.png",
      slug: "mens-shoes",
      color:Colors.black
    ),
    CategoryModel(
      name: "Vehicle",
      imagePath: "assests/images/beauty.png",
      slug: "vehicle",
      color:const Color.fromARGB(255, 196, 83, 42)
    ),
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
          IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Homepage()));
              },
              icon: const Icon(Icons.notifications)),
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
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  Categorypage(categories: categories)));
                    },
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
                    return CategoryItem(
                      category: categories[index],
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ProductScreen(
                                    slug: categories[index].slug)));
                      },
                    );
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
                          context,
                          MaterialPageRoute(
                              builder: (context) => AllProduct()));
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
  final CategoryModel category;
  final VoidCallback onTap; // Callback for handling tap

  const CategoryItem({
    Key? key,
    required this.category,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap, // Handle tap
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            CircleAvatar(
              radius: 30,
              child: Image.asset(
                category.imagePath,
                width: 43,
                height: 45,
                fit: BoxFit.contain,
              ),
            ),
            const SizedBox(height: 3),
            Text(
              category.name,
              style: const TextStyle(
                color: Colors.black54,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
