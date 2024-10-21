import 'package:flutter/material.dart';

class Homepage extends StatelessWidget {
  final GlobalKey<ScaffoldState> _globalKey = GlobalKey<ScaffoldState>();
  Homepage({super.key});

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
        title: Text("Home"),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.notifications)),
          IconButton(onPressed: () {}, icon: Icon(Icons.shopping_bag)),
          SizedBox(
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
                margin: EdgeInsets.symmetric(vertical: 10,horizontal: 10),
                decoration: BoxDecoration(
                  color: Colors.green
                ),
                child: Column(
                  children: [
                    Image.asset("assests/images/file.png",width: MediaQuery.of(context).size.width*0.25,),
                    Text("Suman KC",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w900),)
                  ],
                )
                ),
             ListTile(
              leading: Icon(Icons.wallet),
              title: Text("Order"),
              onTap: (){},
             ),

             ListTile(
              leading: Icon(Icons.message),
              title: Text("Message"),
              onTap: (){},
             ),

              ListTile(
              leading: Icon(Icons.favorite),
              title: Text("Favorite"),
              onTap: (){},
             ),

              ListTile(
              leading: Icon(Icons.settings),
              title: Text("Setting"),
              onTap: (){},
             ),

              ListTile(
              leading: Icon(Icons.account_box),
              title: Text("Account"),
              onTap: (){},
             ),
            ],
          ),

        

        ),
      ),
    );
  }
}
