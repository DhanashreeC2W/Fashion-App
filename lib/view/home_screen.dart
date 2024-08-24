import 'package:fashion_app/controller/category_list.dart';
import 'package:fashion_app/view/details_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:fashion_app/controller/items_data.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State createState() => _HomeScreenState();
}

class _HomeScreenState extends State {
 
  @override
  Widget build(BuildContext context) {
    final ItemsData itemDataObj = Provider.of(context);
    
    return Scaffold(
      backgroundColor: const Color.fromRGBO(2555, 255, 255, 1),
      body: Padding(
        padding: const EdgeInsets.only(left: 30, right: 30, top: 50),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
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
            Text("Explore",
                style: GoogleFonts.imprima(
                  fontSize: 36,
                  fontWeight: FontWeight.w600,
                  color: const Color.fromRGBO(13, 13, 14, 1),
                )),
            Text(
              "Best trendy collection!",
              style: GoogleFonts.imprima(
                fontSize: 18,
                fontWeight: FontWeight.w400,
                color: const Color.fromRGBO(121, 119, 128, 1),
              ),
            ),
            const SizedBox(
              height: 10,
            ),

            SizedBox(
              height: 32,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: categoryList.length,
                itemBuilder: (context,index){
                return Container(
                  padding: const EdgeInsets.only(top: 5),
                  margin: const EdgeInsets.only(right: 40),
                  width: 90,
                  height: 32,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(32),
                    color: const Color.fromRGBO(255,122,0,1)
                  ),
                  child: Text(categoryList[index],
                  textAlign: TextAlign.center,
                  style:  GoogleFonts.imprima(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: const Color.fromRGBO(255, 255, 255, 1),
              ),
                  ),
                );
              }),
            ),
          const SizedBox(height: 10,),
            Expanded(
              child: GridView.custom(
                gridDelegate: SliverWovenGridDelegate.count(
                  crossAxisCount: 2,
                  mainAxisSpacing: 40,
                  crossAxisSpacing: 0,
                  tileBottomSpace: 18,
                  pattern: [
                    const WovenGridTile(1),
                    const WovenGridTile(
                      5 / 8,
                      crossAxisRatio: 0.9,
                      //alignment: AlignmentDirectional.centerEnd,
                    ),
                  ],
                ),
                childrenDelegate: SliverChildBuilderDelegate(
                  childCount: itemDataObj.itemsList.length,
                  (context, index){
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        GestureDetector(
                          onTap:(){
                             Navigator.of(context).push(
                              MaterialPageRoute(builder: (context)=>DetailsScreen(itemData: itemDataObj.itemsList[index],))
                             );
                          },
                          child: Image.asset(itemDataObj.itemsList[index].img!,
                          height: 190,
                          width: 400,),
                        ),
                        Text("\$${itemDataObj.itemsList[index].price}",
                          style: GoogleFonts.imprima(
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                            color: const Color.fromRGBO(13,13,14,1)
                          ),
                        ),
                        Text(itemDataObj.itemsList[index].name!,
                          style: GoogleFonts.imprima(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: const Color.fromRGBO(121,119,128,1)
                          ),
                        )
                      ],
                    );
                    
                  }
                  
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
