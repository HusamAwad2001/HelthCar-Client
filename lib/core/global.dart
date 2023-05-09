class Global {
  static final Global _singleton = Global._internal();

  factory Global() {
    return _singleton;
  }

  Global._internal();

  static bool isLogged = false;
  static Map user = {};
}
