library dogeFactory;

import 'dart:html';
import 'dart:math';

import 'Doge.dart';
import 'ImageList.dart';
import 'Coord.dart';

class DogeFactory
{
  ImageList images = new ImageList();
  
  Doge createDoge(int id)
  {
    return new Doge(id, images.getRandomImage(), new Coord.withValues(new Random().nextInt(window.innerWidth), new Random().nextInt(window.innerHeight)));
  }
}