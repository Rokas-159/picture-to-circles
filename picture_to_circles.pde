import java.util.Map;

final int CIRCLE_RADIUS = 20;
final int GAP_X = 30;
final int GAP_Y = 12;
final int X_OFFSET = 5;
final int Y_OFFSET = 5;

final Boolean INTERCHANGE = false;

// max 16.777.216 circles

PImage img;

HashMap<Integer, ArrayList<Integer>> pixel_list = new HashMap<Integer, ArrayList<Integer>>();
HashMap<Integer, Integer> average_colors = new HashMap<Integer, Integer>();

void setup() {
  size(1200, 800);
  img = loadImage("data/baloon.jpg");
  randomSeed(2024);
  
  smooth(0);
  drawCircles();
  
  
  loadPixels();
  img.loadPixels();
  
  for (int i = 0; i < pixels.length; i++) {
    color c = pixels[i];
    Integer circleRgb = rgb(c);
    
    c = img.pixels[i];
    Integer imgRgb = rgb(c);
    
    if (pixel_list.containsKey(circleRgb)) {
      pixel_list.get(circleRgb).add(imgRgb);
    } else {
      ArrayList<Integer> newArray = new ArrayList<Integer>();
      newArray.add(imgRgb);
      pixel_list.put(circleRgb, newArray);
    }
  }
  
  for (Integer k : pixel_list.keySet()) {
    int avg_r = 0;
    int avg_g = 0;
    int avg_b = 0;
    
    for (Integer v : pixel_list.get(k)) {
      avg_r += v >> 16 & 0xFF;
      avg_g += v >> 8 & 0xFF;
      avg_b += v & 0xFF;
    }
    
    int l = pixel_list.get(k).size();
    
    Integer newRgb = ((((avg_r / l) * 256) + (avg_g / l)) * 256) + (avg_b / l);
    average_colors.put(k, newRgb);
  }
  
  for (int i = 0; i < pixels.length; i++) {
    color c = pixels[i];
    Integer circleRgb = rgb(c);
    
    Integer newRgb = average_colors.get(circleRgb);
    int r = newRgb >> 16 & 0xFF;
    int g = newRgb >> 8 & 0xFF;
    int b = newRgb & 0xFF;
    
    color new_c = color(r, g, b);
    pixels[i] = new_c;
  }
  
  updatePixels();
  
  save("output.jpg");
}

Integer rgb(color c) {
  return c;
}

void drawCircles() {
  int circleId = 0;
  for (int y = 0; y < height+CIRCLE_RADIUS; y+=GAP_Y) {
    int lineOffset;
    if (INTERCHANGE) lineOffset = (GAP_X / 2) * ((y/GAP_Y)%2);
    else lineOffset = int(random(GAP_X));
    
    for (int x = -lineOffset; x < width+CIRCLE_RADIUS; x+=GAP_X) {
      int offsetX = int(random(-X_OFFSET, X_OFFSET+1));
      int offsetY = int(random(-Y_OFFSET, Y_OFFSET+1));
      drawCircle(x+offsetX, y+offsetY, circleId);
      circleId++;
    }
  }
}

void drawCircle(int x, int y, int id) {
   int r = id >> 16 & 0xFF;
   int g = id >> 8 & 0xFF;
   int b = id & 0xFF;
   color c = color(r, g, b);
   fill(c);
   noStroke();
   circle(x, y, CIRCLE_RADIUS*2);
}
