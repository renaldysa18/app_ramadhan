class TimeModel {
  String _imsak;
  String _sunrise;
  String _fajr;
  String _dhuhr;
  String _asr;
  String _sunset;
  String _maghrib;
  String _isha;
  String _midnight;

  TimeModel.parseJson(data){
    _imsak = data['Imsak'] ? data['Imsak'] : null;
    _sunrise = data['Sunrise'] ? data['Sunrise'] : null;
    _fajr = data['Fajr'] ? data['Fajr'] : null;
    _dhuhr = data['Dhuhr'] ? data['Dhuhr'] : null;
    _asr = data['Asr'] ? data['Asr'] : null;
    _sunset = data['Sunset'] ? data['Sunset'] : null;
    _maghrib = data['Maghrib'] ? data['Maghrib'] : null;
    _isha = data['Isha'] ? data['Isha'] : null;
    _midnight = data['Midnight'] ? data['Midnight'] : null;
  }

  String get Imsak => _imsak;
  String get Sunrise => _sunrise;
  String get Fajr => _fajr;
  String get Dhuhr => _dhuhr;
  String get Asr => _asr;
  String get Sunset => _sunset;
  String get Maghrib => _maghrib;
  String get Isha => _isha;
  String get Midnight => _midnight;

}