import '../../src/ioservice/ioconsole..dart';

IoConsole io = IoConsole();

class Validation {
  const Validation();

  int isTrueChoose(int a) {
    while (true) {
      if (a > 0 && a < 5) {
        break;
      }
      a = io.wrInt("\nNoto'g'ri tanlov qildingiz,iltimos qayta kiriting");
    }
    return a;
  }

  String isTrueName(String s) {
    while (true) {
      if (s.isNotEmpty) {
        break;
      }
      s = io.read("Ism yozilishi shart!");
    }
    return s;
  }

  String isTrueNumber(String n) {
    while (true) {
      if (n.startsWith('+') && n.length == 13) {
        break;
      }
      n = io.read(
          "Raqam + bn boshlanib uzunligi 12 ta raqamdan iborat bo'lishi kerak");
    }
    return n;
  }
}
