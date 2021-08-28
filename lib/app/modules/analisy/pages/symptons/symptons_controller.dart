import 'package:mobx/mobx.dart';

part 'symptons_controller.g.dart';

class SymptonsController = _SymptonsControllerBase with _$SymptonsController;

abstract class _SymptonsControllerBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
