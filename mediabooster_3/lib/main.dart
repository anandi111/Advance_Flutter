// 3. Create an app which display Image Gallary in Staggered View. HomePage should
// display all category-wise images in staggered view. After clicking any category-wised
// image, a user should be redirected to new Page which shows slider of that specific
// category-wise images. (As shown in attached image "staggered_ui.jpg")Use external
// packages like: flutter_staggered_grid_view, carousel_slider and carousel_pro

import 'package:flutter/material.dart';
import 'package:mediabooster_3/Screens/homepage.dart';

void main() {
  runApp(const MaterialApp(
    home: HomePage(),
  ));
}
