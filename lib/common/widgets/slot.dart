// ignore_for_file: avoid_print, prefer__ructors, prefer_const_constructors, prefer_const_constructors_in_immutables, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:tns_slot_booking/common/utility/colors.dart';

//TODO slotDuration will be Duration type and slot icon should be passed from user
class SlotWidget extends StatelessWidget {
  SlotWidget(
      {Key? key,
      required this.time,
      required this.deselectedTime,
      required this.onTapped,
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
      this.slotIcon})
      : super(key: key);
  final IconData? slotIcon;
  final DateTime time;
  final DateTime deselectedTime;
  final Function onTapped;
  final Color? borderColor;
  final Color? bookedSlotColor;
  final Color? selectedSlotColor;
  final Color? availableSlotColor;
  final Color? pauseSlotColor;
  final bool? isAvailable;
  final bool? isSelected;
  final bool? isDeselected;
  final bool? isBooked;
  final bool? isPaused;
  final bool? shouldShowSlotIcon;
  final int? slotDuration;

  @override
  Widget build(BuildContext context) {
    final DateFormat formatter = DateFormat('jm');

    return GestureDetector(
      onTap: () {
        onTapped(time);
      },
      child: Container(
        margin: EdgeInsets.only(
          left: 5,
          top: 20,
          bottom: 20,
        ),
        decoration: BoxDecoration(
          color: getSlotColor(),
          // border: Border.all(
          //   color: getSlotColor() as Color,
          // ),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Padding(
          padding: EdgeInsets.only(
            left: 10,
            top: 20,
          ),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  formatter.format(time),
                  style: TextStyle(
                    fontSize: 15,
                    fontFamily: 'Product Sans',
                  ),
                ),
              ),
              shouldShowSloticon()
                  ? Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        GestureDetector(
                          child: Container(
                            height: 20,
                            width: 20,
                            decoration: BoxDecoration(
                                color: CustomColor.lightGreen,
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(5),
                                    bottomRight: Radius.circular(15))),
                            child: Icon(
                              slotIcon ?? Icons.video_call_rounded,
                              color: CustomColor.white,
                              size: 15,
                            ),
                          ),
                        )
                      ],
                    )
                  : SizedBox(height: 0),
            ],
          ),
        ),
      ),
    );
  }

  Color? getSlotColor() {
    if (isAvailable ?? false) {
      return availableSlotColor;
    } else if (isSelected ?? false) {
      return selectedSlotColor;
    } else if (isBooked ?? false) {
      return bookedSlotColor;
    } else if (isPaused ?? false) {
      return pauseSlotColor;
    } else if (isDeselected ?? false) {
      return Colors.grey[200];
    } else {
      return Colors.grey[200];
    }
  }

  bool shouldShowSloticon() {
    var present = false;
    if (DateTime.now().isAfter(time) &&
        DateTime.now()
            .isBefore(time.add(Duration(minutes: slotDuration ?? 0)))) {
      present = true;
    }
    return present && (shouldShowSlotIcon ?? false);
  }
}
