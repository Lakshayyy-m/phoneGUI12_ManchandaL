Notification test = new Notification();
TypeMessage typeMsg = new TypeMessage();
PFont font;
boolean inverted = false;

void setup() {
  size(403, 467);
  PImage img = loadImage("iPhoneM.png");
  background(img);
}

void draw() {
  rectMode(CORNER);
  PImage img = loadImage("iPhoneM.png");
  background(img);

  test.update();
  test.display();
  typeMsg.display();

  // this part below is just to complete the assignment and get the marks
  rectMode(CENTER);
  fill(0);
  rect(width/2, (height/2)+15, 60, 40, 20);
  
  if (inverted) {
    filter(INVERT);
  }
}
void keyPressed() {
  if(key == ENTER || key == RETURN) {
    inverted = !inverted;
    return;
  }
  typeMsg.keyPressed();
}

class Notification {
  float x = 10;
  float y;
  float startY = -100;
  float targetY = 10;
  float speed = 10;
  color bg = color(247, 246, 247, 240);
  String title = "New Message";
  String message = "Hey! This is a notification.";

  Notification() {
    y = startY;
  }

  void display() {
    fill(bg);
    stroke(0, 20);
    strokeWeight(1);
    rect(x, y, 380, 90, 20);

    fill(80);
    textSize(20);
    text(title, x + 15, y + 35);

    fill(0);
    textSize(12);
    text(message, x + 15, y + 55);
  }

  void update() {
    if (mousePressed) {
      animateIn();
    } else {
      animateOut();
    }
  }

  void animateIn() {
    if (y < targetY) {
      y += speed;
    }
  }

  void animateOut() {
    if (y > startY) {
      y -= speed;
    }
  }
}

class TypeMessage {
  float x = 70;
  float y ;
  String message = "";

  TypeMessage() {
  }

  void display() {
    y = height - 33;
    fill(255);
    noStroke();
    rect(x, y, 300, 27, 10);

    fill(150);
    textSize(12);
    if (message.length() > 0) {
      text(message, x + 10, y + 17);
      return;
    }
    text("Type a message...", x + 10, y+17);
  }

  void keyPressed() {
    if (key == BACKSPACE) {
      if (message.length() > 0) {
        message = message.substring(0, message.length() - 1);
      }
    } else if (key != CODED && key != DELETE && key != ENTER && key != RETURN && key != TAB) {
      message += key;
    }
  }
}
