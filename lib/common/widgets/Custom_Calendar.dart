// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, prefer_const_constructors_in_immutables, library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:tns_slot_booking/tns_slot_booking.dart';

class CustomCalendar extends StatefulWidget {
  CustomCalendar({super.key, this.onDateTimeChanged});
  final ValueChanged<DateTime>? onDateTimeChanged;
  @override
  _CustomCalendarState createState() => _CustomCalendarState();
}

class _CustomCalendarState extends State<CustomCalendar> {
  DateTime selectedDate = DateTime.now(); // TO tracking date

  int currentDateSelectedIndex = 0; //For Horizontal Date
  ScrollController scrollController =
      ScrollController(); //To Track Scroll of ListView

  List<String> listOfMonths = [
    "Jan",
    "Feb",
    "Mar",
    "Apr",
    "May",
    "Jun",
    "Jul",
    "Aug",
    "Sep",
    "Oct",
    "Nov",
    "Dec"
  ];

  List<String> listOfDays = ["Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            //To Show Current Date
            Container(
                height: 30,
                margin: EdgeInsets.only(left: 10),
                alignment: Alignment.centerLeft,
                child: Text(
                  '${selectedDate.day}-${listOfMonths[selectedDate.month - 1]}, ${selectedDate.year}',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w800,
                      color: CustomColor.darkBlue),
                )),
            SizedBox(height: 10),
            //To show CustomCalendar Widget
            SizedBox(
              height: 80,
              child: ListView.separated(
                separatorBuilder: (BuildContext context, int index) {
                  return SizedBox(width: 10);
                },
                itemCount: 90,
                controller: scrollController,
                scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context, int index) {
                  return InkWell(
                    onTap: () {
                      setState(() {
                        currentDateSelectedIndex = index;
                        selectedDate =
                            DateTime.now().add(Duration(days: index));
                        widget.onDateTimeChanged!(selectedDate);
                      });
                    },
                    child: Container(
                      height: 80,
                      width: 80,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(17),
                          color: currentDateSelectedIndex == index
                              ? CustomColor.darkBlue
                              : Colors.grey[200]),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            listOfMonths[DateTime.now()
                                        .add(Duration(days: index))
                                        .month -
                                    1]
                                .toString(),
                            style: TextStyle(
                                fontSize: 16,
                                color: currentDateSelectedIndex == index
                                    ? Colors.white
                                    : Colors.grey),
                          ),
                          SizedBox(
                            height: 2,
                          ),
                          Text(
                            DateTime.now()
                                .add(Duration(days: index))
                                .day
                                .toString(),
                            style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.w700,
                                color: currentDateSelectedIndex == index
                                    ? Colors.white
                                    : Colors.grey),
                          ),
                          SizedBox(
                            height: 2,
                          ),
                          Text(
                            listOfDays[DateTime.now()
                                        .add(Duration(days: index))
                                        .weekday -
                                    1]
                                .toString(),
                            style: TextStyle(
                                fontSize: 16,
                                color: currentDateSelectedIndex == index
                                    ? Colors.white
                                    : Colors.grey),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
