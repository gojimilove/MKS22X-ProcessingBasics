int MAX_VALUE = 100;
int MIN_VALUE = -100;
Visualizer v;

/*You are simulating a visualizer of multiple values
 You need to create a display method first. 
 Then you can make a method that changes the values each time the update is called. 
 */
class Visualizer {
  float x, y, boxX, boxY;
  int size;
  float [] values;
  float [] speeds;
  Visualizer(float x, float y) {
    this.x = x;
    this.y = y;
    //size = int(random(1, 41));
    size = 40;
    values = new float[size];
    speeds = new float[size];
    for (int i = 0; i < values.length; i++) {
      values[i] = random(-99,99);
      speeds[i] = random(2);
    }
  }

  void display(float a, float b) {
    //draw the bars equally spaced inside this box. 
    //You can assume 10, but it would be even better 
    //if you could modify it to be larger increments.
    boxX = a;
    boxY = b;
    fill(255);
    rect(x, y, boxX, boxY);
    //This is a 200x400 box.
    //The width of the visualizer is 400! This rect is the border

    //the line is the 0 y-value, the top is 100, the bottom is -100
    line(x, y+(boxY/2), x+(boxX/2), y+(boxY/2));

    //You need to use a loop. You need to make the HEIGHT of the bars 
    //the values in the array.
    //Negative values are red, and go below the line.
    //Positive values are green and go above the line.
    //???WRITE THIS METHOD FIRST!!!
    
    float w = 0;
    float change = boxX/(values.length);
    for (int i = 0; i < values.length; i++) {
      if (values[i] < 0) {
        fill(255, 0, 0);
        rect(x+w, y+(boxY/2), change, -values[i]);
      }else {
        fill(0, 255, 0);
        rect(x+w, y+((boxY/2)-values[i]), change, values[i]);
      }
      w+=change;
    }

    //Width of the visualizer is 400!

  
  }
  void update() {
    //???WRITE THIS METHOD SECOND!!!
    for (int i = 0; i < values.length; i++) {
      values[i] += speeds[i]; //the speed updates the values. Do not touch this.
      //??? keep them values between max/min value so they stay in the box.
      //??? reverse the speeds so the bar oscillates up/down when it reaches max/min
      if (values[i] >= (boxY/2) || values[i] <= -1*(boxY/2)) {
        speeds[i] = -1*speeds[i];
      }
    }
  }
}

void setup() {
  size(600, 500);
  v = new Visualizer(20, 20);
}
void draw() {
  background(255);
  v.display(400, 200);
  v.update();
}