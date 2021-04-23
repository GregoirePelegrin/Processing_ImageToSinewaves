class Pixel{
    Point center;
    float pixHeight;
    float pixWidth;

    int[] colRGB;
    int colGRAY;

    Pixel(Point _c, float _w, float _h){
        this.center = _c;
        this.pixHeight = _h;
        this.pixWidth = _w;

        this.colRGB = new int[3];
        this.getColor();
        this.colGRAY = round(0.299*this.colRGB[0] + 0.587*this.colRGB[1] + 0.114*this.colRGB[2]);
    }

    void displayGRAY(){
        noStroke();
        fill(this.colGRAY);
        rect(this.center.x, this.center.y, this.pixWidth, this.pixHeight);
    }
    void displayProportion(){
        noStroke();
        float prop = map(this.colGRAY, 0, 255, 0, this.pixHeight);
        fill(255);
        rect(this.center.x, this.center.y+this.pixHeight/2-prop/2, this.pixWidth, prop);
        fill(0);
        rect(this.center.x, this.center.y-this.pixHeight/2+(this.pixHeight-prop)/2, this.pixWidth, this.pixHeight-prop);
    }
    void displayRGB(){
        noStroke();
        fill(this.colRGB[0], this.colRGB[1], this.colRGB[2]);
        rect(this.center.x, this.center.y, this.pixWidth, this.pixHeight);
    }
    void displaySine(){
        float amp = map(this.colGRAY, 0, 255, 0, 3*this.pixHeight/8);
        float freq = round(map(this.colGRAY, 0, 255, 0, 2));

        fill(0);
        noStroke();
        rect(this.center.x, this.center.y, this.pixWidth, this.pixHeight);

        noFill();
        stroke(this.colRGB[0], this.colRGB[1], this.colRGB[2]);
        strokeWeight(2);
        beginShape();
        for(int i=0; i<=this.pixWidth; i++){
            vertex(this.center.x-this.pixWidth/2+i, this.center.y + amp*sin(TWO_PI*freq*i/this.pixWidth));
        }
        endShape();
    }
    
    void getColor(){
        for(float x=this.center.x-this.pixWidth/2; x<=this.center.x+this.pixWidth/2; x++){
            for(float y=this.center.y-this.pixHeight/2; y<=this.center.y+this.pixHeight/2; y++){
                int currX = round(x);
                int currY = round(y);

                // Get the color
                color colTemp = photo.get(currX, currY);
                this.colRGB[0] += red(colTemp);
                this.colRGB[1] += green(colTemp);
                this.colRGB[2] += blue(colTemp);
                ////////////////
            }
        }
        this.colRGB[0] = round(this.colRGB[0]/(this.pixWidth*this.pixHeight));
        this.colRGB[1] = round(this.colRGB[1]/(this.pixWidth*this.pixHeight));
        this.colRGB[2] = round(this.colRGB[2]/(this.pixWidth*this.pixHeight));
    }
}