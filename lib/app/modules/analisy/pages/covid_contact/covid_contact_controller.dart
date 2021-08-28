import 'package:mobx/mobx.dart';

part 'covid_contact_controller.g.dart';

class CovidContactController = _CovidContactControllerBase
    with _$CovidContactController;

abstract class _CovidContactControllerBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
