import 'package:appramadan/model/result_model.dart';

class MainModel {
  int _code;
  String _status;
  ResultModel _resultModel;

  MainModel.parseJson(Map<String, dynamic> data){
    _code = data['code'] != null ? int.parse(data['code'].toString()) : null;
    _status = data['status'] != null ? data['status'] : null;
    _resultModel = data['results'] != null ? ResultModel.parseJson(data['results']) : null;
  }

  int get code => _code;
  String get status => _status;
  ResultModel get results => _resultModel;

}