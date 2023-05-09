import '../core/global.dart';
import 'package:get_storage/get_storage.dart';

class Storage {
  static final GetStorage instance = GetStorage();
  static final Storage _singleton = Storage._internal();

  factory Storage() {
    return _singleton;
  }

  Storage._internal();

  static getData() {
    if (instance.hasData('user')) {
      Global.user = instance.read('user');
    }
    if (instance.hasData('isLogged')) {
      Global.isLogged = instance.read('isLogged');
    }
  }
}
