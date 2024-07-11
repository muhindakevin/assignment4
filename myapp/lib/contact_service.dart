import 'package:contacts_service/contacts_service.dart';
import 'package:permission_handler/permission_handler.dart';

Future<void> getContacts() async {
  if (await Permission.contacts.request().isGranted) {
    Iterable<Contact> contacts = await ContactsService.getContacts();
    for (var contact in contacts) {
      print(contact.displayName);
    }
  }
}
