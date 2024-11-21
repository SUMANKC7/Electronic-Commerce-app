import 'package:electronic_ecommerce/authentication/signup.dart';
import 'package:electronic_ecommerce/pages/home.dart';
import 'package:electronic_ecommerce/services/auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class Loginpage extends StatefulWidget {
  const Loginpage({super.key});

  @override
  State<Loginpage> createState() => _LoginpageState();
}

class _LoginpageState extends State<Loginpage> {
  String email = "", password = "";

  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final _formkey = GlobalKey<FormState>();

  userLogin() async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        backgroundColor: Colors.green,
        content: Text(
          "Login successful",
          style: TextStyle(fontSize: 20),
        ),
      ));
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Homescreen(categories: [])),
      );
    } on FirebaseAuthException catch (e) {
      print("Error code: ${e.code}"); // Debugging
      FocusScope.of(context).unfocus(); // Unfocus any input field
      if (e.code == "user-not-found") {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: Colors.redAccent,
          content: Text(
            "Account not registered",
            style: TextStyle(fontSize: 20),
          ),
        ));
      } else if (e.code == "wrong-password") {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: Colors.redAccent,
          content: Text(
            "Wrong Password",
            style: TextStyle(fontSize: 20),
          ),
        ));
      } else {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: Colors.redAccent,
          content: Text(
            "An unexpected error occurred",
            style: TextStyle(fontSize: 20),
          ),
        ));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: Form(
          key: _formkey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 30,
                ),
                const Text(
                  "Login to Shoply",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 25,
                ),
                SizedBox(
                  height: 8,
                ),
                TextFormField(
                  controller: emailcontroller,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter your email";
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                      hintText: "Enter Email",
                      hintStyle: TextStyle(
                          color: Colors.grey,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)),
                      enabled: true,
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10))),
                ),
                SizedBox(
                  height: 15,
                ),
                TextFormField(
                  controller: passwordController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter your password";
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    hintText: "Enter Password",
                    hintStyle: TextStyle(
                        color: Colors.grey,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                    enabled: true,
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  obscureText: true,
                ),
                TextButton(
                    onPressed: () {},
                    child: Text(
                      "Forgot your password?",
                      style: TextStyle(color: Color(0xFF333333), fontSize: 18),
                    )),
                SizedBox(
                  height: 18,
                ),
                ElevatedButton(
                  onPressed: () {
                    if (_formkey.currentState!.validate()) {
                      setState(() {
                        email = emailcontroller.text;
                        password = passwordController.text;
                      });
                      userLogin();
                    }
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFFFF5722),
                      elevation: 0,
                      minimumSize: const Size.fromHeight(50),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10))),
                  child: Text(
                    "Log in",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.sizeOf(context).height * 0.03,
                ),
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    "OR",
                    style: TextStyle(
                        color: Colors.grey, fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.sizeOf(context).height * 0.03,
                ),
                ElevatedButton.icon(
                  onPressed: () {
                    AuthMethods().signInWithGoogle(context);
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white12,
                      side: const BorderSide(
                          color: Color.fromARGB(255, 190, 221, 246)),
                      minimumSize: const Size.fromHeight(50),
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10))),
                  label: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset(
                        "assests/images/google1.png",
                        width: MediaQuery.sizeOf(context).width * 0.08,
                      ),
                      SizedBox(
                        width: 50,
                      ),
                      Text(
                        "Sign in with Google",
                        style: TextStyle(
                            fontSize: 19,
                            fontWeight: FontWeight.normal,
                            color: Colors.black),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                ElevatedButton.icon(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white12,
                      side: const BorderSide(
                          color: Color.fromARGB(255, 190, 221, 246)),
                      elevation: 0,
                      minimumSize: const Size.fromHeight(50),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10))),
                  label: Row(
                    children: [
                      Image.asset(
                        "assests/images/apple1.png",
                        width: MediaQuery.sizeOf(context).width * 0.09,
                      ),
                      SizedBox(
                        width: 50,
                      ),
                      Text(
                        "Sign in with Apple",
                        style: TextStyle(
                            fontSize: 19,
                            fontWeight: FontWeight.normal,
                            color: Colors.black),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: MediaQuery.sizeOf(context).height * 0.14,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Don't have an account yet ? ",
                      style: TextStyle(fontSize: 17, color: Colors.grey),
                    ),
                    GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const SignUppage()));
                        },
                        child: Text(
                          "Signup",
                          style: TextStyle(
                              color: Colors.blue,
                              decoration: TextDecoration.underline,
                              decorationColor: Colors.blue,
                              fontSize: 17),
                        )),
                  ],
                ),
                SizedBox(
                  height: 45,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
