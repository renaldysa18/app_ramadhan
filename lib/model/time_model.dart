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
    _imsak = data['Imsak'] != null? data['Imsak'] : null;
    _sunrise = data['Sunrise'] != null? data['Sunrise'] : null;
    _fajr = data['Fajr'] != null? data['Fajr'] : null;
    _dhuhr = data['Dhuhr'] != null? data['Dhuhr'] : null;
    _asr = data['Asr'] != null? data['Asr'] : null;
    _sunset = data['Sunset'] != null? data['Sunset'] : null;
    _maghrib = data['Maghrib']!= null ? data['Maghrib'] : null;
    _isha = data['Isha'] != null? data['Isha'] : null;
    _midnight = data['Midnight']!= null ? data['Midnight'] : null;
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