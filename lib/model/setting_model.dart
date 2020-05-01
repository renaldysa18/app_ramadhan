class SettingModel {
  String _timeformat;
  String _school;
  String _juristic;
  String _highlat;
  double _fajrAngle;
  double _ishaAngle;

  SettingModel.parseJson(data){
    _timeformat = data['timeformat'] ? data['timeformat'] : null;
    _school = data['school'] ? data['school'] : null;
    _juristic = data['juristic'] ? data['juristic'] : null;
    _highlat = data['highlat'] ? data['highlat'] : null;
    _fajrAngle = data['fajr_angle'] ? data['fajr_angle'] : null;
    _ishaAngle = data['isha_angle'] ? data['isha_angle'] : null;
  }

  String get timeformat => _timeformat;
  String get school => _school;
  String get juristic => _juristic;
  String get highlat => _highlat;
  double get fajr_angle => _fajrAngle;
  double get isha_angle => _ishaAngle;

}