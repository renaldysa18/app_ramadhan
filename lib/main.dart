import 'package:appramadan/utils/string_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart';
import 'package:intl/intl.dart' show DateFormat;

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var dateNow = DateTime.now();
  var formaterDate = DateFormat('yyyy MM dd');

  @override
  void initState() {
    super.initState();
    String today = formaterDate.format(dateNow);
    print("date today : $today");
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Stack(
                children: <Widget>[
                  Container(
                    height: 350,
                    width: double.infinity,
                    child: Image.asset(StringImages.image_woman),
                  ),
                  Positioned(
                    bottom: 8.0,
                    left: 15.0,
                    right: 15.0,
                    child: Container(
                      height: 100,
                      width: double.maxFinite,
                      child: Card(
                          color: Colors.blue,
                          shape: RoundedRectangleBorder(
                            side: BorderSide(color: Colors.white70, width: 1),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: <Widget>[
                              Container(
                                child: Text(
                                    "suhub"
                                ),
                              ),
                              Container(
                                child: Text(
                                    "suhub"
                                ),
                              ),
                            ],
                          )
                      ),
                    ),
                  ),
                ],
              ),
              Card(
                color: Colors.blue,
                shape: RoundedRectangleBorder(
                  side: BorderSide(color: Colors.white70, width: 1),
                  borderRadius: BorderRadius.circular(10),
                ),
                margin: EdgeInsets.symmetric(horizontal: 20),
                child: CalendarCarousel(
                  weekendTextStyle: TextStyle(
                    color: Colors.red,
                  ),
                  height: 380.0,
                  isScrollable: true,
                  todayButtonColor: Colors.yellow,
                  selectedDayTextStyle: TextStyle(
                    color: Colors.yellow,
                  ),
                  minSelectedDate: dateNow.subtract(Duration(days: 360)),
                  maxSelectedDate: dateNow.add(Duration(days: 360)),
                  showOnlyCurrentMonthDate: false,
                  weekFormat: false,
                  headerTextStyle: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 25.0,
                  ),
                  prevDaysTextStyle: TextStyle(
                    color: Colors.grey
                  ),
                  nextDaysTextStyle: TextStyle(
                    color: Colors.grey
                  ),
                  daysTextStyle: TextStyle(
                    color: Colors.white
                  ),
                  showHeaderButton: true,
                  iconColor: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
