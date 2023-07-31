import '../../src/ioservice/ioconsole..dart';
import '../../src/model/contact.dart';

class ContactList {
  final List<Contact> _contactlist = [];
  IoConsole io;
  ContactList(this.io);

  void delete(Contact contact) {
    _contactlist.remove(contact);
  }

  void deleteById(int id) {
    checkContact();
    _contactlist.removeWhere((e) => e.id == id);
  }

  Contact? findById(int id) {
    return _contactlist.where((e) => e.id == id).first;
  }

  void showList() {
    checkContact();
    for (var element in _contactlist) {
      io.write("$element \n");
    }
  }

  void add(Contact contact) {
    _contactlist.add(contact);
  }

  int maxId() {
    int n = 1;
    List<Contact> contactList = _contactlist.toList();
    if (contactList.isNotEmpty) {
      n = contactList[0].id + 1;
    }
    return n;
  }

  bool isExistId(int id) {
    for (var i = 0; i < _contactlist.toList().length; i++) {
      if (_contactlist.toList()[i].id == id) {
        return true;
      }
    }
    return false;
  }

  void checkContact() {
    if (_contactlist.isEmpty) {
      io.write("Contact don't exist");
      return;
    }
  }
}
