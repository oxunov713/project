import 'features/create_contact/create_contact.dart';
import 'features/list/contactlist.dart';
import 'src/ioservice/ioconsole..dart';
import 'src/widget/widget.dart';

void main() {
final ioConsole=IoConsole();
  runApp(CreateContact(
    io: ioConsole,
    contactList: ContactList(ioConsole),
  ));
}
