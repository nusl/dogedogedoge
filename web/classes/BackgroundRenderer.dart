library backgroundrenderer;

import 'dart:html';
import 'dart:math';

class BackgroundRenderer
{
  // Image for the moon to render
  ImageElement moonImage;
  
  BackgroundRenderer()
  {
    moonImage = document.querySelector('#moge');
  }
  
  void render(CanvasRenderingContext2D ctx, CanvasElement c)
  {
    // Background gradient
    ctx.beginPath();
    
    var grd = ctx.createLinearGradient(c.width / 2, c.height, c.width / 2, 0);
    
    grd.addColorStop(0.060, 'rgba(255, 255, 255, 1.000)');
    grd.addColorStop(0.205, 'rgba(14, 196, 206, 1.000)');
    grd.addColorStop(0.425, 'rgba(0, 85, 170, 1.000)');
    grd.addColorStop(0.855, 'rgba(0, 0, 0, 1.000)');
    
    ctx.fillStyle = grd;
    ctx.fillRect(0, 0, c.width, c.height);
    
    ctx.closePath();
    
    // Moon
    ctx.beginPath();
    
    ctx.drawImage(moonImage,c.width / 1.45, c.height / 6);
    
    ctx.closePath();
  }
}