import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';

class PaymentService {
  static final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  static Future<void> makePayment(String amount, String currency, Map<String, dynamic> productDetails) async {
    try {
      // Step 1: Create Payment Intent
      Map<String, dynamic>? paymentIntent = await createPaymentIntent(amount, currency);
      if (paymentIntent == null || paymentIntent["client_secret"] == null) {
        print("Error: Payment Intent creation failed or client_secret is null");
        return;
      }

      // Step 2: Initialize Payment Sheet
      await Stripe.instance.initPaymentSheet(
        paymentSheetParameters: SetupPaymentSheetParameters(
          paymentIntentClientSecret: paymentIntent["client_secret"],
          style: ThemeMode.dark,
          merchantDisplayName: "Your Merchant Name",
        ),
      ).then((value) {
        print("Payment Sheet initialized successfully");
      }).catchError((error) {
        print("Error initializing Payment Sheet: $error");
      });

      // Step 3: Display Payment Sheet
      await displayPaymentSheet(paymentIntent, productDetails);
    } catch (e) {
      print("Payment exception: $e");
    }
  }

  static Future<Map<String, dynamic>?> createPaymentIntent(String amount, String currency) async {
    try {
      Map<String, dynamic> body = {
        "amount": calculateAmount(amount),
        "currency": currency,
        "payment_method_types[]": "card",
      };

      var response = await http.post(
        Uri.parse("https://api.stripe.com/v1/payment_intents"),
        headers: {
          "Authorization": "Bearer YOUR_STRIPE_SECRET_KEY", // Replace with your secret key
          "Content-Type": "application/x-www-form-urlencoded",
        },
        body: body,
      );

      if (response.statusCode == 200) {
        print("Payment intent created successfully");
        return jsonDecode(response.body);
      } else {
        print("Error creating payment intent: ${response.body}");
      }
    } catch (err) {
      print("Error creating payment intent: $err");
    }
    return null;
  }

  static Future<void> displayPaymentSheet(Map<String, dynamic>? paymentIntent, Map<String, dynamic> productDetails) async {
    try {
      // Ensure the paymentIntent is not null and contains a valid client_secret
      if (paymentIntent == null || paymentIntent["client_secret"] == null) {
        print("Error: Payment intent or client secret is null");
        return;
      }

      await Stripe.instance.presentPaymentSheet().then((value) async {
        print("Payment successful!");
        await storeTransactionInFirestore(productDetails);
      }).catchError((error) {
        print("Payment sheet error: $error");
      });
    } catch (e) {
      print("Error displaying payment sheet: $e");
    }
  }

  static Future<void> storeTransactionInFirestore(Map<String, dynamic> productDetails) async {
    try {
      await _firestore.collection("transactions").add({
        "product_name": productDetails["name"],
        "product_id": productDetails["id"],
        "price": productDetails["price"],
        "quantity": productDetails["quantity"],
        "transaction_date": DateTime.now(),
      });
      print("Transaction stored in Firestore successfully!");
    } catch (e) {
      print("Error storing transaction in Firestore: $e");
    }
  }

  static String calculateAmount(String amount) {
    final calculatedAmount = (int.parse(amount) * 100); // Amount in cents
    return calculatedAmount.toString();
  }
}
