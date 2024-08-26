import 'package:fashion_app/controller/items_data.dart';
import 'package:fashion_app/view/checkout_screen.dart';
import 'package:fashion_app/view/widget/payment_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

/// CART SCREEN WIDGET
class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  /// FLAG TO TRACK WHETHER ITEM IS LIKED
  bool isLiked = false;

  @override
  Widget build(BuildContext context) {
    /// OBTAIN ITEMS DATA OBJECT FROM PROVIDER
    final ItemsData itemDataObj = Provider.of<ItemsData>(context);

    return Scaffold(
      /// SET BACKGROUND COLOR FOR THE SCREEN
      backgroundColor: const Color.fromRGBO(255, 255, 255, 1),

      /// APPBAR 
      appBar: AppBar(
        surfaceTintColor: const Color.fromRGBO(255, 255, 255, 1),
        backgroundColor: const Color.fromRGBO(255, 255, 255, 1),

        /// TITLE OF THE APPBAR
        title: Text(
          "Cart",
          style: GoogleFonts.imprima(
              fontSize: 18,
              fontWeight: FontWeight.w400,
              color: const Color.fromRGBO(13, 13, 14, 1)),
        ),
        centerTitle: true,

        /// BACK BUTTON ICON ON APPBAR
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

      /// BODY OF THE SCREEN
      body: Padding(
        padding: const EdgeInsets.only(
          left: 30,
          right: 30,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// TITLE OF THE ORDER SECTION
            Text(
              "My Orders",
              style: GoogleFonts.imprima(
                  fontSize: 40,
                  fontWeight: FontWeight.w400,
                  color: const Color.fromRGBO(13, 13, 14, 1)),
            ),

            /// LIST OF ITEMS IN THE CART
            SizedBox(
              height: 500,
              child: ListView.builder(
                itemCount: itemDataObj.itemsList.length-5,
                itemBuilder: (context, index) {
                  return Slidable(
                    closeOnScroll: false,

                    /// ACTIONS ON SLIDING THE ITEM (LIKE/DELETE)
                    endActionPane: ActionPane(
                      extentRatio: 0.3,
                      motion: const DrawerMotion(),
                      children: [
                        Expanded(
                          child: Container(
                            margin: const EdgeInsets.only(left: 10, right: 10),
                            height: 100,

                            /// DECORATION FOR SLIDE ACTION CONTAINER
                            decoration: const BoxDecoration(
                                color: Color.fromRGBO(255, 122, 0, 1),
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(70),
                                    bottomLeft: Radius.circular(70))),
                            child: Row(
                              children: [
                                /// LIKE BUTTON ICON
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      isLiked = !isLiked;
                                    });
                                  },
                                  child: (isLiked == false)
                                      ? const Icon(
                                          Icons.favorite_outline,
                                          color:
                                              Color.fromRGBO(255, 255, 255, 1))
                                      : const Icon(
                                          Icons.favorite,
                                          color:
                                              Color.fromRGBO(255, 255, 255, 1),
                                        ),
                                ),

                                /// DELETE BUTTON ICON
                                GestureDetector(
                                  onTap: () {},
                                  child: const Icon(Icons.delete_outline,
                                      color:
                                          Color.fromRGBO(255, 255, 255, 1)),
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    ),

                    /// CART ITEM DISPLAYED AS A ROW
                    child: Container(
                      height: 150,
                      margin: const EdgeInsets.only(bottom: 25),
                      child: Row(
                        children: [
                          /// IMAGE OF THE ITEM
                          ClipRRect(
                            borderRadius: BorderRadius.circular(16),
                            child: Image.asset(
                              itemDataObj.itemsList[index].img!,
                              height: 142,
                              width: 108,
                              fit: BoxFit.fitHeight,
                            ),
                          ),
                          const SizedBox(
                            width: 30,
                          ),

                          /// ITEM DETAILS SECTION (NAME, PRICE, QUANTITY)
                          SizedBox(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                /// ITEM NAME
                                Text(
                                  itemDataObj.itemsList[index].name!,
                                  style: GoogleFonts.imprima(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600,
                                      color: const Color.fromRGBO(
                                          13, 13, 14, 1)),
                                ),
                               
                                /// ITEM DESCRIPTION (COLOR, SIZE)
                                Text(
                                  "Yellow \nSize B",
                                  style: GoogleFonts.imprima(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                      color: const Color.fromRGBO(
                                          121, 119, 128, 1)),
                                ),

                                /// PRICE AND QUANTITY DISPLAY
                                Row(
                                  //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "\$${itemDataObj.itemsList[index].price}",
                                      style: GoogleFonts.imprima(
                                          fontSize: 26,
                                          fontWeight: FontWeight.w600,
                                          color: const Color.fromRGBO(
                                              13, 13, 14, 1)),
                                    ),
                                    const SizedBox(width: 80,),
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
                },
              ),
            ),

            /// DIVIDER BETWEEN ORDER LIST AND PAYMENT DETAILS
            Container(
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  border: Border.all(
                width: 1,
                color: const Color.fromRGBO(227, 227, 227, 1),
              )),
            ),

            /// PAYMENT DETAILS SECTION (TOTAL ITEMS, DELIVERY, TOTAL PAYMENT)
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

            /// CHECKOUT BUTTON
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
