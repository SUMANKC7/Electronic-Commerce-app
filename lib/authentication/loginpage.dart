import 'package:electronic_ecommerce/authentication/signup.dart';
import 'package:flutter/material.dart';

class Loginpage extends StatelessWidget {
  const Loginpage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
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
            ElevatedButton.icon(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white12,
                  side: const BorderSide(
                      color: Color.fromARGB(255, 190, 221, 246)),
                  minimumSize: const Size.fromHeight(50),
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10))),
              label: const Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(
                    Icons.g_mobiledata,
                  ),
                  SizedBox(
                    width: 50,
                  ),
                  Text(
                    "Login with Google",
                    style: TextStyle(
                        fontSize: 19,
                        fontWeight: FontWeight.normal,
                        color: Colors.black),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
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
              label: const Row(
                children: [
                  Icon(Icons.facebook),
                  SizedBox(
                    width: 50,
                  ),
                  Text(
                    "Login with Facebook",
                    style: TextStyle(
                        fontSize: 19,
                        fontWeight: FontWeight.normal,
                        color: Colors.black),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 44,
            ),
            Align(
              alignment: Alignment.center,
              child: Text(
                "OR",
                style:
                    TextStyle(color: Colors.grey, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 44,
            ),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  elevation: 0,
                  minimumSize: const Size.fromHeight(50),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10))),
              child: Text(
                "Login with Email",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 18),
              ),
            ),
            Spacer(),
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
    );
  }
}
