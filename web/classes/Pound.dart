library pound;

import 'dart:html';

import 'Doge.dart';
import 'DogeFactory.dart';

class Pound
{
  List<Doge> items = new List<Doge>();
  
  Pound()
  {
    
  }
  
  Pound.withDoges(int howManyDoges)
  {
    DogeFactory fact = new DogeFactory();
    for (int i = 0; i < howManyDoges; ++i)
    {
      items.add(fact.createDoge(i));
    }
  }
  
  void addNew()
  {
    DogeFactory fact = new DogeFactory();
    items.add(fact.createDoge(items.length));
  }
  
  void addExisting(Doge d)
  {
    d.rId = items.length;
    items.add(d);
  }
  
  void update(CanvasRenderingContext2D ctx)
  {
    for (Doge d in items)
    {
      d.updateAndRender(ctx);
    }
  }
}