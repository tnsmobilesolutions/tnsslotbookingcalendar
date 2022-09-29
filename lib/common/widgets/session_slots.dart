// ignore_for_file: prefer_const_constructors, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:tns_slot_booking/common/utility/slot_generator.dart';
import 'package:tns_slot_booking/common/widgets/slot.dart';

class SessionSlotsWidget extends StatefulWidget {
  SessionSlotsWidget({
    Key? key,
    required this.sessionTitle,
    required this.sessionIcon,
    required this.sessionSlots,
    required this.onSlotSelected,
    this.decorationColor,
    this.borderColor,
    this.selectedSlots,
    this.availableSlots,
    this.bookedSlotColor,
    this.selectedSlotColor,
    this.availableSlotColor,
    this.isMultiSelectMode,
    this.pauseSlotColor,
    this.shouldShowSlotIcon,
    this.slotDuration,
    this.slotIcon,
  }) : super(key: key);
  final IconData? slotIcon;
  final String sessionTitle;
  final ImageProvider<Object> sessionIcon;
  final List<DateTime> sessionSlots;
  final Function onSlotSelected;
  final Color? decorationColor;
  final Color? borderColor;
  final List<DateTime?>? selectedSlots;
  final List<DateTime?>? availableSlots;
  final Color? bookedSlotColor;
  final Color? selectedSlotColor;
  final Color? availableSlotColor;
  final Color? pauseSlotColor;
  final bool? isMultiSelectMode;
  final bool? shouldShowSlotIcon;
  final int? slotDuration;

  @override
  State<SessionSlotsWidget> createState() => _SessionSlotsWidgetState();
}

class _SessionSlotsWidgetState extends State<SessionSlotsWidget> {
  int selectedSlot = -1;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Image(
              image: widget.sessionIcon,
            ),
            SizedBox(width: 10),
            Text(
              widget.sessionTitle,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                fontFamily: 'Product Sans',
              ),
            ),
          ],
        ),
        GridView.builder(
          addAutomaticKeepAlives: false,
          physics: ScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
          ),
          shrinkWrap: true,
          itemCount: widget.sessionSlots.length,
          itemBuilder: (context, index) {
            return SlotWidget(
              isSelected: SlotGenerator.isSlotPresent(
                  widget.sessionSlots[index], widget.selectedSlots),
              isAvailable: SlotGenerator.isSlotPresent(
                  widget.sessionSlots[index], widget.availableSlots),
              time: widget.sessionSlots[index],
              deselectedTime: widget.sessionSlots[index],
              onTapped: widget.onSlotSelected,
              borderColor: widget.borderColor ?? Colors.blue,
              availableSlotColor: widget.availableSlotColor,
              bookedSlotColor: widget.bookedSlotColor,
              selectedSlotColor: widget.selectedSlotColor,
              pauseSlotColor: widget.pauseSlotColor,
              shouldShowSlotIcon: widget.shouldShowSlotIcon,
              slotDuration: widget.slotDuration,
              slotIcon: widget.slotIcon,
            );
          },
        )
      ],
    );
  }
}
