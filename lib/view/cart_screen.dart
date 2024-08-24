import 'package:fashion_app/controller/items_data.dart';
import 'package:fashion_app/model/item_model.dart';
import 'package:fashion_app/view/checkout_screen.dart';
import 'package:fashion_app/view/details_screen.dart';
import 'package:fashion_app/view/widget/payment_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({
    super.key,
  });
  @override
  State createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    final ItemsData itemDataObj = Provider.of(context);
    return Scaffold(
      backgroundColor: const Color.fromRGBO(255, 255, 255, 1),
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(255, 255, 255, 1),
        title: Text(
          "Cart",
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
        padding: const EdgeInsets.only(
          left: 30,
          right: 30,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "My Orders",
              style: GoogleFonts.imprima(
                  fontSize: 40,
                  fontWeight: FontWeight.w400,
                  color: const Color.fromRGBO(13, 13, 14, 1)),
            ),
            SizedBox(
              height: 500,
              child: ListView.builder(itemBuilder: (context, index) {
                return Slidable(
                  closeOnScroll: false,
                  //enabled: false,

                  endActionPane:ActionPane(
                                extentRatio: 0.2,
                                motion: const DrawerMotion(),
                                children: [
                                  Expanded(
                                    
                                    child: Container(
                                      child: Row(
                                        children: [
                                            
                              Icon(Icons.delete_outline,
                                  color: Color.fromRGBO(151, 13, 13, 1))
                                        ],
                                      ),
                                    ),
                                  )
                                ],
                              ),
                  // ActionPane(
                  //     //extentRatio: 0.2,
                  //     motion: const DrawerMotion(),
                  //     children: [
                  //       Container(
                  //         //margin: EdgeInsets.only(bottom: 20),
                  //         height: 50,
                  //         width: 50,
                  //         color: const Color.fromRGBO(255, 122, 0, 1),
                  //         child: Row(
                  //           children: [
                  //             Icon(
                  //               Icons.favorite_outline,
                  //               color: Color.fromRGBO(1, 0, 0, 1),
                  //             ),
                  //             Icon(Icons.delete_outline,
                  //                 color: Color.fromRGBO(255, 255, 255, 1))
                  //           ],
                  //         ),
                  //       )
                  //     ]),
                  child: Container(
                    margin: const EdgeInsets.only(bottom: 15),
                    child: Row(
                      children: [
                        Image.asset(
                          "assets/images/img1.png",
                          height: 142,
                          width: 108,
                        ),
                        const SizedBox(
                          width: 30,
                        ),
                        SizedBox(
                          // height: 245,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Premium \nTagerine Shirt",
                                style: GoogleFonts.imprima(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                    color: const Color.fromRGBO(13, 13, 14, 1)),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                "Yellow \nSize B",
                                style: GoogleFonts.imprima(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    color:
                                        const Color.fromRGBO(121, 119, 128, 1)),
                              ),
                              Row(
                                children: [
                                  Text(
                                    "\$257.85",
                                    style: GoogleFonts.imprima(
                                        fontSize: 26,
                                        fontWeight: FontWeight.w600,
                                        color: const Color.fromRGBO(
                                            13, 13, 14, 1)),
                                  ),
                                  const SizedBox(
                                    width: 75,
                                  ),
                                  Text(
                                    "1x",
                                    style: GoogleFonts.imprima(
                                        fontSize: 30,
                                        fontWeight: FontWeight.w400,
                                        color: const Color.fromRGBO(
                                            13, 13, 14, 1)),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  border: Border.all(
                width: 1,
                color: const Color.fromRGBO(227, 227, 227, 1),
              )),
            ),
            const SizedBox(
              height: 100,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  PaymentDetails(name: "Total Items (3)", amount: 116.01),
                  PaymentDetails(name: "Standard Delivery", amount: 12.01),
                  PaymentDetails(name: "Total Payment", amount: 126.01),
                ],
              ),
            ),
            Center(
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const CheckoutScreen()));
                  },
                  style: ElevatedButton.styleFrom(
                      fixedSize: (const Size(190, 62)),
                      backgroundColor: (const Color.fromRGBO(255, 122, 0, 1))),
                  child: Text(
                    "Checkout Now",
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
