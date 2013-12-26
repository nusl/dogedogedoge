library textgenerator;

import 'dart:math';

class TextGenerator
{
  List<String> singleStrings = ["wow", "to the moon!"];
  List<String> prefixStrings = ["such", "many", "very", "so", "much"];
  List<String> suffixStrings = ["doge", "coin", "dogecoin", "rich", "poor", "doges", "money", "moon", "wisdom", "rise", "round"];
  
  Random rand = new Random();
  
  String generateText()
  {
    // Roll for a single string
    if (rand.nextInt(100) < 20)
    {
      return singleStrings[rand.nextInt(singleStrings.length)];
    }
    
    // Return a string with prefix and suffix(such string, wow)
    return prefixStrings[rand.nextInt(prefixStrings.length)] + " " + suffixStrings[rand.nextInt(suffixStrings.length)];
  }
}