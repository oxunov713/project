class Contact {
  int id;
  String name;
  String phoneNumber;
  String email;

  Contact({
    required this.id,
    required this.name,
    required this.phoneNumber,
    required this.email,
  });
@override
  String toString()  => "Name: $name\nPhone number : $phoneNumber\nEmail : $email\n";
}
