class DateModel {
  String _gregorian;
  String _hijri;

  DateModel.parseJson(data){
    _gregorian = data['gregorian'] != null ? data['gregorian'] : null;
    _hijri = data['hijri'] != null ? data['hijri'] : null;
  }

  String get gregorian => _gregorian;
  String get hijri => _hijri;
}