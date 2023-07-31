import 'widget.dart';

class Navigator {
  
  List<Widget> pages = [];

  void pop(Widget app) {
    pages.add(app);
  }

  void push() {
    pages.removeLast();
  }
}
