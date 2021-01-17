import java.util.ArrayList;
import oscP5.*;
import netP5.*;

ArrayList<Box> list;
PGraphics front;
OscP5 osc;


void setup() {
  // size(800, 600);
  fullScreen();
  list = new ArrayList<Box>();
  front = createGraphics(width, height);
  osc = new OscP5(this, 54110);
}

void draw() {
  background(0);
  ArrayList<Box> temp = new ArrayList<Box>();

  front.beginDraw();
  front.fill(0, 3);
  front.rect(0, 0, width, height);

  synchronized(list) {
    for (Box b : list) {
      b.draw(front); 
      if (b.isDead()) {
        temp.add(b);
      }
    }
  }
  for (Box b : temp) {
    list.remove(b);
  }

  front.endDraw();

  image(front, 0, 0);
}


void oscEvent(OscMessage m) {
  String addr = m.addrPattern();
  synchronized(list) {
    if (addr.equals("/circle")) {
      list.add(new Box(int(random(width)), int(random(height))));
    }
    else if (addr.equals("/rgb_circle")) {
       list.add(new Box(color(m.get(0).floatValue(), m.get(1).floatValue(), m.get(2).floatValue()))); 
    }
    else if (addr.equals("/pos_circle")) {
       list.add(new Box(int(m.get(0).floatValue()), int(m.get(1).floatValue()))); 
    }
  }
}
