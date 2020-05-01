import 'package:appramadan/model/date_model.dart';
import 'package:appramadan/model/time_model.dart';

class DateTimeModel {
  DateModel _dateModel;
  TimeModel _timeModel;

  DateTimeModel.parseJson(data){
    _timeModel = data['times'] ? data['times'] : null;
    _dateModel = data['dates'] ? data['dates'] : null;
  }

  DateModel get dates => _dateModel;
  TimeModel get times => _timeModel;
}