Canevas canevas;
PImage photo;

void settings(){
    photo = loadImage("joconde.jpg");
    photo.loadPixels();
    size(photo.width, photo.height);
}
void setup(){
    frameRate(30);
    rectMode(CENTER);
    background(0);

    canevas = new Canevas(new Point(width/2, height/2));
}

void draw(){
    canevas.display();

}

void square(Point c, float s){
    rect(c.x, c.y, s, s);
}
void keyPressed() {
    if(key == '+') canevas.update(canevas.mini + 1);
    else if(key == '-') canevas.update(canevas.mini - 1);
}