import 'package:electronic_ecommerce/services/stripe_services.dart';
import 'package:flutter/material.dart';

class Payment extends StatelessWidget {
  const Payment({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Paymant page"),),
      body: SizedBox.expand(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MaterialButton(
              onPressed: (){
              StripeService.instance.makePayment();
            },
            child: Text("Click"),)
          ],
        ),
      ),
    );
  }
}