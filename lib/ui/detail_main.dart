import 'package:flutter/material.dart';
import 'package:flutter_calendar_carousel/classes/event.dart';
import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart';

class DetailMain extends StatefulWidget {
  @override
  _DetailMainState createState() => _DetailMainState();
}

class _DetailMainState extends State<DetailMain> {
  var dateNow = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.blue,
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              _sectionCalender(),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      children: <Widget>[
                        _sectionTrivia(),
                        _sectionPrayTime(),
                      ],
                    ),
                  ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _sectionCalender() {
    return Padding(
      padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
      child: CalendarCarousel<Event>(
        weekendTextStyle: TextStyle(
          color: Colors.grey,
        ),
        daysTextStyle: TextStyle(
          color: Colors.white,
        ),
        thisMonthDayBorderColor: Colors.grey,
        showHeader: true,
        weekFormat: true,
        height: 170.0,
        showIconBehindDayText: true,
        customGridViewPhysics: NeverScrollableScrollPhysics(),
        markedDateShowIcon: true,
        selectedDayTextStyle: TextStyle(
          color: Colors.yellow,
        ),
        todayTextStyle: TextStyle(
          color: Colors.blue,
        ),
        minSelectedDate: dateNow.subtract(Duration(days: 360)),
        maxSelectedDate: dateNow.add(Duration(days: 360)),
        todayButtonColor: Colors.transparent,
        todayBorderColor: Colors.green,
        markedDateMoreShowTotal: true,
        headerTextStyle: TextStyle(color: Colors.white),
        iconColor: Colors.white,
        weekdayTextStyle: TextStyle(color: Colors.white),
      ),
    );
  }

  _sectionTrivia() {
    return Card(
      color: Colors.blue,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      margin: EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        children: <Widget>[
          Text(
            "Are you have a fasting today?",
            style: TextStyle(color: Colors.white),
          ),
          Container(
            width: 50,
            height: 50,
            child: Icon(Icons.check),
          )
        ],
      ),
    );
  }

  _sectionPrayTime() {
    return Container();
  }
}
