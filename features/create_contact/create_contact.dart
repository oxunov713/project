import '../../src/ioservice/ioconsole..dart';
import '../../src/model/contact.dart';
import '../../src/widget/widget.dart';
import '../list/contactlist.dart';
import '../valid/validation.dart';

class CreateContact extends Widget {
  IoConsole io;
  Validation valid = Validation();
  ContactList contactList;
  CreateContact({
    required this.io,
    required this.contactList,
  });

  @override
  void build() {
    int choose = io.wrInt("""\t\t\t\tAssalomu alaykum!!!
    1-Add contact
    2-View contact
    3-Edit contact
    4-Delete contact
    """);
    choose = valid.isTrueChoose(choose);

    switch (choose) {
      case 1:
        addContact();
        break;
      case 2:
        contactList.showList();
        break;
      case 3:
        editContact();
        break;
      case 4:
        deleteContact();
        break;
      default:
    }
  }

  void addContact() {
    String name = io.read("Kontakt ismini kiriting: ");
    name = valid.isTrueName(name);

    String phone =
        io.read("Telefon raqamini kiriting: Shu ko'rinishda +998901234567  ");
    phone = valid.isTrueNumber(phone);

    String email = io.read("Emailini kiriting: ");

    Contact contact = Contact(
      id: contactList.maxId(),
      name: name,
      phoneNumber: phone,
      email: email,
    );
    contactList.add(contact);
  }

  void editContact() {
    int id =
        io.wrInt("Tahrirlamoqchi bo'lgan kontaktingizni id sini kiriting: ");
    Contact? contact;
    if (contactList.isExistId(id)) {
      contact = contactList.findById(id);
    }
    if (contact == null) {
      print("Sorry");
      return;
    }
    String name = io.read(
        "Yangi ism kiriting: (${contact.name} o'zgarishi uchun enterni bosing)");

    String phone = io.read(
        "Yangi raqam kiriting: (${contact.phoneNumber} o'zgarishi uchun enterni bosing)");

    String email = io.read(
        "Yangi email kiriting: (${contact.email} o'zgarishi uchun enterni bosing)");
    contact.name = name;
    contact.phoneNumber = phone;
    contact.email = email;

    io.write("Doneeeee");
  }

  void deleteContact() {
    int id =
        io.wrInt("Delete qilmoqchi bo'lgan kontaktning id sini kiriting: ");
    if (contactList.isExistId(id)) {
      Contact? c = contactList.findById(id);
      if (c == null) {
        print("Kontakt mavjud emas");
        return;
      }
      contactList.delete(c);
      print("Done");
    } else {
      print("Don't exist");
    }
  }
}
