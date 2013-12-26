library irenderable;

import 'dart:html';

abstract class IRenderable
{
  int rId;
  
  void update(CanvasRenderingContext2D context);
  
  void updateAndRender(CanvasRenderingContext2D context);
  
  void render(CanvasRenderingContext2D context);
}