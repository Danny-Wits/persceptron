class MLNet{
int inputN;
int hiddenN;
int outputN;
float learnRate=0.1;
Matrix weightsI2H;
Matrix weightsH2O;

MLNet(int i,int h,int o){
inputN=i;
hiddenN=h;
outputN=o;
SetNet();
}
void SetNet(){
weightsI2H=new Matrix(new float[hiddenN][inputN]);
weightsI2H.randomize(-1,1);
weightsH2O=new Matrix(new float[outputN][hiddenN]);
weightsH2O.randomize(-1,1);

}
float feedForward(Matrix input){
 Matrix hidden = weightsI2H.multiply(input);
 hidden.activation();
 Matrix Output = weightsH2O.multiply(hidden);
 Output.activation();
 return Output.data[0][0];
}
void train(Point p){
 
     float guess = feedForward(p.toMatrix());
     float error = p.type-guess;
     float w1=weightsH2O.data[0][0];
     float w2=weightsH2O.data[0][1];
     float h1= w1/(w2+w1)*error; 
     float h2= w2/(w2+w1)*error; 
     Matrix hidden = weightsI2H.multiply(p.toMatrix());
     hidden.activation();
     for(int i=0;i<weightsH2O.data[0].length;i++){
        weightsH2O.data[0][i]+=learnRate*h1*hidden.data[i][0];
     } 
}
}
