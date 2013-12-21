library doge;

import 'dart:html';
import 'dart:math';

import 'Coord.dart';

class Doge
{
  // ID of current doge
  int dogeId = 0;
  // Position of this doge on the canvas
  Coord pos;
  // Image for this doge to render
  ImageElement image;
  
  int maxSpeed = 10;
  int lateralMoveSpeed;
  int verticalMoveSpeed;
  
  num rotation = 0;
  num rotationSpeed = 0;
  
  Doge(int id, String imageName, Coord startPos)
  {
    rotationSpeed = new Random().nextDouble() * (PI / 45);
    calculateMoveSpeed();
    dogeId = id;
    image = document.querySelector('#' + imageName);
    
    pos = startPos;
  }
  
  void updateAndRender(CanvasRenderingContext2D context)
  {
    // Collision. Wow, such bounce.
    if (pos.x > window.innerWidth || pos.x < 0)
    {
      lateralMoveSpeed = -lateralMoveSpeed;
    }
    if (pos.y > window.innerHeight || pos.y < 0)
    {
      verticalMoveSpeed = -verticalMoveSpeed;
    }
    
    // Movement. Very pixel.
    pos.x += lateralMoveSpeed;
    pos.y += verticalMoveSpeed;
    
    render(context);
  }
  
  void render(CanvasRenderingContext2D context)
  {
    context.save();
    context.beginPath();
    context.translate(pos.x , pos.y);
    context.rotate(rotation);
    rotation += rotationSpeed;
    context.drawImage(image,-image.width/2,-image.width/2);
    context.closePath();
    context.restore();
  }
  
  void calculateMoveSpeed()
  {
    lateralMoveSpeed = new Random().nextInt(2 * maxSpeed);  
    verticalMoveSpeed = new Random().nextInt(2 * maxSpeed);
    
    if (lateralMoveSpeed < maxSpeed) lateralMoveSpeed = (maxSpeed - lateralMoveSpeed);
    if (verticalMoveSpeed < maxSpeed) verticalMoveSpeed = (maxSpeed - verticalMoveSpeed);
  }
}