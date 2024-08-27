import 'package:fashion_app/controller/details_screen_controller.dart';
import 'package:fashion_app/controller/items_data.dart';
import 'package:fashion_app/controller/size_list.dart';
import 'package:fashion_app/view/cart_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

/// THIS IS DETAILS SCREEN THAT DISPLAYS INFORMATION ABOUT A SELECTED ITEM.
class DetailsScreen extends StatelessWidget {
 
  const DetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    /// FETCHING THE SELECTED ITEM FROM THE PROVIDER.
    final ItemsData itemsData = Provider.of<ItemsData>(context);
    final selectedItem = itemsData.selectedItem;

    /// USING ChangeNotifierProvider TO HANDLE BOOKMARK AND SIZE SELECTION.
    return ChangeNotifierProvider(
      create: (_) => DetailsScreenProvider(),
      child: Scaffold(
        backgroundColor: const Color.fromRGBO(255, 255, 255, 1),
        
        /// APP BAR WITH BACK BUTTON AND BOOKMARK ACTION.
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
            /// BOOKMARK BUTTON THAT TOGGLES BETWEEN SAVED AND UNSAVED STATES.
            Consumer<DetailsScreenProvider>(
              builder: (context, provider, child) {
                return GestureDetector(
                  onTap: () {
                    provider.toggleBookmark();
                  },
                  child: Container(
                    margin: const EdgeInsets.only(right: 30),
                    width: 20,
                    height: 22,
                    child: provider.isBookMarked
                        ? const Icon(
                            Icons.bookmark,
                            size: 27,
                            color: Color.fromRGBO(13, 13, 14, 1),
                          )
                        : const Icon(
                            Icons.bookmark_border_rounded,
                            size: 27,
                            color: Color.fromRGBO(13, 13, 14, 1),
                          ),
                  ),
                );
              },
            )
          ],
        ),
        
        /// MAIN CONTENT BODY OF THE DETAILS SCREEN.
        body: Padding(
          padding: const EdgeInsets.only(
            left: 30,
            right: 30,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              
              /// PAGEVIEW TO DISPLAY IMAGES OF THE SELECTED ITEM.
              SizedBox(
                height: 450,
                child: PageView.builder(
                  controller: PageController(),
                  itemCount: 3,
                  itemBuilder: (context, index) {
                    return Stack(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(40),
                          child: Image.asset(
                            "${selectedItem?.img}",
                            width: MediaQuery.sizeOf(context).width,
                            height: 450,
                            fit: BoxFit.cover,
                          ),
                        ),
                        
                        /// INDICATOR FOR THE PAGEVIEW.
                        Positioned(
                          bottom: 9,
                          left: 150,
                          child: SmoothPageIndicator(
                            controller: PageController(),
                            count: 3,
                            effect: const ExpandingDotsEffect(
                              dotWidth: 4,
                              dotHeight: 4,
                              dotColor: Color.fromRGBO(255, 255, 255, 0.5),
                              activeDotColor: Color.fromRGBO(255, 255, 255, 1),
                            ),
                            onDotClicked: (index) => PageController().animateToPage(
                              index,
                              curve: Curves.easeIn,
                              duration: const Duration(milliseconds: 1000),
                            ),
                          ),
                        )
                      ],
                    );
                  },
                ),
              ),
              
              /// ROW TO DISPLAY ITEM DETAILS AND ICONS.
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
                        "${selectedItem?.name}",
                        style: GoogleFonts.imprima(
                            fontSize: 30,
                            fontWeight: FontWeight.w500,
                            color: const Color.fromRGBO(13, 13, 14, 1)),
                      ),
                    ],
                  ),
                  const Spacer(),
                  Image.asset("assets/images/ec2.png"),
                  const SizedBox(width: 10),
                  Image.asset("assets/images/ec3.png"),
                  const SizedBox(width: 10),
                  Image.asset("assets/images/ec1.png"),
                ],
              ),
              
              /// LABEL FOR SIZE OPTIONS.
              Text(
                "Size",
                style: GoogleFonts.imprima(
                    fontSize: 24,
                    fontWeight: FontWeight.w500,
                    color: const Color.fromRGBO(13, 13, 14, 1)),
              ),
              
              /// LISTVIEW FOR SIZE SELECTION OPTIONS.
              SizedBox(
                height: 30,
                child: Consumer<DetailsScreenProvider>(
                  builder: (context, provider, child) {
                    return ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemCount: sizeList.length,
                      separatorBuilder: (context, idx) => const SizedBox(
                        width: 30,
                      ),
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            provider.selectSize(index);
                          },
                          child: Container(
                            width: 45,
                            height: 45,
                            decoration: BoxDecoration(
                              color: provider.showColor(index),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Text(
                              textAlign: TextAlign.center,
                              sizeList[index],
                              style: GoogleFonts.imprima(
                                fontSize: 24,
                                fontWeight: FontWeight.w400,
                                color: provider.selectedSize != index
                                    ? const Color.fromRGBO(121, 119, 128, 1)
                                    : const Color.fromRGBO(255, 255, 255, 1),
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
              
              /// ROW TO DISPLAY PRICE AND ADD TO CART BUTTON.
              Row(
                children: [
                  Text(
                    "\$${selectedItem?.price}",
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
                      backgroundColor:
                          WidgetStatePropertyAll(Color.fromRGBO(255, 122, 0, 1)),
                    ),
                    child: Text(
                      "Add To Cart",
                      style: GoogleFonts.imprima(
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                        color: const Color.fromRGBO(255, 255, 255, 1),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}


