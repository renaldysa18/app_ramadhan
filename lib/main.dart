import 'package:appramadan/bloc/pray_bloc.dart';
import 'package:appramadan/model/datetime_model.dart';
import 'package:appramadan/ui/detail_main.dart';
import 'package:appramadan/utils/string_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_calendar_carousel/classes/event.dart';
import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart';
import 'package:intl/intl.dart' show DateFormat;

import 'model/main_model.dart';

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
  String subuhTime;
  String maghribTime;

  @override
  void initState() {
    super.initState();
    String date = DateFormat('yyyy-MM-dd').format(dateNow);
    prayBloc.fetchPrayTime(city: 'Malang', date: date);
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
                    child: _sectionImage(),
                  ),
                  Positioned(
                    bottom: 8.0,
                    left: 15.0,
                    right: 15.0,
                    child: Container(
                      height: 80,
                      width: double.maxFinite,
                      child: StreamBuilder(
                        stream: prayBloc.praytime,
                        builder: (context, AsyncSnapshot<MainModel> snapshot){
                          if(snapshot.hasData){
                            var data = snapshot.data.results.datetime;
                            return _sectionTime(data);
                          } else if(snapshot.hasError) {
                            return Text(snapshot.error.toString());
                          }
                          return Center(child: CircularProgressIndicator(),);
                        },
                      ),
                    ),
                  ),
                ],
              ),
              _sectionDate(),
            ],
          ),
        ),
      ),
    );
  }

  _sectionImage() {
    return Image.asset(StringImages.image_woman);
  }

  _sectionTime(List<DateTimeModel> data) {
    return Card(
        color: Colors.lightBlueAccent.withOpacity(0.2),
        shape: RoundedRectangleBorder(
          side: BorderSide(color: Colors.white70, width: 1),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Expanded(
                child: Card(
                  color: Colors.blue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "Imsak",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w100
                          ),
                        ),
                        Text(
                          data[0].times.Imsak,
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Card(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "Maghrib",
                          style: TextStyle(
                              color: Colors.blue,
                              fontWeight: FontWeight.w100
                          ),
                        ),
                        Text(
                          data[0].times.Maghrib,
                          style: TextStyle(
                            color: Colors.blue,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        )
    );
  }

  _sectionDate() {
    return Card(
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
        onDayPressed: (DateTime date, List<Event> events) {
          String chooseDate = DateFormat('yyyy-MM-dd').format(date);
          _navigateToDetail(context, chooseDate);
        },
      ),
    );
  }

  _navigateToDetail(context, String chooseDate){
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => DetailMain(chooseDate)),
    );
  }
}
