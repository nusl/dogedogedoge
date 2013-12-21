library pound;

import 'dart:html';

import 'Doge.dart';
import 'DogeFactory.dart';

class Pound
{
  List<Doge> doges = new List<Doge>();
  
  Pound()
  {
    
  }
  
  Pound.withDoges(int howManyDoges)
  {
    DogeFactory fact = new DogeFactory();
    for (int i = 0; i < howManyDoges; ++i)
    {
      doges.add(fact.createDoge(i));
    }
  }
  
  void addNewDoge()
  {
    DogeFactory fact = new DogeFactory();
    doges.add(fact.createDoge(doges.length));
  }
  
  void addExistingDoge(Doge d)
  {
    d.dogeId = doges.length;
    doges.add(d);
  }
  
  void update(CanvasRenderingContext2D ctx)
  {
    for (Doge d in doges)
    {
      d.updateAndRender(ctx);
    }
  }
}