library textblock;

import 'dart:html';
import 'dart:math';

import 'Coord.dart';
import 'IRenderable.dart';
import 'TextGenerator.dart';

class TextBlock implements IRenderable
{
  int rId = 0;
  String blockText = '';
  Coord pos;
  
  int maxTextSize = 88;
  int minTextSize = 24;
  int textSize = 0;
  
  String color;
  
  TextBlock(int id, String text, Coord startPos)
  {
    rId = id;
    setText(text);
    pos = startPos;
    resetColor();
    resetTextSize();
  }
  
  void setText(String text)
  {
    blockText = text;
  }
  
  void update(CanvasRenderingContext2D context)
  {
    resetPos();
    resetColor();
    resetTextSize();
    resetText();
  }
  
  void updateAndRender(CanvasRenderingContext2D context)
  {
    update(context);
    render(context);
  }
  
  void render(CanvasRenderingContext2D context)
  {
    context.fillStyle = color;
    context.font = "bold " + textSize.toString() + "px Comic Sans MS";
    context.fillText(blockText, pos.x, pos.y);
  }
  
  void resetPos()
  {
    pos = new Coord.withValues(new Random().nextInt(window.innerWidth), new Random().nextInt(window.innerHeight));
  }
  
  void resetColor()
  {
    color = getRandomColor();
  }
  
  void resetTextSize()
  {
    textSize = new Random().nextInt(maxTextSize);
    if (textSize < minTextSize)
    {
      textSize = minTextSize;
    }
  }
  
  void resetText()
  {
    blockText = new TextGenerator().generateText();
  }
  
  String getRandomColor()
  {
    return "#" + new Random().nextInt(99).toString() + new Random().nextInt(99).toString() + new Random().nextInt(99).toString();
  }
}