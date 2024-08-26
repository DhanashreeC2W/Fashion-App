import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// SINGLE WIDGET USED FOR DISPLAYING PAYMENT DETAILS ON BOTH CART SCREEN AND CHECKOUT SCREEN
class PaymentDetails extends StatelessWidget {
  /// NAME OF THE PAYMENT DETAIL
  final String name;

  /// AMOUNT RELATED TO THE PAYMENT DETAIL
  final double amount;

  const PaymentDetails({super.key, required this.name, required this.amount});

  @override
  Widget build(BuildContext context) {
    /// COLUMN WIDGET TO ORGANIZE TEXT COMPONENTS VERTICALLY
    return Column(
      children: [
        /// ROW CONTAINING NAME OF PAYMENT DETAIL AND CORRESPONDING AMOUNT
        Row(
          children: [
            /// TEXT WIDGET DISPLAYING THE NAME OF THE PAYMENT DETAIL
            Text(
              name,
              style: GoogleFonts.imprima(
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                  color: const Color.fromRGBO(121, 119, 128, 1)),
            ),

            /// SPACER TO PUSH THE AMOUNT TEXT TO THE END OF THE ROW
            const Spacer(),

            /// TEXT WIDGET DISPLAYING THE AMOUNT
            Text(
              "\$$amount",
              style: GoogleFonts.imprima(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: const Color.fromRGBO(13, 13, 14, 1)),
            ),
          ],
        ),
      ],
    );
  }
}
