import 'package:fashion_app/view/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FirstScreen extends StatefulWidget {
  const FirstScreen({super.key});

  @override
  State createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(255, 255, 255, 1),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            
            height:550,
            width: MediaQuery.of(context).size.width,
            child: Image.asset(
              "assets/images/first.png",
              height: 600,
              fit: BoxFit.cover,
            ),
          ),

          /// PADDING AROUND THE TEXT AND BUTTONS SECTION
          Padding(
            padding: const EdgeInsets.all(30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                /// TEXT DISPLAYING THE MAIN HEADING
                Text(
                  "Find The \nBest Collections",
                  style: GoogleFonts.imprima(
                    fontSize: 44,
                    fontWeight: FontWeight.bold,
                    color: const Color.fromRGBO(13, 13, 14, 1),
                  ),
                ),

                const SizedBox(height: 10),

                /// TEXT DISPLAYING THE DESCRIPTION
                Text(
                  "Get your dream item easily with FashionHub\nand get other interesting offers",
                  style: GoogleFonts.imprima(
                    color: const Color.fromRGBO(121, 119, 128, 1),
                    fontWeight: FontWeight.w400,
                    fontSize: 15,
                  ),
                ),

                const SizedBox(height: 29),

                /// ROW CONTAINING SIGN UP AND SIGN IN BUTTONS
                Row(
                  children: [
                    /// CONTAINER FOR THE SIGN UP BUTTON
                    Container(
                      width: 150,
                      height: 62,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(90),
                        color: const Color.fromRGBO(255, 255, 255, 1),
                        border: Border.all(
                          width: 1.5,
                          color: const Color.fromRGBO(13, 13, 14, 1),
                        ),
                      ),

                      /// SIGN UP BUTTON
                      child: ElevatedButton(
                        onPressed: () {},
                        style: const ButtonStyle(
                          backgroundColor: WidgetStatePropertyAll(
                            Color.fromRGBO(255, 255, 255, 1),
                          ),
                        ),
                        child: Text(
                          "Sign Up",
                          style: GoogleFonts.imprima(
                            color: const Color.fromRGBO(13, 13, 14, 1),
                            fontWeight: FontWeight.w600,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),

                    /// SPACER TO CREATE SPACE BETWEEN THE BUTTONS
                    const Spacer(),

                    /// CONTAINER FOR THE SIGN IN BUTTON
                    Container(
                      width: 150,
                      height: 62,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(90),
                        color: const Color.fromRGBO(255, 122, 0, 1),
                      ),

                      /// SIGN IN BUTTON
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const HomeScreen()));
                        },
                        style: const ButtonStyle(
                          backgroundColor: WidgetStatePropertyAll(
                            Color.fromRGBO(255, 122, 0, 1),
                          ),
                        ),
                        child: Text(
                          "Sign In",
                          style: GoogleFonts.imprima(
                            color: const Color.fromRGBO(255, 255, 255, 1),
                            fontWeight: FontWeight.w600,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
