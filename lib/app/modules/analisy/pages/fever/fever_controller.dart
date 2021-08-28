import 'package:covid19app/app/modules/analisy/analisy_controller.dart';
import 'package:covid19app/app/modules/analisy/analisy_module.dart';
import 'package:mobx/mobx.dart';

part 'fever_controller.g.dart';

class FeverController = _FeverControllerBase with _$FeverController;

abstract class _FeverControllerBase with Store {
  final _controller = AnalisyModule.to.get<AnalisyController>();
  @computed
  bool get validateForm {
    if (_controller.feverValue != null) {
      if (_controller.validateFever == null) {
        return true;
      }
    }
    return false;
  }
}
