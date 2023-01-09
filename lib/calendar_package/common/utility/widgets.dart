// ignore_for_file: prefer__constructors_in_immutables, prefer_const_constructors, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';

class CustomWidgets extends StatelessWidget {
  CustomWidgets({
    Key? key,
    this.bookedSlotColor,
    this.selectedSlotColor,
    this.availableSlotColor,
    this.selectedSlotText,
    this.availableSlotText,
    this.bookedSlotText,
    this.textStyle,
  }) : super(key: key);

  final Color? bookedSlotColor;
  final Color? selectedSlotColor;
  final Color? availableSlotColor;
  final String? selectedSlotText;
  final String? availableSlotText;
  final String? bookedSlotText;
  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.rectangle_rounded,
              color: availableSlotColor ?? Colors.tealAccent,
            ),
            SizedBox(width: 5),
            Text(
              availableSlotText ?? 'Available',
              style: textStyle,
            ),
            SizedBox(width: 20),
            Icon(
              Icons.rectangle_rounded,
              color: bookedSlotColor ?? Colors.yellow,
            ),
            SizedBox(width: 5),
            Text(
              bookedSlotText ?? 'Booked',
              style: textStyle,
            ),
            SizedBox(width: 20),
            Icon(
              Icons.rectangle_rounded,
              color: selectedSlotColor ?? Colors.yellow,
            ),
            SizedBox(width: 5),
            Text(
              selectedSlotText ?? 'Selected',
              style: textStyle,
            ),
          ],
        ),
      ],
    );
  }
}
