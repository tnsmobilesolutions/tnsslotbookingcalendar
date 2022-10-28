// ignore_for_file: prefer__ructors, prefer__literals_to_create_immutables, library_private_types_in_public_api, prefer__ructors_in_immutables, use_build_context_synchronously, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:tns_slot_booking/common/utility/colors.dart';
import 'package:tns_slot_booking/common/utility/slot_generator.dart';
import 'package:tns_slot_booking/common/utility/widgets.dart';
import 'package:tns_slot_booking/common/widgets/calendar_widget.dart';
import 'package:tns_slot_booking/common/widgets/session_slots.dart';

typedef List2VoidFunc = void Function(List<DateTime?>?);
typedef Date2VoidFunc = void Function(DateTime?);

class CalendarSlotSelector extends StatefulWidget {
  const CalendarSlotSelector({
    Key? key,
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
    this.onApply,
    this.onSlotSelected,
    this.onSlotLongPressed,
    this.shouldShowSlotIcon,
    this.shouldHideUnusedSlots,
    this.slotIcon,
    this.bookedSlots,
  }) : super(key: key);
  final IconData? slotIcon;
  final int? morningSessionStartTime;
  final int? morningSessionEndTime;
  final int? afternoonSessionStartTime;
  final int? afternoonSessionEndTime;
  final int? eveningSessionStartTime;
  final int? eveningSessionEndTime;
  final int? slotDuration;
  final List<DateTime?>? availableSlots;
  final List<DateTime?>? bookedSlots;
  final List<DateTime?>? hideSlots;
  final bool? isMultiSelectMode;
  final Color? bookedSlotColor;
  final Color? selectedSlotColor;
  final Color? availableSlotColor;
  final Color? pauseSlotColor;
  final String? selectedSlotText;
  final String? availableSlotText;
  final String? bookedSlotText;
  final String? pauseSlotText;
  final String? bookingButtonText;
  final Color? bookingButtonColor;
  final Color? borderColor;
  final List2VoidFunc? onApply;
  final Date2VoidFunc? onSlotSelected;
  final Date2VoidFunc? onSlotLongPressed;
  final bool? shouldShowSlotIcon;
  final bool? shouldHideUnusedSlots;

  @override
  _CalendarSlotSelectorState createState() => _CalendarSlotSelectorState();
}

class _CalendarSlotSelectorState extends State<CalendarSlotSelector> {
  bool isDateSelected = false;
  List<DateTime?>? selectedMultiSlotDateTime;

  onSlotsSelected(slotDateTime) {
    //print(slotDateTime);
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
    if (widget.onSlotSelected != null) {
      widget.onSlotSelected!(slotDateTime);
    } else {
      //print("onSlotSelected callback is passed as null");
    }
  }

  onSlotLongPressed(slotDateTime) {
    //print('slotDateTime - $slotDateTime');
  }

  DateTime _selectedDate = DateTime.now();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Colors.transparent,
      //   automaticallyImplyLeading: false,
      //   elevation: 0,
      // ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(left: 20, right: 20),
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 16.0),
                  child: CalendarWidget(
                    onDateTimeChanged: (newDate) {
                      setState(() {
                        _selectedDate = newDate;
                      });
                    },
                  ),
                ),
                SizedBox(height: 30),
                Divider(thickness: 1),
                SizedBox(height: 5),
                CustomWidgets(
                  availableSlotColor: widget.availableSlotColor,
                  bookedSlotColor: widget.bookedSlotColor,
                  pauseSlotColor: widget.pauseSlotColor,
                  selectedSlotColor: widget.selectedSlotColor,
                  availableSlotText: widget.availableSlotText,
                  bookedSlotText: widget.bookedSlotText,
                  pauseSlotText: widget.pauseSlotText,
                  selectedSlotText: widget.selectedSlotText,
                ),
                SizedBox(height: 5),
                Divider(thickness: 1),
                SessionSlotsWidget(
                  selectedSlots: selectedMultiSlotDateTime,
                  availableSlots: widget.availableSlots,
                  bookedSlots: widget.bookedSlots,
                  sessionTitle: "Morning",
                  sessionIcon: AssetImage(
                      'assets/images/slot_booking_icons/sunrise24.png'),
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
                    shouldHideUnusedSlots: widget.shouldHideUnusedSlots,
                    hideSlots: widget.hideSlots,
                  ),
                  onSlotSelected: onSlotsSelected,
                  onSlotLongPressed: onSlotLongPressed,
                  borderColor: widget.borderColor ?? CustomColor.lightPink,
                  decorationColor:
                      widget.selectedSlotColor ?? CustomColor.lightPink,
                  availableSlotColor: widget.availableSlotColor,
                  selectedSlotColor: widget.selectedSlotColor,
                  bookedSlotColor: widget.bookedSlotColor,
                  pauseSlotColor: widget.pauseSlotColor,
                  shouldShowSlotIcon: widget.shouldShowSlotIcon,
                  slotDuration: widget.slotDuration,
                  slotIcon: widget.slotIcon,
                ),
                SizedBox(height: 5),
                Divider(thickness: 1),
                SizedBox(height: 5),
                SessionSlotsWidget(
                  selectedSlots: selectedMultiSlotDateTime,
                  availableSlots: widget.availableSlots,
                  bookedSlots: widget.bookedSlots,
                  sessionTitle: "Afternoon",
                  sessionIcon:
                      AssetImage('assets/images/slot_booking_icons/noon.png'),
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
                    availableSlots: widget.availableSlots,
                    shouldHideUnusedSlots: widget.shouldHideUnusedSlots,
                    hideSlots: widget.hideSlots,
                  ),
                  onSlotSelected: onSlotsSelected,
                  onSlotLongPressed: onSlotLongPressed,
                  borderColor: widget.borderColor ?? CustomColor.lightPink,
                  decorationColor:
                      widget.selectedSlotColor ?? CustomColor.lightPink,
                  availableSlotColor: widget.availableSlotColor,
                  selectedSlotColor: widget.selectedSlotColor,
                  bookedSlotColor: widget.bookedSlotColor ?? Colors.blue,
                  pauseSlotColor: widget.pauseSlotColor,
                  shouldShowSlotIcon: widget.shouldShowSlotIcon,
                  slotDuration: widget.slotDuration,
                  slotIcon: widget.slotIcon,
                ),
                SizedBox(height: 5),
                Divider(thickness: 1),
                SizedBox(height: 5),
                SessionSlotsWidget(
                  selectedSlots: selectedMultiSlotDateTime,
                  availableSlots: widget.availableSlots,
                  bookedSlots: widget.bookedSlots,
                  sessionTitle: "Evening",
                  sessionIcon: AssetImage(
                      'assets/images/slot_booking_icons/evening.png'),
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
                    shouldHideUnusedSlots: widget.shouldHideUnusedSlots,
                    hideSlots: widget.hideSlots,
                  ),
                  onSlotSelected: onSlotsSelected,
                  onSlotLongPressed: onSlotLongPressed,
                  borderColor: widget.borderColor ?? CustomColor.lightPink,
                  decorationColor:
                      widget.selectedSlotColor ?? CustomColor.lightPink,
                  availableSlotColor: widget.availableSlotColor,
                  selectedSlotColor: widget.selectedSlotColor,
                  bookedSlotColor: widget.bookedSlotColor,
                  pauseSlotColor: widget.pauseSlotColor,
                  shouldShowSlotIcon: widget.shouldShowSlotIcon,
                  slotDuration: widget.slotDuration,
                  slotIcon: widget.slotIcon,
                ),
                ElevatedButton(
                  onPressed: () {
                    if (widget.onApply != null) {
                      widget.onApply!(selectedMultiSlotDateTime);
                      // Clear the multi slot selector list
                      selectedMultiSlotDateTime?.clear();
                    } else {
                      print("onApply method is set as null");
                    }
                  },
                  child: Text(widget.bookingButtonText ?? 'Book'),
                ),
                SizedBox(height: 5),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
