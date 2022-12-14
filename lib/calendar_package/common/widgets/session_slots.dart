// ignore_for_file: prefer_const_constructors, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:tns_slot_booking/calendar_package/common/utility/slot_generator.dart';
import 'package:tns_slot_booking/calendar_package/common/widgets/slot.dart';

class SessionSlotsWidget extends StatefulWidget {
  SessionSlotsWidget({
    Key? key,
    required this.sessionTitle,
    required this.sessionIcon,
    required this.sessionSlots,
    required this.onSlotSelected,
    required this.onSlotLongPressed,
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
    this.bookedSlots,
    this.bookedSlotTextColor,
    this.availableSlotTextColor,
    this.selectedSlotTextColor,
  }) : super(key: key);

  final Color? availableSlotColor;
  final List<DateTime?>? availableSlots;
  final Color? bookedSlotColor;
  final Color? bookedSlotTextColor;
  final List<DateTime?>? bookedSlots;
  final Color? borderColor;
  final Color? decorationColor;
  final bool? isMultiSelectMode;
  final Function onSlotLongPressed;
  final Function onSlotSelected;
  final Color? pauseSlotColor;
  final Color? selectedSlotColor;
  final List<DateTime?>? selectedSlots;
  final Icon sessionIcon;
  final List<DateTime> sessionSlots;
  final String sessionTitle;
  final bool? shouldShowSlotIcon;
  final int? slotDuration;
  final IconData? slotIcon;
  final Color? availableSlotTextColor;
  final Color? selectedSlotTextColor;

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
            widget.sessionIcon,
            SizedBox(width: 10),
            Text(
              widget.sessionTitle,
              style: Theme.of(context).textTheme.headline2,
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
              isBooked: SlotGenerator.isSlotPresent(
                  widget.sessionSlots[index], widget.bookedSlots),
              time: widget.sessionSlots[index],
              deselectedTime: widget.sessionSlots[index],
              onLongPressed: widget.onSlotLongPressed,
              onTapped: widget.onSlotSelected,
              bookedSlotTextColor: widget.bookedSlotTextColor,
              availableSlotTextColor: widget.availableSlotTextColor,
              selectedSlotTextColor: widget.selectedSlotTextColor,
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
