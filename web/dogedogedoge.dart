import 'dart:html';

import 'classes/Pound.dart';
import 'classes/TextRenderer.dart';

CanvasElement c;
CanvasRenderingContext2D ctx;
Pound p;
TextRenderer t;

void main() {
  c = document.querySelector('#canvas');
  ctx = c.getContext('2d');

  c.onClick.listen(clickEvent);
  
  p = new Pound.withDoges(16);
  t = new TextRenderer.withTextItems(7);
  
  c.width = window.innerWidth;
  c.height = window.innerHeight;
  
  window.animationFrame.then(draw);
}

void draw(num _)
{
  c.width = window.innerWidth;
  c.height = window.innerHeight;
  p.update(ctx);
  t.update(ctx);
  window.animationFrame.then(draw);
}

void clickEvent(MouseEvent me)
{
  p.addNew();
}