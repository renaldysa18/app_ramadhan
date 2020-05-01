import 'package:appramadan/model/datetime_model.dart';
import 'package:appramadan/model/location_model.dart';
import 'package:appramadan/model/setting_model.dart';

class ResultModel {
  LocationModel _locationModel;
  SettingModel _settingModel;
  List<DateTimeModel> _dateTimes;

  ResultModel.parseJson(data){
    _locationModel = data['location'] ? data['location'] : null;
    _settingModel = data['settings'] ? data['settings'] : null;

    List<DateTimeModel> temp = [];
    for(int i = 0; i < data['datetime'].length; i++){
      DateTimeModel _datetime = DateTimeModel.parseJson(data['datetime'][i]);
      temp.add(_datetime);
    }
    _dateTimes = temp;
  }

  LocationModel get location => _locationModel;
  SettingModel get settings => _settingModel;
  List<DateTimeModel> get datetime => _dateTimes;
}