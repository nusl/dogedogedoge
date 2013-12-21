import 'dart:html';

import 'classes/Pound.dart';

CanvasElement c;
CanvasRenderingContext2D ctx;
Pound p;

void main() {
  c = document.querySelector('#canvas');
  ctx = c.getContext('2d');

  p = new Pound.withDoges(25);
  
  c.width = window.innerWidth;
  c.height = window.innerHeight;
  
  window.animationFrame.then(draw);
}

void draw(num _)
{
  c.width = window.innerWidth;
  c.height = window.innerHeight;
  p.update(ctx);
  window.animationFrame.then(draw);
}