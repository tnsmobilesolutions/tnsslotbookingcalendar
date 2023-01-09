// ignore_for_file: avoid_print, prefer__ructors, prefer_const_constructors, prefer_const_constructors_in_immutables, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:tns_slot_booking/custom_color.dart';

class SlotWidget extends StatefulWidget {
  SlotWidget({
    Key? key,
    required this.time,
    required this.deselectedTime,
    required this.onTapped,
    required this.onLongPressed,
    this.borderColor,
    this.bookedSlotColor,
    this.selectedSlotColor,
    this.availableSlotColor,
    this.pauseSlotColor,
    this.isAvailable,
    this.isSelected,
    this.isDeselected,
    this.isBooked,
    this.isPaused,
    this.shouldShowSlotIcon,
    this.slotDuration,
    this.slotIcon,
    this.bookedSlotTextColor,
    this.availableSlotTextColor,
    this.selectedSlotTextColor,
  }) : super(key: key);

  final Color? availableSlotColor;
  final Color? bookedSlotColor;
  final Color? bookedSlotTextColor;
  final Color? borderColor;
  final DateTime deselectedTime;
  final bool? isAvailable;
  final bool? isBooked;
  final bool? isDeselected;
  final bool? isPaused;
  final bool? isSelected;
  final Function onLongPressed;
  final Function onTapped;
  final Color? pauseSlotColor;
  final Color? selectedSlotColor;
  final bool? shouldShowSlotIcon;
  final int? slotDuration;
  final IconData? slotIcon;
  final DateTime time;
  final Color? availableSlotTextColor;
  final Color? selectedSlotTextColor;

  @override
  State<SlotWidget> createState() => _SlotWidgetState();
}

class _SlotWidgetState extends State<SlotWidget> {
  Color? getSlotColor() {
    if (widget.isBooked == true) {
      return widget.bookedSlotColor;
    } else if (widget.isAvailable == true) {
      return widget.availableSlotColor;
    } else if (widget.isSelected == true) {
      return widget.selectedSlotColor;
    } else if (widget.isPaused == true) {
      return widget.pauseSlotColor;
    } else if (widget.isDeselected == true) {
      return Colors.grey[200];
    } else {
      return null;
    }
  }

  bool shouldShowIcon() {
    var present = false;
    if (DateTime.now().isAfter(widget.time) &&
        DateTime.now().isBefore(
            widget.time.add(Duration(minutes: widget.slotDuration ?? 0))) &&
        (widget.isBooked == true)) {
      setState(() {
        present = true;
      });
    }
    return present && (widget.shouldShowSlotIcon == true);
  }

  Widget customContainer(String slotTime) {
    return SizedBox(
      child: Padding(
        padding: EdgeInsets.only(left: 5, right: 5, top: 20, bottom: 20),
        child: Stack(
          alignment: Alignment.bottomRight,
          children: [
            Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: getSlotColor(),
              ),
              child: Text(
                slotTime,
                style: TextStyle(
                  fontSize: 12,
                  color: widget.isBooked == true
                      ? widget.bookedSlotTextColor
                      : widget.isAvailable == true
                          ? widget.availableSlotTextColor
                          : widget.isSelected == true
                              ? widget.selectedSlotTextColor
                              : CustomColor.darkBlue,
                ),
              ),
            ),
            shouldShowIcon()
                ? Container(
                    height: 20,
                    width: 20,
                    decoration: BoxDecoration(
                        color: CustomColor.darkBlue,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(5),
                            bottomRight: Radius.circular(15))),
                    child: Icon(
                      widget.slotIcon ?? Icons.video_call_rounded,
                      color: Colors.white,
                      size: 15,
                    ),
                  )
                : SizedBox(height: 0),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final DateFormat formatter = DateFormat('jm');
    return InkWell(
      onTap: () {
        widget.onTapped(widget.time);
      },
      onLongPress: () {
        widget.onLongPressed(widget.time);
      },
      child: customContainer(formatter.format(widget.time)),
    );
  }
}


 // shouldShowIcon()
              //     ? Container(
              //         height: 20,
              //         width: 20,
              //         decoration: BoxDecoration(
              //             color: CustomColor.lightGreen,
              //             borderRadius: BorderRadius.only(
              //                 topLeft: Radius.circular(5),
              //                 bottomRight: Radius.circular(15))),
              //         child: Icon(
              //           widget.slotIcon ?? Icons.video_call_rounded,
              //           color: Colors.white,
              //           size: 15,
              //         ),
              //       )
              //     : SizedBox(height: 0),
