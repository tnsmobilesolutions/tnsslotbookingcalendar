// ignore_for_file: prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';

class CustomWidgets extends StatelessWidget {
  CustomWidgets({
    Key? key,
    this.bookedSlotColor,
    this.selectedSlotColor,
    this.availableSlotColor,
    this.pauseSlotColor,
    this.selectedSlotText,
    this.availableSlotText,
    this.bookedSlotText,
    this.pauseSlotText,
  }) : super(key: key);

  final Color? bookedSlotColor;
  final Color? selectedSlotColor;
  final Color? availableSlotColor;
  final Color? pauseSlotColor;
  final String? selectedSlotText;
  final String? availableSlotText;
  final String? bookedSlotText;
  final String? pauseSlotText;

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
            const SizedBox(width: 5),
            Text(
              availableSlotText ?? 'Available',
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(width: 20),
            Icon(
              Icons.rectangle_rounded,
              color: bookedSlotColor ?? Colors.yellow,
            ),
            const SizedBox(width: 5),
            Text(
              bookedSlotText ?? 'Booked',
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.rectangle_rounded,
              color: selectedSlotColor ?? Colors.yellow,
            ),
            const SizedBox(width: 5),
            Text(
              selectedSlotText ?? 'Selected',
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(width: 20),
            Icon(
              Icons.rectangle_rounded,
              color: pauseSlotColor ?? Colors.yellow,
            ),
            const SizedBox(width: 5),
            Text(
              pauseSlotText ?? 'Pause',
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
