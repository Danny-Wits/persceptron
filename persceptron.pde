//Dataset
Point[]data=new Point[100];
nNetwork ai;
MLNet  ML;
int c;

void setup(){
  //setting window
  size(1000,800);
  //init Points 
  for(int i=0;i<data.length;i++){
   data[i]=new Point();
   
  }
  
  ai= new nNetwork();
  c=0;
  
  //init ml
  //ML= new MLNet(3,2,1);
  //c=0;
}
void draw(){
 background(50);
 //diplaying points and teaching NN
 for(Point p:data){
   p.show();
  ai.train(p);
 }
 //ai.train(data[c]);
 //c = (c + 1) % data.length;

 var p1 = new Point(-100,realFunction(-100));
 var p2 = new Point(100,realFunction(100));
 stroke(255);
 line(p1.px,p1.py,p2.px,p2.py);
 
 var p3 = new Point(-100,ai.guessY(-100));
 var p4 = new Point(100,ai.guessY(100));
 stroke(255,255,0);
 line(p3.px,p3.py,p4.px,p4.py);


 for(Point p:data){
 int guess = ai.guess(p);
 int error = p.type-guess;
 if (error==0){
   noStroke();
   fill(0,255,0);
   ellipse(p.px,p.py,7,7);
    }else{
   noStroke();
   fill(255,0,0);
   ellipse(p.px,p.py,7,7);
   }
}
ai.show();
}


void mousePressed() {
  //training
  int i = 0;
 for(Point p:data){
 // ai.train(p);
  //i++;
 }
 println(i);
}
