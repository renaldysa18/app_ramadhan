class LocationModel {
  double _latitude;
  double _longitude;
  double _elevation;
  String _city;
  String _country;
  String _country_code;
  String _timezone;
  double _localOffset;

  LocationModel.parseJson(data){
    _latitude = data['latitude'] != null ? data['latitude'] : null;
    _longitude = data['longitude'] != null ? data['longitude'] : null;
    _elevation = data['elevation'] != null ? data['elevation'] : null;
    _city = data['city']!= null ? data['city'] : null;
    _country = data['country'] != null? data['country'] : null;
    _country_code = data['country_code'] != null? data['country_code'] : null;
    _timezone = data['timezone'] != null? data['timezone'] : null;
    _localOffset = data['local_offset'] != null? data['local_offset'] : null;
  }

  double get latitude => _latitude;
  double get longitude => _longitude;
  double get elevation => _elevation;
  String get city => _city;
  String get country => _country;
  String get country_code => _country_code;
  String get timezone => _timezone;
  double get local_offset => _localOffset;
}