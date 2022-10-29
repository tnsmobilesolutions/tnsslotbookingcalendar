// ignore_for_file: avoid_print, prefer__ructors, prefer_const_constructors, prefer_const_constructors_in_immutables, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:tns_slot_booking/common/utility/colors.dart';

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
  }) : super(key: key);

  final Color? availableSlotColor;
  final Color? bookedSlotColor;
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

  @override
  State<SlotWidget> createState() => _SlotWidgetState();
}

class _SlotWidgetState extends State<SlotWidget> {
  Color? getSlotColor() {
    if (widget.isAvailable ?? false) {
      return widget.availableSlotColor;
    } else if (widget.isSelected ?? false) {
      return widget.selectedSlotColor;
    } else if (widget.isBooked ?? false) {
      return widget.bookedSlotColor;
    } else if (widget.isPaused ?? false) {
      return widget.pauseSlotColor;
    } else if (widget.isDeselected ?? false) {
      return Colors.grey[200];
    } else {
      return Colors.grey[200];
    }
  }

  bool shouldShowIcon() {
    var present = false;
    if (DateTime.now().isAfter(widget.time) &&
        DateTime.now().isBefore(
            widget.time.add(Duration(minutes: widget.slotDuration ?? 0))) &&
        (widget.isBooked ?? false)) {
      setState(() {
        present = true;
      });
    }
    return present && (widget.shouldShowSlotIcon ?? false);
  }

  @override
  Widget build(BuildContext context) {
    final DateFormat formatter = DateFormat('jm');

    return GestureDetector(
      onTap: () {
        widget.onTapped(widget.time);
      },
      onLongPress: () {
        widget.onLongPressed(widget.time);
      },
      child: Container(
        margin: EdgeInsets.only(
          left: 5,
          top: 20,
          bottom: 20,
        ),
        decoration: BoxDecoration(
          color: getSlotColor(),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Padding(
          padding: EdgeInsets.only(
            left: 10,
            top: 20,
          ),
          child: Stack(
            alignment: AlignmentDirectional.bottomEnd,
            children: [
              Column(
                children: [
                  Expanded(
                    child: Center(
                      child: Column(
                        children: [
                          Text(
                            formatter.format(widget.time),
                            style: TextStyle(
                              fontSize: 15,
                              fontFamily: 'Product Sans',
                            ),
                          ),
                          SizedBox(height: 4),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              shouldShowIcon()
                  ? Container(
                      height: 20,
                      width: 20,
                      decoration: BoxDecoration(
                          color: CustomColor.lightGreen,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(5),
                              bottomRight: Radius.circular(15))),
                      child: Icon(
                        widget.slotIcon ?? Icons.video_call_rounded,
                        color: CustomColor.white,
                        size: 15,
                      ),
                    )
                  : SizedBox(height: 0),
            ],
          ),
        ),
      ),
    );
  }
}
