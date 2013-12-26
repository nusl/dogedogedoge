library textrenderer;

import 'dart:html';
import 'dart:math';

import 'Coord.dart';
import 'IRenderer.dart';
import 'TextBlock.dart';
import 'TextGenerator.dart';

class TextRenderer implements IRenderer
{
  List<TextBlock> items = new List<TextBlock>();
  
  DateTime lastUpdateTime;
  Duration updateInterval = new Duration(milliseconds:500);
  
  int renderedCount = 0;
  int currentItem = 0;
  
  TextRenderer.withTextItems(int itemCount)
  {
    resetLastUpdateTime();
    
    for (int i = 0; i < itemCount; ++i)
    {
      addNew();
    }
  }
  
  void addNew()
  {
    items.add(new TextBlock(items.length, new TextGenerator().generateText(), new Coord.withValues(new Random().nextInt(window.innerWidth), new Random().nextInt(window.innerHeight))));
  }
  
  void addExisting(TextBlock b)
  {
    b.rId = items.length;
    items.add(b);
  }
  
  void update(CanvasRenderingContext2D ctx)
  {
      if (new DateTime.now().difference(lastUpdateTime) >= updateInterval)
      {
        items[currentItem].update(ctx);
        currentItem = (currentItem == items.length - 1) ? 0 : currentItem + 1;
        renderedCount = (renderedCount == items.length - 1) ? renderedCount : renderedCount + 1;
        resetLastUpdateTime();
      }
      for (int i = 0; i < renderedCount; ++i)
      {
        items[i].render(ctx);
      }
  }
  
  void resetLastUpdateTime()
  {
    lastUpdateTime = new DateTime.now();
  }
}