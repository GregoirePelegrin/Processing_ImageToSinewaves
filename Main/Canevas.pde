class Canevas{
    Point center;
    int mini;
    ArrayList<Pixel> pixs;

    Canevas(Point _c){
        this.center = _c;

        this.mini = 30;
        this.pixs = new ArrayList<Pixel>();
        this.populate();
    }

    void display(){
        for(Pixel pixel : this.pixs)
            pixel.displaySine();
    }
    void populate(){
        int pixWidth = this.mini;
        int pixHeight = int(height*float(this.mini)/width);
        float pixSizeW = width*1.0/pixWidth;
        float pixSizeH = height*1.0/pixHeight;
        for(int i=0; i<pixWidth; i++)
            for(int j=0; j<pixHeight; j++)
                this.pixs.add(new Pixel(new Point((i+0.5)*pixSizeW, (j+0.5)*pixSizeH), pixSizeW, pixSizeH));
    }
    void update(int _mini){
        this.mini = _mini;
        this.pixs.clear();
        this.populate();
    }
}