class Contact {
  String name = "";
  String msg = "";
  String minutes = "";
  String image = "";

  Contact(
      {required this.name,
      required this.msg,
      required this.image,
      required this.minutes});
}

List<Contact> ContactList = [
  Contact(
      name: "Anandi",
      msg: "Hello Good Morning",
      image: "assets/person1.jpg",
      minutes: "44 minutes ago"),
  Contact(
      name: "Mona",
      msg: "Hii",
      image: "assets/person2.jpg",
      minutes: "12 minutes ago"),
  Contact(
      name: "Niyati",
      msg: "How can i help you?",
      image: "assets/person3.jpg",
      minutes: "18 minutes ago"),
  Contact(
      name: "Krupali",
      msg: "flutter go rock!!",
      image: "assets/person4.jpg",
      minutes: "42 minutes ago"),
  Contact(
    name: "Astha",
    msg: "How are you?",
    image: "assets/person5.jpg",
    minutes: "44 minutes ago",
  ),
  Contact(
      name: "Arshi",
      msg: "What are you doing?",
      image: "assets/person6.jpg",
      minutes: "3 minutes ago"),
  Contact(
      name: "Dhruvi",
      msg: "project",
      image: "assets/person7.png",
      minutes: "20 minutes ago"),
];
