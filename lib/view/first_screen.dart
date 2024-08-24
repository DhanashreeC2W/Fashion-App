import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FirstScreen extends StatefulWidget{
  const FirstScreen({super.key});
  @override  

  State createState()=> _FirstScreenState();
}

class _FirstScreenState extends State{
  @override   

  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: const Color.fromRGBO(255,255,255,1) ,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children:[
          Container(
            width: MediaQuery.sizeOf(context).width,
            height: 550,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child: Image.asset("assets/images/first.jpg",
                height: 465,
              
              fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding:const EdgeInsets.all(30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                 Text("Find The \nBest Collections",
                 style: GoogleFonts.imprima(
                  fontSize: 42,
                  fontWeight: FontWeight.w900,
                  color: const Color.fromRGBO(13,13,14,1),
                 )
                 ),
                 const SizedBox(height: 10,),
                 Text("Get your dream item easily with FashionHub\nand get other intersting offer",
                  style:GoogleFonts.imprima(
                    color:const Color.fromRGBO(121,119,128,1),
                    fontWeight:FontWeight.w400,
                    fontSize:15,
                  ),
                 ),
                 const SizedBox(height: 29,),
                 Row(
                   children: [
                     Container(
                      width: 150,
                      height: 62,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(90),
                        color: const Color.fromRGBO(255,255,255,1),
                        border: Border.all(width: 1.5,color: const Color.fromRGBO(13,13,14,1))
                      ),
                       child: ElevatedButton(
                        onPressed: (){},
                          style: const ButtonStyle(
                            backgroundColor: WidgetStatePropertyAll(Color.fromRGBO(255,255,255,1))
                          ),
                         child: Text("Sign Up",
                         style: GoogleFonts.imprima(
                        color:const Color.fromRGBO(13,13,14,1),
                        fontWeight:FontWeight.w600,
                        fontSize:18,
                      ),
                         )
                         ),
                     ),
                     const Spacer(),
                      Container(
                      width: 150,
                      height: 62,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(90),
                        color: const Color.fromRGBO(255,122,0,1),
                      ),
                       child: ElevatedButton(
                        onPressed: (){},
                          style: const ButtonStyle(
                            backgroundColor: WidgetStatePropertyAll(Color.fromRGBO(255,122,0,1))
                          ),
                         child: Text("Sign In",
                         style: GoogleFonts.imprima(
                        color:const Color.fromRGBO(255,255,255,1),
                        fontWeight:FontWeight.w600,
                        fontSize:18,
                      ),
                         )
                         ),
                     ),
                   ],
                 ),
              ],
            ),
          )
        ],
      ),
    );
  }
}