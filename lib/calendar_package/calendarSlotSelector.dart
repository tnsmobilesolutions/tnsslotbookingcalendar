// ignore_for_file: prefer__ructors, prefer__literals_to_create_immutables, library_private_types_in_public_api, prefer__ructors_in_immutables, use_build_context_synchronously, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:tns_slot_booking/calendar_package/common/utility/slot_generator.dart';
import 'package:tns_slot_booking/calendar_package/common/utility/widgets.dart';
import 'package:tns_slot_booking/calendar_package/common/widgets/Custom_Calendar.dart';
import 'package:tns_slot_booking/calendar_package/common/widgets/session_slots.dart';
import 'package:tns_slot_booking/custom_color.dart';

typedef List2VoidFunc = void Function(List<DateTime?>?);
typedef Date2VoidFunc = void Function(DateTime?);

class CalendarSlotSelector extends StatefulWidget {
  const CalendarSlotSelector(
      {Key? key,
      this.morningSessionStartTime,
      this.morningSessionEndTime,
      this.afternoonSessionStartTime,
      this.afternoonSessionEndTime,
      this.eveningSessionStartTime,
      this.eveningSessionEndTime,
      this.slotDuration,
      this.availableSlots,
      this.hideSlots,
      this.isMultiSelectMode,
      this.bookedSlotColor,
      this.selectedSlotColor,
      this.availableSlotColor,
      this.pauseSlotColor,
      this.selectedSlotText,
      this.availableSlotText,
      this.bookedSlotText,
      this.pauseSlotText,
      this.bookingButtonText,
      this.bookingButtonColor,
      this.borderColor,
      this.onBookButtonPressed,
      this.onSlotPressed,
      this.onSlotLongPressed,
      this.shouldShowSlotIcon,
      this.shouldHideUnusedSlots,
      this.slotIcon,
      this.bookedSlots,
      this.shouldShowBookingInfo,
      this.sessionIconColor,
      this.bookedSlotTextColor,
      this.availableSlotTextColor,
      this.showButton,
      this.textStyle,
      this.selectedSlotTextColor})
      : super(key: key);

  final int? afternoonSessionEndTime;
  final int? afternoonSessionStartTime;
  final Color? availableSlotColor;
  final String? availableSlotText;
  final List<DateTime?>? availableSlots;
  final Color? bookedSlotColor;
  final String? bookedSlotText;
  final Color? bookedSlotTextColor;
  final List<DateTime?>? bookedSlots;
  final Color? bookingButtonColor;
  final String? bookingButtonText;
  final Color? borderColor;
  final int? eveningSessionEndTime;
  final int? eveningSessionStartTime;
  final List<DateTime?>? hideSlots;
  final bool? isMultiSelectMode;
  final int? morningSessionEndTime;
  final int? morningSessionStartTime;
  final List2VoidFunc? onBookButtonPressed;
  final Date2VoidFunc? onSlotLongPressed;
  final Date2VoidFunc? onSlotPressed;
  final Color? pauseSlotColor;
  final String? pauseSlotText;
  final Color? selectedSlotColor;
  final String? selectedSlotText;
  final Color? sessionIconColor;
  final bool? shouldHideUnusedSlots;
  final bool? shouldShowBookingInfo;
  final bool? showButton;
  final bool? shouldShowSlotIcon;
  final int? slotDuration;
  final IconData? slotIcon;
  final Color? availableSlotTextColor;
  final Color? selectedSlotTextColor;
  final TextStyle? textStyle;

  @override
  _CalendarSlotSelectorState createState() => _CalendarSlotSelectorState();
}

class _CalendarSlotSelectorState extends State<CalendarSlotSelector> {
  bool isDateSelected = false;
  List<DateTime?>? selectedMultiSlotDateTime;

  DateTime _selectedDate = DateTime.now();

  onSlotsSelected(slotDateTime) {
    setState(() {
      if (selectedMultiSlotDateTime != null &&
          selectedMultiSlotDateTime!.contains(slotDateTime)) {}
      selectedMultiSlotDateTime ??= [];
      if (widget.isMultiSelectMode ?? false) {
        selectedMultiSlotDateTime?.add(slotDateTime);
      } else {
        selectedMultiSlotDateTime?.clear();
        selectedMultiSlotDateTime?.add(slotDateTime);
      }
    });
    if (widget.onSlotPressed != null) {
      widget.onSlotPressed!(slotDateTime);
    } else {}
  }

  onSlotLongPressed(slotDateTime) {
    if (widget.onSlotLongPressed != null) {
      widget.onSlotLongPressed!(slotDateTime);
    } else {}
  }

  // List<DateTime?>? sessionSeparator(List<DateTime?>? timeSlots) {
  //   List<DateTime?>? session;
  //   for (dynamic i = 0; i < timeSlots?.length; i++) {
  //     if(timeSlots != null && timeSlots[i]!.hour >= widget.morningSessionStartTime){

  //     }
  //   }
  //   return session;
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(left: 20, right: 20),
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                CustomCalendar(
                  onDateTimeChanged: (newDate) {
                    setState(() {
                      _selectedDate = newDate;
                    });
                  },
                ),
                SizedBox(height: 30),
                widget.shouldShowBookingInfo == true
                    ? CustomWidgets(
                        textStyle: widget.textStyle,
                        availableSlotColor: widget.availableSlotColor,
                        bookedSlotColor: widget.bookedSlotColor,
                        selectedSlotColor: widget.selectedSlotColor,
                        availableSlotText: widget.availableSlotText,
                        bookedSlotText: widget.bookedSlotText,
                        selectedSlotText: widget.selectedSlotText,
                      )
                    : SizedBox(width: 0),
                SizedBox(height: 20),
                SessionSlotsWidget(
                  availableSlotTextColor: widget.availableSlotTextColor,
                  selectedSlotTextColor: widget.selectedSlotTextColor,
                  bookedSlotTextColor: widget.bookedSlotTextColor,
                  selectedSlots: selectedMultiSlotDateTime,
                  availableSlots: widget.availableSlots,
                  bookedSlots: widget.bookedSlots,
                  sessionTitle: "Morning",
                  sessionIcon: Icon(
                    Icons.wb_twilight_rounded,
                    color: widget.sessionIconColor ?? Colors.black,
                  ),
                  sessionSlots: SlotGenerator.generateSlots(
                    DateTime(
                        _selectedDate.year,
                        _selectedDate.month,
                        _selectedDate.day,
                        widget.morningSessionStartTime ?? 8,
                        0),
                    DateTime(
                        _selectedDate.year,
                        _selectedDate.month,
                        _selectedDate.day,
                        widget.morningSessionEndTime ?? 12,
                        0),
                    widget.slotDuration ?? 20,
                    availableSlots: widget.availableSlots,
                    bookedSlots: widget.bookedSlots,
                    shouldHideUnusedSlots: widget.shouldHideUnusedSlots,
                    hideSlots: widget.hideSlots,
                  ),
                  onSlotSelected: onSlotsSelected,
                  onSlotLongPressed: onSlotLongPressed,
                  borderColor: widget.borderColor ?? CustomColor.lightBlue,
                  decorationColor:
                      widget.selectedSlotColor ?? CustomColor.lightBlue,
                  availableSlotColor: widget.availableSlotColor,
                  selectedSlotColor: widget.selectedSlotColor,
                  bookedSlotColor: widget.bookedSlotColor,
                  pauseSlotColor: widget.pauseSlotColor,
                  shouldShowSlotIcon: widget.shouldShowSlotIcon,
                  slotDuration: widget.slotDuration,
                  slotIcon: widget.slotIcon,
                ),
                SizedBox(height: 15),
                SessionSlotsWidget(
                  availableSlotTextColor: widget.availableSlotTextColor,
                  selectedSlotTextColor: widget.selectedSlotTextColor,
                  bookedSlotTextColor: widget.bookedSlotTextColor,
                  selectedSlots: selectedMultiSlotDateTime,
                  availableSlots: widget.availableSlots,
                  bookedSlots: widget.bookedSlots,
                  sessionTitle: "Afternoon",
                  sessionIcon: Icon(
                    Icons.light_mode_rounded,
                    color: widget.sessionIconColor ?? Colors.black,
                  ),
                  sessionSlots: SlotGenerator.generateSlots(
                    DateTime(
                        _selectedDate.year,
                        _selectedDate.month,
                        _selectedDate.day,
                        widget.afternoonSessionStartTime ?? 12,
                        0),
                    DateTime(
                        _selectedDate.year,
                        _selectedDate.month,
                        _selectedDate.day,
                        widget.afternoonSessionEndTime ?? 18,
                        0),
                    widget.slotDuration ?? 20,
                    bookedSlots: widget.bookedSlots,
                    availableSlots: widget.availableSlots,
                    shouldHideUnusedSlots: widget.shouldHideUnusedSlots,
                    hideSlots: widget.hideSlots,
                  ),
                  onSlotSelected: onSlotsSelected,
                  onSlotLongPressed: onSlotLongPressed,
                  borderColor: widget.borderColor ?? CustomColor.lightBlue,
                  decorationColor:
                      widget.selectedSlotColor ?? CustomColor.lightBlue,
                  availableSlotColor: widget.availableSlotColor,
                  selectedSlotColor: widget.selectedSlotColor,
                  bookedSlotColor: widget.bookedSlotColor ?? Colors.blue,
                  pauseSlotColor: widget.pauseSlotColor,
                  shouldShowSlotIcon: widget.shouldShowSlotIcon,
                  slotDuration: widget.slotDuration,
                  slotIcon: widget.slotIcon,
                ),
                SizedBox(height: 15),
                // Divider(thickness: 1),
                //SizedBox(height: 5),
                SessionSlotsWidget(
                  availableSlotTextColor: widget.availableSlotTextColor,
                  selectedSlotTextColor: widget.selectedSlotTextColor,
                  bookedSlotTextColor: widget.bookedSlotTextColor,
                  selectedSlots: selectedMultiSlotDateTime,
                  availableSlots: widget.availableSlots,
                  bookedSlots: widget.bookedSlots,
                  sessionTitle: "Evening",
                  sessionIcon: Icon(
                    Icons.dark_mode_rounded,
                    color: widget.sessionIconColor ?? Colors.black,
                  ),
                  sessionSlots: SlotGenerator.generateSlots(
                    DateTime(
                        _selectedDate.year,
                        _selectedDate.month,
                        _selectedDate.day,
                        widget.eveningSessionStartTime ?? 18,
                        0),
                    DateTime(
                        _selectedDate.year,
                        _selectedDate.month,
                        _selectedDate.day,
                        widget.eveningSessionEndTime ?? 22,
                        0),
                    widget.slotDuration ?? 20,
                    availableSlots: widget.availableSlots,
                    bookedSlots: widget.bookedSlots,
                    shouldHideUnusedSlots: widget.shouldHideUnusedSlots,
                    hideSlots: widget.hideSlots,
                  ),
                  onSlotSelected: onSlotsSelected,
                  onSlotLongPressed: onSlotLongPressed,
                  borderColor: widget.borderColor ?? CustomColor.lightBlue,
                  decorationColor:
                      widget.selectedSlotColor ?? CustomColor.lightBlue,
                  availableSlotColor: widget.availableSlotColor,
                  selectedSlotColor: widget.selectedSlotColor,
                  bookedSlotColor: widget.bookedSlotColor,
                  pauseSlotColor: widget.pauseSlotColor,
                  shouldShowSlotIcon: widget.shouldShowSlotIcon,
                  slotDuration: widget.slotDuration,
                  slotIcon: widget.slotIcon,
                ),
                SizedBox(height: 10),
                widget.showButton == true
                    ? GestureDetector(
                        onTap: () {
                          if (widget.onBookButtonPressed != null) {
                            widget.onBookButtonPressed!(
                                selectedMultiSlotDateTime);
                            selectedMultiSlotDateTime?.clear();
                          } else {}
                        },
                        child: Container(
                          height: 40,
                          width: 100,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: widget.bookingButtonColor ??
                                  CustomColor.lightBlue),
                          child: Text(
                            widget.bookingButtonText ?? 'Book',
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: CustomColor.white),
                          ),
                        ),
                      )
                    : SizedBox(),
                SizedBox(height: 5),
              ],
            ),
          ),
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: (() {}),
      // ),
    );
  }
}
