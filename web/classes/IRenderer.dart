library irenderer;

import 'dart:html';

import 'IRenderable.dart';

abstract class IRenderer
{
  List<IRenderable> items = new List<IRenderable>();
  
  void addNew();
  void addExisting(IRenderable d);
  void update(CanvasRenderingContext2D ctx);
}