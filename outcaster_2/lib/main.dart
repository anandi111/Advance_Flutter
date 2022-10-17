/// 2. Create an app which display Cupertino Store layout for various products
/// with only cupertino design UI. An app should have exact UI as shown in
/// attached images. Search functionality may be avoided. But UI is must present.
/// (As shown in images called "products_1", "products_2" and "products_3")

import 'package:flutter/cupertino.dart';
import 'package:outcaster_2/screens/home%20screen.dart';

void main() {
  runApp(const CupertinoApp(
    debugShowCheckedModeBanner: false,
    home: CupertinoStoreHome(),
  ));
}
