import 'dart:io';

import 'ioservise.dart';

class IoConsole implements IOService {
  @override
  String read(String s) {
    print(s);
   return stdin.readLineSync() ?? "";
  }

  @override
  int wrInt(String s) {
    write(s);
    return int.parse(stdin.readLineSync() ?? '');
  }

  @override
  void write(String s) => stdout.write(s);
}
