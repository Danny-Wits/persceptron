class Point{
  public float x;
  public float y;
  public float[] cords=new float[3];
 
  public int type;
  public float px;
  public float py;
  Point(float _x ,float _y){
  x=_x;
  y=_y;
  type=(realFunction(x)>y)?1:-1;
  toPixel();
  }
  Point(){
  x=random(-100,100);
  y=random(-100,100);
  this.type=(realFunction(x)>y)?1:-1;
  toPixel();
  }
  void toPixel(){
  this.px=map(x,-100,100,0,width-200);
  this.py=map(y,-100,100,height,0);
  this.cords[0]=x;
  this.cords[1]=y;
  this.cords[2]=1;
}
  
  void show(){
   strokeWeight(2);
    if(type==1){
    stroke(255,255,0);
    }else{
      stroke(0,0,255);
    }
    noFill();
    ellipse(px,py,15,15);
  }
}
public static float realFunction(float x){
  return 0.5*x-1;
}
