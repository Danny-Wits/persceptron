class nNetwork{
  private float[] weights=new float[3];
  private float learnRate=0.01;
  public boolean learnt=false;
  nNetwork(){
    //randomising weights
  weights[0]=random(-1,1);
  weights[1]=random(-1,1);
  weights[2]=random(-1,1);  
  }
  int guess(Point p){
    int sum =0;
    //calculating output
    for(int i=0;i<weights.length;i++){
     sum+= p.cords[i]*weights[i];
    }
    //calling activation function on the sum 
    return signum(sum);
  }
  //activation functions
   int signum(float x){
   if(x>0){
   return 1;}
   else{
   return -1;}
   }
   void train(Point p){
     if(!learnt){
     int guess = guess(p);
     int error = p.type-guess;
     if(error!=0){
       for(int i=0;i<weights.length;i++){
       weights[i]+=p.cords[i]*error*learnRate;
       println(weights);
       learnt=false;
      }
     }  
     }
       
   }
   
   void show(){
   push();
   for(int i=0;i<weights.length;i++){
    if(weights[i]<0){
        strokeWeight(-1*weights[i]/2);
        stroke(255,0,0);
    }else{
        strokeWeight(weights[i]/2);
       stroke(0,255,0);
    }
    noFill();
    ellipse(width-150+(i*50),50,20,20);
    line(width-150+(i*50),50,width-100,400);
   }
   pop();
    textSize(18);
    fill(255);
    text("OUT",width-110,405);
    noFill();
    ellipse(width-100,400,30,30);
   }
   float guessY(float x){
     float slope=weights[0]/weights[1];
     float intercept=weights[2]/weights[1];
     return -intercept-(slope*x);
   }
}
