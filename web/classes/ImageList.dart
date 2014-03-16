library imageList;

import 'dart:math';

class ImageList
{
  List<String> imageNames = new List<String>();
  
  ImageList()
  {
    imageNames.add('dogeOne');
    imageNames.add('dogeTwo');
    imageNames.add('dogeThree');
    imageNames.add('dogette');
  }
  
  String getRandomImage()
  {
    return imageNames[new Random().nextInt(imageNames.length)];
  }
  
  String getSpecificImage(int index)
  {
    if (index < 0 || index > (imageNames.length - 1))
    {
      throw 'ImageList::getSpecificImage() - index parameter out of range.';
    }
    return imageNames[index];
  }
  
  void addImage(String imageName)
  {
    imageNames.add(imageName);
  }
  
  void removeImage(int index)
  {
    if (index < 0 || index > (imageNames.length - 1))
    {
      throw 'ImageList::removeImage() - index parameter out of range.';
    }
    imageNames.removeAt(index);
  }
}