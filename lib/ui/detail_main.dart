import 'package:appramadan/bloc/pray_bloc.dart';
import 'package:appramadan/model/main_model.dart';
import 'package:appramadan/model/time_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_calendar_carousel/classes/event.dart';
import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart';

class DetailMain extends StatefulWidget {
  String date;

  DetailMain(this.date);

  @override
  _DetailMainState createState() => _DetailMainState(date);
}

class _DetailMainState extends State<DetailMain> {
  String date;

  _DetailMainState(this.date);

  @override
  void initState() {
    super.initState();
    prayBloc.fetchPrayTime(city: 'Malang', date: date);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.blue,
        body: Column(
          children: <Widget>[
            _sectionCalender(),
            Expanded(
              flex: 1,
              child: Card(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20)),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(
                      top: 16, left: 10, right: 10, bottom: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      _sectionTrivia(),
                      Container(
                        margin: EdgeInsets.only(top: 20, left: 10, bottom: 15),
                        child: Text(
                          "Schedule",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                              fontSize: 20),
                        ),
                      ),
                      StreamBuilder(
                        stream: prayBloc.praytime,
                        builder: (context, AsyncSnapshot<MainModel> snapshot) {
                          if (snapshot.hasData) {
                            var data = snapshot.data.results.datetime[0].times;
                            return _sectionPrayTime(data);
                          } else if (snapshot.hasError) {
                            return Text(snapshot.error.toString());
                          }
                          return Center(
                            child: CircularProgressIndicator(),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
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
        height: 145.0,
        showIconBehindDayText: true,
        customGridViewPhysics: NeverScrollableScrollPhysics(),
        markedDateShowIcon: true,
        selectedDayTextStyle: TextStyle(
          color: Colors.yellow,
        ),
        todayButtonColor: Colors.transparent,
        todayBorderColor: Colors.green,
        markedDateMoreShowTotal: true,
        headerTextStyle: TextStyle(
            color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
        isScrollable: false,
        showHeaderButton: false,
        weekdayTextStyle: TextStyle(color: Colors.white),
        selectedDateTime: DateTime.parse(date),
      ),
    );
  }

  _sectionTrivia() {
    return Card(
      color: Colors.blue,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(10, 20, 10, 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              "Are you have a fasting today?",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            Container(
                width: 40,
                height: 40,
                child: Icon(
                  Icons.check,
                  color: Colors.blue,
                ),
                decoration:
                    BoxDecoration(shape: BoxShape.circle, color: Colors.white))
          ],
        ),
      ),
    );
  }

  _sectionPrayTime(TimeModel data) {
    return Expanded(
      child: ListView(
        shrinkWrap: true,
        children: <Widget>[
          _cardPrayTime("Imsak", data.Imsak),
          _cardPrayTime("Sunrise", data.Sunrise),
          _cardPrayTime("Fajr", data.Fajr),
          _cardPrayTime("Dhuhr", data.Dhuhr),
          _cardPrayTime("Asr", data.Asr),
          _cardPrayTime("Sunset", data.Sunset),
          _cardPrayTime("Maghrib", data.Maghrib),
          _cardPrayTime("Isha", data.Isha),
          _cardPrayTime("Midnight", data.Midnight),
        ],
      ),
    );
  }

  _cardPrayTime(String key, String value) {
    return Container(
      width: double.infinity,
      child: Card(
        color: Colors.grey[200],
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                key,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 5),
                child: Text(
                  value,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
