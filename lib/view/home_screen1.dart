import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State createState() => _HomeScreenState();
}

class _HomeScreenState extends State {
  bool flag = false;
  Tab myTab(String txt) {
    return Tab(
      child: ElevatedButton(
          onPressed: () {
            setState(() {
              flag = true;
            });
          },
          style: ButtonStyle(
              backgroundColor: (flag == false)
                  ? const WidgetStatePropertyAll((Colors.transparent))
                  : const WidgetStatePropertyAll(
                      (Color.fromRGBO(255, 122, 0, 1)),
                    )),
          child: Text(txt,
              style: GoogleFonts.imprima(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: const Color.fromRGBO(255, 255, 255, 1),
              ))),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(2555, 255, 255, 1),
      body: DefaultTabController(
        initialIndex: 0,
        length: 6,
        child: Padding(
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
              TabBar(

                  //mouseCursor: MouseCursor.uncontrolled,
                  isScrollable: true,
                  indicatorColor: Colors.transparent,
                  dividerColor: Colors.transparent,
                  tabs: [
                    myTab("All"),
                    myTab("Men"),
                    myTab("Women"),
                    myTab("kids"),
                    myTab("Other")
                  ]),
               GridView.custom(gridDelegate: SliverWovenGridDelegate.count(
                crossAxisCount: 2,
                pattern: [
                  WovenGridTile(1),
                  WovenGridTile(
                    5/7,crossAxisRatio: 0.9,
                    alignment: AlignmentDirectional.centerEnd
                  )
                ]
               ), childrenDelegate: SliverChildBuilderDelegate((context,index)=>
               Container(
                height: 20,
                width: 20,
                color: Colors.amber,
               ))
               )
            ],
          ),
        ),
      ),
    );
  }
}
