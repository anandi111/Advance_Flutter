///Product List Modal Class...
class ProductDetails {
  String name = "";
  String image = "";
  int price = 0;
  ProductDetails(
      {required this.name, required this.price, required this.image});
}

///Product LIst..
List<ProductDetails> productList = [
  ProductDetails(
      name: "Velabon Gettta", price: 123, image: "assests/airpods.jpg"),
  ProductDetails(
      name: "Stell Sunglasses", price: 25, image: "assests/glasses.jpg"),
  ProductDetails(name: "Whitcy belt", price: 54, image: "assests/belt.jpg"),
  ProductDetails(name: "Bolly Bags", price: 88, image: "assests/bag.jpg"),
  ProductDetails(
      name: "Strut Earings", price: 34, image: "assests/errings.jpg"),
  ProductDetails(name: "Varcity Socks", price: 15, image: "assests/socks.jpg"),
  ProductDetails(name: "Tip Toleo", price: 78, image: "assests/towel.jpg"),
  ProductDetails(name: "Premi wengy", price: 45, image: "assests/breshlet.jpg"),
  ProductDetails(
      name: "Weavw Keyring", price: 23, image: "assests/kitchain.jpg"),
  ProductDetails(name: "Golden Chain", price: 89, image: "assests/chain.jpg"),
  ProductDetails(
      name: "Hand Cover", price: 76, image: "assests/cover_home.jpg"),
  ProductDetails(
      name: "Ram Kicker", price: 90, image: "assests/drawer_organizer.jpg"),
  ProductDetails(name: "Vily vovles", price: 45, image: "assests/sendals.jpg"),
];

List<ProductDetails> cartList = [
  ProductDetails(
      name: "Velabon Gettta", price: 123, image: "assests/airpods.jpg"),
];
