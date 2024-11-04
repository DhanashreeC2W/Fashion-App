import 'package:fashion_app/view/details_screen.dart';
import 'package:fashion_app/view/widget/bottom_navigation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:fashion_app/controller/home_screen_controller.dart';
import 'package:provider/provider.dart';

///THIS HOME SCREEN
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State createState() => _HomeScreenState();
}

class _HomeScreenState extends State {
  @override
  Widget build(BuildContext context) {
    ///OBTAIN ITEMS DATA OBJECT FROM PROVIDER
    final ItemsData itemDataObj = Provider.of(context);
    //  final selectedCategory = itemDataObj.selectedCategory;

    return Scaffold(
      backgroundColor: const Color.fromRGBO(2555, 255, 255, 1),
      bottomNavigationBar: const MyBottomNavigation(),

      ///PADDING TO THE ENTIRE BODY
      body: Padding(
        padding: const EdgeInsets.only(left: 30, right: 30, top: 50),
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ///ROW CONTAINING TWO ICONS
            Row(
              children: [
                Image.asset(
                  "assets/icons/icon1.png",
                  height: 30,
                  width: 30,
                ),
                const Spacer(),
                Image.asset(
                  "assets/icons/icon2.png",
                  height: 30,
                  width: 30,
                ),
              ],
            ),
            const SizedBox(
              height: 15,
            ),

            ///TITLE TEXT OF SCREEN
            Text("Explore",
                style: GoogleFonts.imprima(
                  fontSize: 36,
                  fontWeight: FontWeight.w600,
                  color: const Color.fromRGBO(13, 13, 14, 1),
                )),

            ///SUBTITLE BELOW THE TITLE
            Text(
              "Best trendy collection!",
              style: GoogleFonts.imprima(
                fontSize: 18,
                fontWeight: FontWeight.w400,
                color: const Color.fromRGBO(121, 119, 128, 1),
              ),
            ),
            const SizedBox(
              height: 20,
            ),

            ///HORIZONTAL LIST OF CATEGORY ITEMS
            SizedBox(
              height: 32,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: itemDataObj.categoryList.length,

                  ///NAMES IN THE CATEGORY LIST
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        itemDataObj.selectedCategories(index);
                      },
                      child: Container(
                        padding: const EdgeInsets.only(top: 5),
                        margin: const EdgeInsets.only(right: 40),
                        width: 90,
                        height: 32,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(32),
                          color: itemDataObj.showCategoryColor(index),
                        ),
                        child: Text(
                          itemDataObj.categoryList[index],
                          textAlign: TextAlign.center,
                          style: GoogleFonts.imprima(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: (itemDataObj.selectedCategory == index)
                                  ? const Color.fromRGBO(255, 255, 255, 1)
                                  : const Color.fromRGBO(13, 13, 14, 1)),
                        ),
                      ),
                    );
                  }),
            ),

            ///GRID VIEW OF ITEMS
            Expanded(
              child: GridView.custom(
                gridDelegate: SliverWovenGridDelegate.count(
                  crossAxisCount: 2,
                  crossAxisSpacing: 20,
                  pattern: [
                    const WovenGridTile(
                      6 / 10,
                      crossAxisRatio: 1,
                    ),
                  ],
                ),
                childrenDelegate: SliverChildBuilderDelegate(
                    childCount: itemDataObj.itemsList.length, (context, index) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ///GESTUREDETECTOR FOR NAVIGATING TO DETAILS SCREEN
                      GestureDetector(
                        onTap: () async {
                          itemDataObj
                              .selectItem(itemDataObj.itemsList[index]);
                          await Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const DetailsScreen()));
                        },
                  
                        ///IMAGES OF ITEM IN ITEM LIST
                        child: Stack(
                          children: [
                            Image.asset(itemDataObj.itemsList[index].img!,
                                width: 700, fit: BoxFit.cover),
                            Positioned(
                              bottom: 0,
                              right: 10,
                              //top: 100,
                  
                              child: Transform.translate(
                                offset: const Offset(0, 15),
                                child: Container(
                                  padding: const EdgeInsets.all(5),
                                  height: 40,
                                  width: 40,
                                  decoration: const BoxDecoration(
                                      color: Color.fromRGBO(255, 255, 255, 1),
                                      shape: BoxShape.circle),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(100),
                                    child: Container(
                                      alignment: Alignment.center,
                                      height: 36,
                                      width: 36,
                                      color:
                                          const Color.fromRGBO(13, 13, 13, 1),
                                      child: const Icon(
                                        size: 15,
                                        Icons.shopping_bag_rounded,
                                        color:
                                            Color.fromRGBO(255, 255, 255, 1),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                  
                      ///PRICE OF ITEM IN ITEM LIST
                      Text(
                        "\$${itemDataObj.itemsList[index].price}",
                        style: GoogleFonts.imprima(
                            fontSize: 19,
                            fontWeight: FontWeight.w600,
                            color: const Color.fromRGBO(13, 13, 14, 1)),
                        //overflow: TextOverflow.visible,
                      ),
                  
                      ///NAME OF ITEM IN ITEM LIST
                      Text(
                        itemDataObj.itemsList[index].name!,
                        style: GoogleFonts.imprima(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: const Color.fromRGBO(121, 119, 128, 1)),
                      ),
                    ],
                  );
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
