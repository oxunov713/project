import 'navigator.dart';

Navigator nav = Navigator();

abstract class Widget {
  const Widget();
  void build();
}

void runApp(Widget app) {
  nav.pop(app);

  while (nav.pages.isNotEmpty) {
    nav.pages.last.build();
  }
}
