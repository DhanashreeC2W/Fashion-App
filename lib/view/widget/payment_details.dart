import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PaymentDetails extends StatelessWidget {
  final String name;
  final double amount;
  const PaymentDetails({super.key, required this.name, required this.amount});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
            children: [
              Text(
                name,
                style: GoogleFonts.imprima(
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                    color: const Color.fromRGBO(121, 119, 128, 1)),
              ),
              const Spacer(),
              Text(
                "\$$amount",
                style: GoogleFonts.imprima(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: const Color.fromRGBO(13, 13, 14, 1)),
              )
            ],
          ),
      ],
    );
    
  }
}
