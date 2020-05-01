import 'package:appramadan/model/result_model.dart';

class MainModel {
  int _code;
  String _status;
  ResultModel _resultModel;

  MainModel.parseJson(data){
    _code = data['code'] ? data['code'] : null;
    _status = data['status'] ? data['status'] : null;
    _resultModel = data['results'] ? data['results'] : null;
  }

  int get code => _code;
  String get status => _status;
  ResultModel get results => _resultModel;

}