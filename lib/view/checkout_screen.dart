import 'package:fashion_app/controller/payment_mode_list.dart';
import 'package:fashion_app/view/widget/payment_details.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CheckoutScreen extends StatefulWidget {
  const CheckoutScreen({super.key});

  @override
  State createState() => _CheckoutScreen();
}

class _CheckoutScreen extends State<CheckoutScreen> {
  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(255, 255, 255, 1),
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(255, 255, 255, 1),
        title: Text(
          "Checkout",
          style: GoogleFonts.imprima(
              fontSize: 18,
              fontWeight: FontWeight.w400,
              color: const Color.fromRGBO(13, 13, 14, 1)),
        ),
        centerTitle: true,
        leading: Padding(
          padding: const EdgeInsets.only(left: 30),
          child: GestureDetector(
            onTap: () => Navigator.of(context).pop(),
            child: const Icon(
              Icons.arrow_back_ios,
              color: Color.fromRGBO(13, 13, 14, 1),
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 30, right: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Delivery Address",
              style: GoogleFonts.imprima(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: const Color.fromRGBO(121, 119, 128, 1)),
            ),
           
            Row(
              children: [
                Image.asset("assets/images/map.png"),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  "25/3 Housing Estate, \nSylhet",
                  style: GoogleFonts.imprima(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: const Color.fromRGBO(13, 13, 14, 1)),
                ),
                const Spacer(),
                Text(
                  "Change",
                  style: GoogleFonts.imprima(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: const Color.fromRGBO(121, 119, 128, 1)),
                )
              ],
            ),
           
            Row(
              children: [
                const Icon(
                  Icons.timer,
                  color: Color.fromRGBO(123, 123, 141, 1),
                  weight: 1.5,
                ),
                Text(
                  "Delivered in next 7 days",
                  style: GoogleFonts.imprima(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: const Color.fromRGBO(13, 13, 14, 1)),
                )
              ],
            ),
          
            Text(
              "Payment Method",
              style: GoogleFonts.imprima(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: const Color.fromRGBO(121, 119, 128, 1)),
            ),
            SizedBox(
              height: 18,
              // width: 44,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: imagesList.length,
                  itemBuilder: (context, index) {
                    return Container(
                      height: 100,
                      //width: 44,
                      margin: const EdgeInsets.only(left: 17),
                      child: Image.asset(imagesList[index]),
                    );
                  }),
            ),
           
            Container(
              height: 54,
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(10)),
              child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                     shape: RoundedRectangleBorder(borderRadius:BorderRadius.circular(10) ),
                    fixedSize: (
                        Size(MediaQuery.sizeOf(context).width, 54)),
                    backgroundColor: (
                        Color.fromRGBO(252, 252, 252, 1)),
                        
                  ),
                  child: Text(
                    "Add Voucher",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.imprima(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: const Color.fromRGBO(121, 119, 128, 1)),
                  )),
            ),
            Text.rich(TextSpan(
                text: "Note : ",
                style: GoogleFonts.imprima(
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                    color: const Color.fromARGB(255, 237, 11, 11)),
                children: [
                  TextSpan(
                    text: "Use your order id at the payment. Your Id ",
                    style: GoogleFonts.imprima(
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                        color: const Color.fromRGBO(121, 119, 128, 1)),
                  ),
                  TextSpan(
                    text: "#154619 ",
                    style: GoogleFonts.imprima(
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                        color: const Color.fromARGB(255, 2, 2, 2)),
                  ),
                  TextSpan(
                    text:
                        "if you forget to put your order id we can’t confirm the payment.",
                    style: GoogleFonts.imprima(
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                        color: const Color.fromRGBO(121, 119, 128, 1)),
                  ),
                ])),
              const SizedBox(
                height: 100,
                 child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                      PaymentDetails(name: "Total Items(3)", amount: 116.01),
                   PaymentDetails(name: "Standard Delivery", amount: 12.01),
                   PaymentDetails(name: "Total Payment", amount: 126.01),
                  ],
                 ),
               ),
            Center(
              child: ElevatedButton(
                  onPressed: () {},
                  
                  style:  ElevatedButton.styleFrom(
                   
                      fixedSize: (const Size(190, 62)),
                      backgroundColor:
                          (const Color.fromRGBO(255, 122, 0, 1))),
                  child: Text(
                    "Pay Now",
                    style: GoogleFonts.imprima(
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                        color: const Color.fromRGBO(255, 255, 255, 1)),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}