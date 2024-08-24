import 'package:fashion_app/controller/size_list.dart';
import 'package:fashion_app/model/item_model.dart';
import 'package:fashion_app/view/cart_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DetailsScreen extends StatefulWidget {
  const DetailsScreen({super.key, required this.itemData});
  final ItemsModel itemData;

  @override
  State createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(255, 255, 255, 1),
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(255, 255, 255, 1),
        title: Text(
          "Details",
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
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 30),
            width: 20,
            height: 22,
            child: const Icon(
              Icons.bookmark_border_rounded,
              size: 27,
              color: Color.fromRGBO(13, 13, 14, 1),
            ),
          )
        ],
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
            ClipRRect(
              borderRadius: BorderRadius.circular(40),
              child: Image.asset(
                widget.itemData.img!,
                width: MediaQuery.sizeOf(context).width,
                height: 450,
                fit: BoxFit.cover,
              ),
            ),
            //const SizedBox(height: 30,),
            Row(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Premium",
                      style: GoogleFonts.imprima(
                          fontSize: 30,
                          fontWeight: FontWeight.w500,
                          color: const Color.fromRGBO(13, 13, 14, 1)),
                    ),
                    Text(
                      widget.itemData.name!,
                      style: GoogleFonts.imprima(
                          fontSize: 30,
                          fontWeight: FontWeight.w500,
                          color: const Color.fromRGBO(13, 13, 14, 1)),
                    ),
                  ],
                ),
                const Spacer(),
                Image.asset("assets/images/ec2.png"),
                const SizedBox(
                  width: 10,
                ),
                Image.asset("assets/images/ec3.png"),
                const SizedBox(
                  width: 10,
                ),
                Image.asset("assets/images/ec1.png"),
              ],
            ),
            // const SizedBox(
            //   height: 20,
            // ),
            Text(
              "Size",
              style: GoogleFonts.imprima(
                  fontSize: 24,
                  fontWeight: FontWeight.w500,
                  color: const Color.fromRGBO(13, 13, 14, 1)),
            ),
            // const SizedBox(
            //   height: 10,
            // ),
            SizedBox(
              height: 30,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: sizeList.length,
                  itemBuilder: (context, index) {
                    return Container(
                      width: 90,
                      margin: const EdgeInsets.only(left: 10),
                      child: Text(
                        sizeList[index],
                        style: GoogleFonts.imprima(
                            fontSize: 24,
                            fontWeight: FontWeight.w400,
                            color: const Color.fromRGBO(121, 119, 128, 1)),
                      ),
                    );
                  }),
            ),
            // const SizedBox(height: 20,),
            Row(
              children: [
                Text(
                  "\$${widget.itemData.price}",
                  style: GoogleFonts.imprima(
                      fontSize: 36,
                      fontWeight: FontWeight.w500,
                      color: const Color.fromRGBO(13, 13, 14, 1)),
                ),
                const Spacer(),
                ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const CartScreen()));
                    },
                    style: const ButtonStyle(
                        fixedSize: WidgetStatePropertyAll(Size(162, 62)),
                        backgroundColor: WidgetStatePropertyAll(
                            Color.fromRGBO(255, 122, 0, 1))),
                    child: Text(
                      "Add To Cart",
                      style: GoogleFonts.imprima(
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                          color: const Color.fromRGBO(255, 255, 255, 1)),
                    )),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
