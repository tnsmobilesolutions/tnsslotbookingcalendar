// ignore_for_file: prefer_const_constructors, prefer_const_constructors_in_immutables

import 'package:flutter_calendar_carousel/classes/event.dart';
import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart';
import 'package:flutter/material.dart';
import 'package:tns_slot_booking/common/utility/colors.dart';

class CalendarWidget extends StatefulWidget {
  CalendarWidget({Key? key, this.onDateTimeChanged}) : super(key: key);
  final ValueChanged<DateTime>? onDateTimeChanged;

  @override
  State<CalendarWidget> createState() => _CalendarWidgetState();
}

class _CalendarWidgetState extends State<CalendarWidget> {
  @override
  Widget build(BuildContext context) {
    DateTime selectedDate = DateTime.now();
    return CalendarCarousel<Event>(
      onDayPressed: (date, events) {
        setState(() {
          widget.onDateTimeChanged!(date);
          selectedDate = date;
        });
      },
      isScrollable: false,
      weekendTextStyle: TextStyle(
        color: CustomColor.purple,
      ),
      leftButtonIcon:
          Icon(Icons.arrow_left_rounded, size: 40, color: CustomColor.purple),
      rightButtonIcon:
          Icon(Icons.arrow_right_rounded, size: 40, color: CustomColor.purple),
      thisMonthDayBorderColor: CustomColor.purple,
      headerTextStyle: TextStyle(color: CustomColor.purple, fontSize: 20),
      weekFormat: true,
      height: 150.0,
      showOnlyCurrentMonthDate: false,
      selectedDateTime: selectedDate,
      showIconBehindDayText: true,
      daysHaveCircularBorder: true,
      customGridViewPhysics: NeverScrollableScrollPhysics(),
      markedDateShowIcon: true,
      markedDateIconMaxShown: 2,
      selectedDayTextStyle: TextStyle(color: CustomColor.white),
      selectedDayButtonColor: CustomColor.purple,
      selectedDayBorderColor: CustomColor.purple,
      todayTextStyle: TextStyle(color: CustomColor.darkblue),
      markedDateIconBuilder: (event) {
        return event.icon ?? Icon(Icons.help_outline);
      },
      todayButtonColor: Colors.transparent,
      todayBorderColor: CustomColor.purple,
      markedDateMoreShowTotal: true,
    );
  }
}
