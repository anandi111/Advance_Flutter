class Contact {
  String name = "";
  String msg = "";
  String image = "";

  Contact({required this.name, required this.msg, required this.image});
}

List<Contact> ContactList = [
  Contact(
      name: "Anandi", msg: "Hello Good Morning", image: "assets/person1.jpg"),
  Contact(name: "Mona", msg: "Hii", image: "assets/person2.jpg"),
  Contact(
      name: "Niyati", msg: "How can i help you?", image: "assets/person3.jpg"),
  Contact(
      name: "Krupali", msg: "flutter go rock!!", image: "assets/person4.jpg"),
  Contact(name: "Astha", msg: "How are you?", image: "assets/person5.jpg"),
  Contact(
      name: "Arshi", msg: "What are you doing?", image: "assets/person6.jpg"),
  Contact(name: "Dhruvi", msg: "project", image: "assets/person7.png"),
];
