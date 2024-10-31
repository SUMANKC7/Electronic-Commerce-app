import 'package:electronic_ecommerce/authentication/loginpage.dart';
import 'package:electronic_ecommerce/authentication/signup.dart';
import 'package:electronic_ecommerce/pages/homepage.dart';
import 'package:electronic_ecommerce/provider/bottom_nav.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_)=>BottomNavProvider()),
      ],
    child: const ElectronicCommerce()
    )
    );
}
class ElectronicCommerce extends StatelessWidget {
  const ElectronicCommerce({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: MaterialApp(
       debugShowCheckedModeBanner: false,
        title: "E-Commerce App",
      
        initialRoute: "homepage",
        routes: {
          "loginpage":(context)=>const Loginpage(),
          "signuppage":(context)=>const SignUppage(),
          "homepage":(context)=>const Homepage(),
        },
      ),
    );
  }
}
