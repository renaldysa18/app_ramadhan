import 'package:appramadan/model/main_model.dart';
import 'package:appramadan/persistance/repository.dart';
import 'package:rxdart/rxdart.dart';

class PrayBloc {
  Repository _repository = Repository();
  final _prayFetcher = PublishSubject<MainModel>();

  Observable<MainModel> get praytime => _prayFetcher.stream;

  fetchPrayTime({String city, String date}) async {
    MainModel data = await _repository.fetchPrayTime(city: city, date: date);
    _prayFetcher.sink.add(data);
  }

  dispose(){
    _prayFetcher.close();
  }
}

final prayBloc = PrayBloc();